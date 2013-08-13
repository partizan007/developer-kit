{assign var="noSidebar" value=true}
{include file='header.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#reminder-form').bind('submit',function(){
			ls.user.reminder('reminder-form');
			return false;
		});
		$('#reminder-form-submit').attr('disabled',false);
	});
</script>

<div class="page-header">
	<h1>{$aLang.password_reminder}</h1>
</div>

<div class="row">
	<div class="col-sm-4 col-lg-4">
	
		<form action="{router page='login'}reminder/" method="POST" id="reminder-form">
			<div class="form-group">
				<label for="reminder-mail">{$aLang.password_reminder_email}</label>
				<input type="text" name="mail" id="reminder-mail" class="form-control" />
				<p class="help-block"><small class="text-danger validate-error-hide validate-error-reminder"></small></p>
			</div>
	
			<button type="submit" name="submit_reminder" class="btn btn-success" id="reminder-form-submit" disabled="disabled">{$aLang.password_reminder_submit}</button>
		</form>
		
	</div>
</div>

{include file='footer.tpl'}
