<table class='sieve_reject_container'>
	<tr>
		<td>
			<b>{t}Reject mail{/t}</b>
			&nbsp;
			{if $Multiline}
<!--				{t}This will be a multiline text element{/t}-->
			{else}
<!--				{t}this will be stored as single string{/t}-->
			{/if}
		</td>
	</tr>
	<tr>
		<td class='sieve_reject_input'>
			<textarea name='reject_message_{$ID}' class='sieve_reject_input'>{$Message}</textarea>
		</td>
	</tr>
</table>
