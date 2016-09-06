<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:variable name="i" select="//i"/>
<xsl:template match="/">
<table class="ListTable">
	<tr class='ListHeader'>
		<td class="ListColHeaderPicker"><input type="checkbox" name="checkall" onclick="checkUncheckAll(this);"/></td>
		<td colspan="3" class="ListColHeaderCenter" style="white-space:nowrap;" id="service_description"></td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;" id="current_state"></td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;" id="last_state_change"></td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;" id="last_check"></td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;" id="current_attempt"></td>
		<td class="ListColHeaderCenter" style="white-space:nowrap;" id="plugin_output"></td>
		<xsl:for-each select="//i">
			<xsl:if test="nc = 1">
				<td class="ListColHeaderCenter" style="white-space:nowrap;" id="next_check">next check</td>
			</xsl:if>
		</xsl:for-each>
	</tr>
	<xsl:for-each select="//l">
	<tr>
		<xsl:attribute name="id">trStatus</xsl:attribute>
  		<xsl:attribute name="class"><xsl:value-of select="@class" /></xsl:attribute>
		<td class="ListColPicker">
			<xsl:element name="input">
				<xsl:attribute name="type">checkbox</xsl:attribute>
				<xsl:attribute name="value">1</xsl:attribute>
				<xsl:attribute name="name">select[<xsl:value-of select="hn"/>;<xsl:value-of select="rsd"/>]</xsl:attribute>
			</xsl:element>
		</td>
		<td class="ListColLeft" style="white-space:nowrap;">
			<xsl:element name="a">
			  	<xsl:attribute name="href">#</xsl:attribute>
				<xsl:attribute name="class">infobulle link_popup_volante</xsl:attribute>
				<xsl:attribute name="id">svc-<xsl:value-of select="hid"/>-<xsl:value-of select="svc_id"/></xsl:attribute>
				<xsl:value-of select="sd" disable-output-escaping="yes" />
			</xsl:element>
		</td>
		<td class="ListColRight">
			<xsl:if test="pa = 1">
					<xsl:element name="img">
					  	<xsl:attribute name="src">./img/icons/technician.png</xsl:attribute>
					  	<xsl:attribute name="title">Problem has been acknowledged</xsl:attribute>
						<xsl:attribute name="class">ico-20</xsl:attribute>
					</xsl:element>
			</xsl:if>
			<xsl:if test="ac = 0 and pc = 1">
					<xsl:element name="img">
					  	<xsl:attribute name="src">./img/icons/passive_check.png</xsl:attribute>
					  	<xsl:attribute name="title">This service is checked passive only</xsl:attribute>
						<xsl:attribute name="class">ico-16</xsl:attribute>
					</xsl:element>
			</xsl:if>
			<xsl:if test="ac = 0 and pc = 0">
					<xsl:element name="img">
					  	<xsl:attribute name="src">./img/icons/never_checked.png</xsl:attribute>
					  	<xsl:attribute name="title">This service is neither active nor passive</xsl:attribute>
						<xsl:attribute name="class">ico-16</xsl:attribute>
					</xsl:element>
			</xsl:if>
			<xsl:if test="is = 1">
					<xsl:element name="img">
					  	<xsl:attribute name="src">./img/icones/16x16/flapping.gif</xsl:attribute>
					  	<xsl:attribute name="title">This Service is flapping</xsl:attribute>
					</xsl:element>
			</xsl:if>
			<xsl:if test="ne = 0">
					<xsl:element name="img">
					  	<xsl:attribute name="src">./img/icons/notifications_off.png</xsl:attribute>
					  	<xsl:attribute name="title">Notification is disabled</xsl:attribute>
						<xsl:attribute name="class">ico-18</xsl:attribute>
					</xsl:element>
			</xsl:if>
		</td>
		<td class="ListColRight">
			<xsl:if test="ppd &gt; 0">
				<xsl:if test="svc_index &gt; 0">
					<xsl:element name="a">
				  		<xsl:attribute name="href">main.php?p=204&amp;mode=0&amp;meta=1&amp;svc_id=<xsl:value-of select="hn"/>;<xsl:value-of select="sd"/></xsl:attribute>					
							<xsl:element name="img">
					  			<xsl:attribute name="src">./img/icons/chart.png</xsl:attribute>
                                <xsl:attribute name="id"><xsl:value-of select="svc_index"/>-<xsl:value-of select="svc_id"/></xsl:attribute>
                                <xsl:attribute name="class">graph-volant ico-18</xsl:attribute>
							</xsl:element>					
					</xsl:element>
				</xsl:if>
			</xsl:if>
		</td>
		<td class="ListColCenter">

			<xsl:element name="span">
				<xsl:attribute name="class">badge <xsl:value-of select="sc"/></xsl:attribute>

				<xsl:value-of select="cs"/>
			</xsl:element>

		</td>
		<td class="ListColRight" style="white-space:nowrap;">
			<xsl:value-of select="d"/>
		</td>
        <td class="ListColCenter" style="white-space:nowrap;">
        	<xsl:value-of select="lc"/>
        </td>
        <td class="ListColCenter">
        	<xsl:value-of select="ca"/>
        </td>
        <td class="ListColLeft" >
        	<xsl:value-of select="po" disable-output-escaping="yes" />
        </td>
		<xsl:if test="//i/nc = 1">
			<td class="ListColCenter" style="white-space:nowrap;">
				<xsl:value-of select="nc"/>
			</td>
		</xsl:if>
	</tr>
</xsl:for-each>
</table>
<div id="div_img" class="img_volante"></div>
<div id="div_popup" class="popup_volante"><div class="container-load"></div><div id="popup-container-display"></div></div>
</xsl:template>
</xsl:stylesheet>