<h2><img	class="center"	alt=""	align="middle"	src="images/network.png">	{t}Network	settings{/t}</h2>


<table	summary=""	width="100%" cellspacing=0 cellpadding=0>
	<tr>
		<td	style="width:50%; vertical-align: top;">
			<table	summary="">
				<tr>
					<td><LABEL	for="ipHostNumber">{t}IP-address{/t}{if $IPisMust}{$staticAddress}{/if}</LABEL></td>
					<td>
{render acl=$ipHostNumberACL}
            <input	id="ipHostNumber"	name="ipHostNumber"	size=25	maxlength=80	value="{$ipHostNumber}">
{/render}
          </td>
				</tr>
				<tr>
					<td><LABEL	for="macAddress">{t}MAC-address{/t}</LABEL>{$staticAddress}</td>
					<td>
{render acl=$macAddressACL}
            <input	name="macAddress"	id="macAddress"	size=25	maxlength=80	value="{$macAddress}">
{/render}
          </td>
				</tr>
        {if $autonet==true}
				<tr>
					<td>&nbsp;</td>
					<td>
{render acl=$macAddressACL.$ipHostNumberACL}
            <input type="submit" name="autonet" value="{t}Autodetect{/t}">
{/render}
          </td>
				</tr>
        {/if}
      </table> 
    </td>
    {if $DNS_enabled==true}
		<td	style="width:50%;vertical-align:top;border-left:1px solid #b0b0b0;" valign="top">
      <input type="checkbox" name="DNS_is_account" value="1" 

        {if !$accountACL}  
          disabled
        {/if}

        {if $DNS_is_account == true}checked="checked"
        onclick="toggle('test2');
          changeState('zoneName');
          changeState('dNSTTL');
          changeState('AddNewRecord');
          {$changeStateForRecords}
      ">
        {else}
        onclick="toggle('test2');
          changeState('zoneName');
          changeState('dNSTTL');
          changeState('AddNewRecord');
      "/>
        {/if}
      {t}Enable DNS for this device{/t}
      <input type="submit" name="reloadThisDNSStuff" value="{t}Refresh{/t}"/>
      {if $DNS_is_account == true}
      <div style="padding-left:20px;visibility:visible;" id="test2">
      {else}
      <div style="padding-left:20px;visibility:hidden;" id="test2">
      {/if}
			<table summary="">
				<tr>
					<td><LABEL	for="zoneName">{t}Zone{/t}</LABEL></td>
					<td>
{render acl=$zoneNameACL}
              <select name="zoneName" id="zoneName" {if $DNS_is_account == false} disabled='disabled' {/if}>
                {html_options values=$ZoneKeys output=$Zones selected=$zoneName}
              </select>
{/render}
          </td>
				</tr>
				<tr>
          <td>{t}TTL{/t}</td>
          <td>
{render acl=$dNSTTLACL}
            <input type="text" name="dNSTTL" value="{$dNSTTL}" id="dNSTTL" {if $DNS_is_account == false} disabled {/if}>
{/render}
          </td> 
				</tr>
				<tr>
          <td valign="top">{t}Dns records{/t}</td>
          <td>
            {if $DNS_is_account == true}
{render acl=$RecordsACL}
              {$records}
{/render}
            {/if}
            </td>
				</tr>
			</table>
      </div>
		</td>
    {/if}
    
	</tr>
</table>
<input type="hidden" name="network_tpl_posted" value="1">

<!--
vim:tabstop=2:expandtab:shiftwidth=2:filetype=php:syntax:ruler:
-->
