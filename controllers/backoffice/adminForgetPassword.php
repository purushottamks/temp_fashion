<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';
$info = '';

/** instances of models **/
$includes = new Includes();
$user = new User();
$input = new Input();

if($user->loged_in()){
    header('location:index');
}
/** Template to include **/
$template = new Template();

$template->add_snippet('assets_url', $assets_url);
global $user_email;
global $info_message;
if(isset($_GET['token'])){
	$token = $_GET['token'];
	$token = base64_decode($token); 
	$user_email = substr($token, 0, strpos($token, '_'));   
	$timestamp = substr($token, strpos($token, "_") + 1); 
	$timestamp = date("d-m-Y h:i:sa",$timestamp);
	$hour = date("d-m-Y h:i:sa", strtotime('-1 hour'));
	$current_time = date("d-m-Y h:i:sa"); 
	$reset_key = $user->check_reset_key($user_email);
	if($reset_key == 1){
		if($timestamp < $current_time && $timestamp > $hour){
			$template->filename = 'views/backoffice/adminResetPassword.tpl';
			}else{
				$template->filename = 'views/backoffice/adminForgetPassword.tpl';
				$info_message = '<div class="alert alert-danger vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>Oh snap!</strong> Time out Please again send email. </div>';
				}  
		}else{
			$template->filename = 'views/backoffice/adminForgetPassword.tpl';
			$info_message = '<div class="alert alert-danger vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>Oh snap!</strong> This Link already use. Please again send email. </div>';
			}
		}else{
			$template->filename = 'views/backoffice/adminForgetPassword.tpl';
			}

$template->backoffice_section('header', 'inc');
$template->backoffice_section('sidebar', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('footer', 'inc');

if(isset($_POST['submit_email'])){
	$email = $input->post('email');
    $info = $user->forget_password($email);
	if($info == 'send_email'){
		$info_message = '<div class="alert alert-success">
                    	<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    	<span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span><strong>Success! </strong><br> An email has been sent to you. Please check your email and reset password.</div>';
		}else if($info == 'admin'){
			$info_message = '<div class="alert alert-danger vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>Oh snap!</strong> You do not use this service. </div>';
			}
}

if(isset($_POST['reset_password'])){
	$security = new Security();
	$password = $security->password('password');
	$info = $user->reset_password($user_email,$password);
	if($info == 'ok'){
		$info_message = '<div class="alert alert-success">
                    	<button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    	<span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span><strong>Success!</strong><br> Password has been reset Successfully </div>';
		header('Refresh: 3; URL=https://shopifyappsforyou.com/product_maker/login');
		}else{
			$info_message = '<div class="alert alert-danger vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>Oh snap!</strong> Database error. </div>';
			}
	}
$template->add_snippet('navigation', $includes->navigation());
$template->add_snippet('info', $info_message);
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');


/** Display page contents **/
echo $template->display();



