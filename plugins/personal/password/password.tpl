<div class="plugtop">
  <img alt="" src="{$headimage}" align=middle>{t}Change password{/t}
</div>

<p>
  {t}To change your personal password use the fields below. The changes take effect immediately. Please memorize the new password, because you wouldn't be able to login without it.{/t}
</p>

<p>
{if $NotAllowed}  
 <b>{t}You have no permissions to change your password.{/t}</b>
{else}
  {t}Changing the password affects your authentification on mail, proxy, samba and unix services.{/t}
{/if}
</p>

<table summary="" style="vertical-align:top; text-align:left;" cellpadding=4 border=0>
  <tr>
    <td><b><LABEL for="current_password">{t}Current password{/t}</LABEL></b></td>
    <td>
{render acl=$ChangeACL}
	<input id="current_password" type="password" name="current_password" size="30" maxlength="40" onFocus="nextfield= 'new_password';">
{/render}
    </td>
  </tr>
  <tr>
    <td><b><LABEL for="new_password">{t}New password{/t}</LABEL></b></td>
    <td>
{render acl=$ChangeACL}
	<input id="new_password" type="password" name="new_password" size="30" maxlength="40" onFocus="nextfield= 'repeated_password';">
{/render}
    </td>
  </tr>
  <tr>
    <td><b><LABEL for="repeated_password">{t}Repeat new password{/t}</LABEL></b></td>
    <td>
{render acl=$ChangeACL}
	<input id="repeated_password" type="password" name="repeated_password" size="30" maxlength="40" onFocus="nextfield= 'password_finish';">
{/render}
    </td>
  </tr>
</table>

<br>

<p class="plugbottom">
{render acl=$ChangeACL}
  <input type=submit name="password_finish" value="{t}Set password{/t}">
{/render}
  &nbsp;
{render acl=$ChangeACL}
  <input type=reset id="password_cancel" name="password_cancel" value="{t}Clear fields{/t}">
{/render}
</p>

<input type="hidden" name="ignore">

<!-- Place cursor -->
<script language="JavaScript" type="text/javascript">
  <!-- // First input field on page
  nextfield= 'current_password';
  document.mainform.current_password.focus();
  -->
</script>

