{assign var="noSidebar" value=true}
{include file='header.tpl'}

<div class="page-header">
	<h1>{$aLang.registration_invite}</h1>
</div>

<div class="row">
	<div class="col-sm-4 col-lg-4">
	
		<form action="{router page='registration'}invite/" method="POST">
			<div class="form-group">
				<label>{$aLang.registration_invite_code}</label>
				<input type="text" name="invite_code" class="form-control" />
			</div>
	
			<input type="submit" name="submit_invite" value="{$aLang.registration_invite_check}" class="btn btn-success" />
		</form>
		
	</div>
</div>


{include file='footer.tpl'}
