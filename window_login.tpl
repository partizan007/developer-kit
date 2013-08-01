{if !$oUserCurrent}
	<div class="modal fade in modal-login" id="window_login_form">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<header class="modal-header">
					<button type="button" class="close jqmClose" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title">{$aLang.user_authorization}</h4>
				</header>
		
				<script type="text/javascript">
					jQuery(function($){
						$('#popup-login-form').bind('submit',function(){
							ls.user.login('popup-login-form');
							return false;
						});
						$('#popup-login-form-submit').attr('disabled',false);
					});
				</script>
		
				<div class="modal-body">
					<ul class="nav nav-tabs">
						<li class="active js-block-popup-login-item" data-type="login"><a href="#">{$aLang.user_login_submit}</a></li>
						{if !$oConfig->GetValue('general.reg.invite')}
							<li class="js-block-popup-login-item" data-type="registration"><a href="#">{$aLang.registration}</a></li>
						{else}
							<li><a href="{router page='registration'}">{$aLang.registration}</a></li>
						{/if}
						<li class="js-block-popup-login-item" data-type="reminder"><a href="#">{$aLang.password_reminder}</a></li>
					</ul>
					<br />
					
					<div class="tab-content js-block-popup-login-content" data-type="login">
						{hook run='login_popup_begin'}
						
						<form action="{router page='login'}" method="post" id="popup-login-form">
							{hook run='form_login_popup_begin'}
							
							<div class="form-group">
								<label for="popup-login">{$aLang.user_login}</label>
								<input type="text" name="login" id="popup-login" class="form-control">
							</div>
							
							<div class="form-group">
								<label for="popup-password">{$aLang.user_password}</label>
								<input type="password" name="password" id="popup-password" class="form-control">
								<span class="help-block"><small class="text-danger validate-error-hide validate-error-login"></small></span>
							</div>
							
							<div class="form-group">
								<label class="checkbox"><input type="checkbox" name="remember" class="input-checkbox" checked>{$aLang.user_login_remember}</label>
							
								{hook run='form_login_popup_end'}
							
								<input type="hidden" name="return-path" value="{$PATH_WEB_CURRENT|escape:'html'}">
								<button type="submit" name="submit_login" class="btn btn-success" id="popup-login-form-submit" disabled="disabled">{$aLang.user_login_submit}</button>
							</div>
						
						</form>
						
						{hook run='login_popup_end'}
					</div>


					{if !$oConfig->GetValue('general.reg.invite')}
						<div data-type="registration" class="tab-content js-block-popup-login-content" style="display:none;">
							<script type="text/javascript">
								jQuery(document).ready(function($){
									$('#popup-registration-form').find('input.js-ajax-validate').blur(function(e){
										var aParams={ };
										if ($(e.target).attr('name')=='password_confirm') {
											aParams['password']=$('#popup-registration-user-password').val();
										}
										if ($(e.target).attr('name')=='password') {
											aParams['password']=$('#popup-registration-user-password').val();
											if ($('#popup-registration-user-password-confirm').val()) {
												ls.user.validateRegistrationField('password_confirm',$('#popup-registration-user-password-confirm').val(),$('#popup-registration-form'),{ 'password': $(e.target).val() });
											}
										}
										ls.user.validateRegistrationField($(e.target).attr('name'),$(e.target).val(),$('#popup-registration-form'),aParams);
									});
									$('#popup-registration-form').bind('submit',function(){
										ls.user.registration('popup-registration-form');
										return false;
									});
									$('#popup-registration-form-submit').attr('disabled',false);
								});
							</script>

							{hook run='registration_begin' isPopup=true}
							<form action="{router page='registration'}" method="post" id="popup-registration-form">
								{hook run='form_registration_begin' isPopup=true}
					
								<div class="form-group">
									<label for="popup-registration-login">{$aLang.registration_login}</label>
									<i class="icon-question-sign text-muted js-tip-help" title="{$aLang.registration_login_notice}"></i>
									<i class="icon-ok text-success validate-ok-field-login" style="display: none"></i>
									<input type="text" name="login" id="popup-registration-login" value="{$_aRequest.login}" class="form-control js-ajax-validate" />
									<span class="help-block"><small class="text-danger validate-error-hide validate-error-field-login"></small></span>
								</div>
					
								<div class="form-group">
									<label for="popup-registration-mail">{$aLang.registration_mail}</label>
									<i class="icon-question-sign text-muted js-tip-help" title="{$aLang.registration_mail_notice}"></i>
									<i class="icon-ok text-success validate-ok-field-mail" style="display: none"></i>
									<input type="text" name="mail" id="popup-registration-mail" value="{$_aRequest.mail}" class="form-control js-ajax-validate" />
									<span class="help-block"><small class="text-danger validate-error-hide validate-error-field-mail"></small></span>
								</div>
					
								<div class="form-group">
									<label for="popup-registration-user-password">{$aLang.registration_password}</label>
									<i class="icon-question-sign text-muted js-tip-help" title="{$aLang.registration_password_notice}"></i>
									<i class="icon-ok text-success validate-ok-field-password" style="display: none"></i>
									<input type="password" name="password" id="popup-registration-user-password" value="" class="form-control js-ajax-validate" />
									<span class="help-block"><small class="text-danger validate-error-hide validate-error-field-password"></small></span>
								</div>
					
								<div class="form-group">
									<label for="popup-registration-user-password-confirm">{$aLang.registration_password_retry}</label>
									<i class="icon-ok text-success validate-ok-field-password_confirm" style="display: none"></i>
									<input type="password" value="" id="popup-registration-user-password-confirm" name="password_confirm" class="form-control js-ajax-validate" />
									<span class="help-block"><small class="text-danger validate-error-hide validate-error-field-password_confirm"></small></span>
								</div>

								{hookb run="popup_registration_captcha"}
									<div class="form-group">
										<label for="popup-registration-captcha">{$aLang.registration_captcha}</label>
										<div class="row">
											<div class="col-6 col-sm-2 col-lg-2">
												<img src="{cfg name='path.root.engine_lib'}/external/kcaptcha/index.php?{$_sPhpSessionName}={$_sPhpSessionId}" 
													onclick="this.src='{cfg name='path.root.engine_lib'}/external/kcaptcha/index.php?{$_sPhpSessionName}={$_sPhpSessionId}&n='+Math.random();"
													class="captcha-image" />
											</div>
											<div class="col-6 col-sm-3 col-lg-3">
												<input type="text" name="captcha" id="popup-registration-captcha" value="" maxlength="3" class="form-control js-ajax-validate" />
											</div>
										</div>
										<span class="help-block"><small class="text-danger validate-error-hide validate-error-field-captcha"></small></span>
									</div>
								{/hookb}
					
								{hook run='form_registration_end' isPopup=true}
					
								<div class="form-group">
									<input type="hidden" name="return-path" value="{$PATH_WEB_CURRENT|escape:'html'}">
									<button type="submit" name="submit_register" class="btn btn-success" id="popup-registration-form-submit" disabled="disabled">{$aLang.registration_submit}</button>
								</div>
								
							</form>
							{hook run='registration_end' isPopup=true}
						</div>
					{/if}
			
			
					<div data-type="reminder" class="tab-content js-block-popup-login-content" style="display:none;">
						<script type="text/javascript">
							jQuery(document).ready(function($){
								$('#popup-reminder-form').bind('submit',function(){
									ls.user.reminder('popup-reminder-form');
									return false;
								});
								$('#popup-reminder-form-submit').attr('disabled',false);
							});
						</script>
						
						<form action="{router page='login'}reminder/" method="POST" id="popup-reminder-form">
						
							<div class="form-group">
								<label for="popup-reminder-mail">{$aLang.password_reminder_email}</label>
								<input type="text" name="mail" id="popup-reminder-mail" class="form-control" />
								<span class="help-block"><small class="text-danger validate-error-hide validate-error-reminder"></small></span>
							</div>
					
							<div class="form-group">
								<button type="submit" name="submit_reminder" class="btn btn-success" id="popup-reminder-form-submit" disabled="disabled">{$aLang.password_reminder_submit}</button>
							</div>
							
						</form>
					</div>
				</div>
			
			</div><!-- /.modal-content -->
		</div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
{/if}
