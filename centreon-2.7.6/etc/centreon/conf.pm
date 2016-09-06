#############################################
# File Added by Centreon
#

$centreon_config = {
       VarLib => "/var/lib/centreon/",
       CentreonDir => "/usr/share/centreon/",
       "centreon_db" => "centreon",
       "centstorage_db" => "centreon_storage",
       "db_host" => "mysql-centreon:3306",
       "db_user" => "centreon",
       "db_passwd" => "centreon"
};

# Central or Poller ?
$instance_mode = "central";
$cmdFile = "/var/lib/centreon/centcore.cmd";

1;
