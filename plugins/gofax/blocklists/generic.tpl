<h2><img class="center" alt="" align="middle" src="images/rightarrow.png"> {t}Generic{/t}</h2>
<table summary="" style="width:100%; vertical-align:top; text-align:left;">

 <tr>
   <td style="width:50%; vertical-align:top;">
    <table summary="">
     <tr>
      <td><LABEL for="cn">{t}List name{/t}</LABEL>{$must}</td>
      <td>
       <input name="cn" id="cn" size=25 maxlength=60 {$mode} {$cnACL} value="{$cn}" title="{t}Name of blocklist{/t}">
      </td>
     </tr>
     <tr>
      <td><LABEL for="base">{t}Base{/t}</LABEL>{$must}</td>
      <td>
       <select size="1" id="base" name="base" {$selectmode} title="{t}Select subtree to place blocklist in{/t}">
        {html_options options=$bases selected=$base_select}
		<option disabled>&nbsp;</option>
       </select>
        {if $selectmode == ""}
            <input type="image" name="chooseBase" src="images/folder.png" class="center" title="{t}Select a base{/t}">
        {else}
            <img src="images/folder_gray.png" class="center" title="{t}Select a base{/t}">
        {/if}
      </td>
     </tr>
    </table>
   </td>

  <td style="border-left:1px solid #A0A0A0">
   &nbsp;
  </td>

   <td style="vertical-align:top;">
    <table summary="">
     <tr>
       <td><LABEL for="type">{t}Type{/t}</LABEL></td>
       <td>
        <select size="1" id="type" name="type" {$goFaxBlocklistACL} title="{t}Select wether to filter incoming or outgoing calls{/t}">
        {html_options options=$types selected=$type}
		<option disabled>&nbsp;</option>
        </select>
        </td>
      </tr>
      <tr>
       <td><LABEL for="description">{t}Description{/t}</LABEL></td>
       <td>
         <input name="description" id="description" size=25 maxlength=80 {$descriptionACL} value="{$description}" title="{t}Descriptive text for this blocklist{/t}">
       </td>
      </tr>
    </table>
   </td>
 </tr>
</table>

<p class="plugbottom" style="margin-bottom:0px; padding:0px;">&nbsp;</p>

<table summary="" style="width:100%">
 <tr>
   <td style="width:50%;">
     <h2><img class="center" alt="" align="middle" src="images/false.png"> {t}Blocked numbers{/t}</h2>
     <select style="width:100%; height:200px;" name="numbers[]" size=15 multiple>
      {html_options values=$goFaxBlocklist output=$goFaxBlocklist}
	  <option disabled>&nbsp;</option>
     </select>
     <br>
     <input id="number" name="number" size=25 maxlength=60 {$goFaxBlocklistACL}>&nbsp;
     <input type=submit value="{t}Add{/t}" {$goFaxBlocklistACL} name="add_number">&nbsp;
     <input type=submit value="{t}Delete{/t}" {$goFaxBlocklistACL} name="delete_number">
   </td>
  <td style="border-left:1px solid #A0A0A0">
   &nbsp;
  </td>
   <td style="vertical-align:top;" >
     <h2><img class="center" alt="" align="middle" src="images/info_small.png"> {t}Information{/t}</h2>
     <p>
      {t}Numbers can also contain wild cards.{/t}
     </p>
   </td>
 </tr>
</table>


<p class="plugbottom">
  <input type=submit name="edit_finish" style="width:80px" value="{t}Ok{/t}">
  &nbsp;
  {if $apply eq "1"}
  <input type=submit name="edit_apply" value="{t}Apply{/t}">
  &nbsp;
  {/if}
  <input type=submit name="edit_cancel" value="{t}Cancel{/t}">
</p>

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
  document.mainform.cn.focus();
  -->
</script>
