<?php
/**
 * Copyright 2005-2015 Centreon
 * Centreon is developped by : Julien Mathis and Romain Le Merlus under
 * GPL Licence 2.0.
 *
 * This program is free software; you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation ; either version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE. See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with
 * this program; if not, see <http://www.gnu.org/licenses>.
 *
 * Linking this program statically or dynamically with other modules is making a
 * combined work based on this program. Thus, the terms and conditions of the GNU
 * General Public License cover the whole combination.
 *
 * As a special exception, the copyright holders of this program give Centreon
 * permission to link this program with independent modules to produce an executable,
 * regardless of the license terms of these independent modules, and to copy and
 * distribute the resulting executable under terms of Centreon choice, provided that
 * Centreon also meet, for each linked independent module, the terms  and conditions
 * of the license of that module. An independent module is a module which is not
 * derived from this program. If you modify this program, you may extend this
 * exception to your version of the program, but you are not obliged to do so. If you
 * do not wish to do so, delete this exception statement from your version.
 *
 * For more information : contact@centreon.com
 *
 */

require_once("centreonUser.class.php");
require_once("centreonGMT.class.php");
require_once("centreonLogAction.class.php");
require_once("centreonExternalCommand.class.php");
require_once("centreonObjects.class.php");
require_once("centreonCache.class.php");
require_once("centreonBroker.class.php");

require_once("centreonHostgroups.class.php");

class Centreon	{

	var $Nagioscfg;
	var $optGen;
	var $redirectTo;
	var $modules;
	var $plugins;
	var $status_graph_service;
	var $status_graph_host;
	var $historyPage;
  	var $historySearch;
  	var $historySearchService;
  	var $historySearchOutput;
	var $historyLimit;
  	var $search_type_service;
	var $search_type_host;
	var $svc_svc_search;
	var $svc_host_search;
	var $poller;
	var $template;
	var $hostgroup;
	var $host_id;

	public $user;
	public $CentreonGMT;
	public $CentreonLogAction;
	public $extCmd;
	public $DB;
	public $config;
	public $session;
	public $lang;
	public $duration;
	public $media;
	public $objects;
	public $cache;
	public $broker;

    /** **************************************
     * Class constructor
     *
     * @access public
	 * @param	object 	$user User objects
	 * @return	object	objet information
     */
	function Centreon($userInfos)	{
		global $pearDB;

		/*
		 * Get User informations
		 */
		$this->user = new CentreonUser($userInfos);

		/*
		 * Get Local nagios.cfg file
		 */
		$this->initNagiosCFG($pearDB);

		/*
		 * Get general options
		 */
		$this->initOptGen($pearDB);

		/*
		 * Grab Modules
		 */
		$this->creatModuleList($pearDB);

		/*
		 * Create GMT object
		 */
		$this->CentreonGMT = new CentreonGMT($pearDB);

		/*
		 * Create LogAction object
		 */
		$this->CentreonLogAction = new CentreonLogAction($this->user);

		/*
		 * Init Poller id
		 */
		$this->poller = 0;

		/*
		 * Init External CMD object
		 */
		$this->extCmd = new CentreonExternalCommand($pearDB);

		/*
		 * Objects
		 */
		$this->objects = new CentreonObjects($pearDB);

		/*
		 * Cache
		 */
		$this->cache = new CentreonCache($pearDB);

		/*
		 * Engine
		 */
		$this->broker = new CentreonBroker($pearDB);
	}

	/**
	 *
	 * Create a list of all module installed into Centreon
	 * @param $pearDB
	 */
	function creatModuleList($pearDB) {
		$this->modules = array();
		$DBRESULT = $pearDB->query("SELECT `name`, `sql_files`, `lang_files`, `php_files` FROM `modules_informations`");
		while ($result = $DBRESULT->fetchRow()){
			$this->modules[$result["name"]] = array("name"=>$result["name"], "gen"=>false, "restart"=>false, "sql"=>$result["sql_files"], "lang"=>$result["lang_files"]);
			if (is_dir("./modules/".$result["name"]."/generate_files/")) {
				$this->modules[$result["name"]]["gen"] = true;
			}
            
            if (is_dir("./modules/" . $result["name"] . "/restart_pollers/")) {
				$this->modules[$result["name"]]["restart"] = true;
			}
		}
		$DBRESULT->free();
	}

	/**
	 *
	 * Create history list
	 */
	function createHistory() {
  		$this->historyPage = array();
  		$this->historySearch = array();
  		$this->historySearchService = array();
  		$this->historySearchOutput = array();
  		$this->historyLimit = array();
  		$this->search_type_service = 1;
  		$this->search_type_host = 1;
  	}

  	/**
  	 *
  	 * Initiate nagios option list
  	 * @param $pearDB
  	 */
	function initNagiosCFG($pearDB = NULL) {

		if (!$pearDB)
			return;

		$this->Nagioscfg = array();
        # We don't check activate because we can a server without a engine on localhost running (but we order to get if we have one)
		$DBRESULT = $pearDB->query("SELECT * FROM cfg_nagios, nagios_server
								    WHERE nagios_server.id = cfg_nagios.nagios_server_id
								    AND nagios_server.localhost = '1' ORDER BY cfg_nagios.nagios_activate DESC LIMIT 1");
		$this->Nagioscfg = $DBRESULT->fetchRow();
		$DBRESULT->free();
	}

	/**
	 *
	 * initiate general option list
	 * @param $pearDB
	 */
	function initOptGen($pearDB = NULL)	{

		if (!$pearDB)
			return;

		$this->optGen = array();
		$DBRESULT = $pearDB->query("SELECT * FROM `options`");
		while ($opt = $DBRESULT->fetchRow()) {
			$this->optGen[$opt["key"]] = $opt["value"];
		}
		$DBRESULT->free();
		unset($opt);
	}

	/**
 	 *
 	 * Check illegal char defined into nagios.cfg file
 	 * @param varchar $name
 	 */
 	public function checkIllegalChar($name) {
 		global $pearDB;

 		$DBRESULT = $pearDB->query("SELECT illegal_object_name_chars FROM cfg_nagios");
		while ($data = $DBRESULT->fetchRow()) {
			$tab = str_split(html_entity_decode($data['illegal_object_name_chars'], ENT_QUOTES, "UTF-8"));
			foreach ($tab as $char) {
				$name = str_replace($char, "", $name);
			}
		}
		$DBRESULT->free();
		return $name;
 	}
}
?>