{assign var="noSidebar" value=true}
{include file='header.tpl'}

<script type="text/javascript">
	jQuery(document).ready(function($){
		$('#registration-form').find('input.js-ajax-validate').blur(function(e){
			var aParams={ };
			if ($(e.target).attr('name')=='password_confirm') {
				aParams['password']=$('#registration-user-password').val();
			}
			if ($(e.target).attr('name')=='password') {
				aParams['password']=$('#registration-user-password').val();
				if ($('#registration-user-password-confirm').val()) {
					ls.user.validateRegistrationField('password_confirm',$('#registration-user-password-confirm').val(),$('#registration-form'),{ 'password': $(e.target).val() });
				}
			}
			ls.user.validateRegistrationField($(e.target).attr('name'),$(e.target).val(),$('#registration-form'),aParams);
		});
		$('#registration-form').bind('submit',function(){
			ls.user.registration('registration-form');
			return false;
		});
		$('#registration-form-submit').attr('disabled',false);
	});
</script>


<h2 class="page-header">{$aLang.registration}</h2>

{hook run='registration_begin'}

<form action="{router page='registration'}" method="post" id="registration-form">
	{hook run='form_registration_begin'}

	
	<p><label for="registration-login">{$aLang.registration_login}
	<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_login_notice}"></i>
	<i class="icon-ok text-success validate-ok-field-login" style="display: none"></i></label>
	<input type="text" name="login" id="registration-login" value="{$_aRequest.login}" class="span4 js-ajax-validate" /> 
	<span class="help-block"><small class="text-error validate-error-hide validate-error-field-login"></small></span></p>

	<p><label for="registration-mail">{$aLang.registration_mail}
	<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_mail_notice}"></i>
	<i class="icon-ok text-success validate-ok-field-mail" style="display: none"></i></label>
	<input type="text" name="mail" id="registration-mail" value="{$_aRequest.mail}" class="span4 js-ajax-validate" /> 
	<span class="help-block"><small class="text-error validate-error-hide validate-error-field-mail"></small></span></p>

	<p><label for="registration-user-password">{$aLang.registration_password}
	<i class="icon-question-sign muted js-tip-help" title="{$aLang.registration_password_notice}"></i>
	<i class="icon-ok text-success validate-ok-field-password" style="display: none"></i></label>
	<input type="password" name="password" id="registration-user-password" value="" class="span4 js-ajax-validate" />
	<span class="help-block"><small class="text-error validate-error-hide validate-error-field-password"></small></span></p>

	<p><label for="registration-user-password-confirm">{$aLang.registration_password_retry}
	<i class="icon-ok text-success validate-ok-field-password_confirm" style="display: none"></i></label>
	<input type="password" value="" id="registration-user-password-confirm" name="password_confirm" class="span4 js-ajax-validate" />
	<span class="help-block"><small class="text-error validate-error-hide validate-error-field-password_confirm"></small></span></p>

	{hookb run="registration_captcha"}
	<p><label for="captcha">{$aLang.registration_captcha}</label>
	<img src="{cfg name='path.root.engine_lib'}/external/kcaptcha/index.php?{$_sPhpSessionName}={$_sPhpSessionId}" 
		 onclick="this.src='{cfg name='path.root.engine_lib'}/external/kcaptcha/index.php?{$_sPhpSessionName}={$_sPhpSessionId}&n='+Math.random();" 
		 class="captcha-image" />
	<input type="text" name="captcha" id="captcha" value="" maxlength="3" class="span3 js-ajax-validate" />
	<span class="help-block"><small class="text-error validate-error-hide validate-error-field-captcha"></small></span></p>
	{/hookb}

	{hook run='form_registration_end'}
	<br />

	<button type="submit" name="submit_register" class="btn btn-primary" id="registration-form-submit" disabled="disabled">{$aLang.registration_submit}</button>
</form>

{hook run='registration_end'}

{include file='footer.tpl'}
