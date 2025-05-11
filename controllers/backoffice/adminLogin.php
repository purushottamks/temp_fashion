<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';
$info = '';

/** instances of models start **/
$includes = new Includes();
$user = new User();

/** instances of models end **/


/**
Programming logic section start
 **/

$email = '';
$password = '';

if($user->loged_in()){
    header('location:adminIndex');
}


if(isset($_POST['submit_login'])){
    $info = $user->login();
}


if(isset($_COOKIE["email"])){
    $email = $_COOKIE["email"];
    $password = $_COOKIE["password"];
}




/**
Programming logic section end
 **/



/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/adminLogin.tpl';

/** Sections **/
$template->backoffice_section('header', 'inc');
$template->backoffice_section('sidebar', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('footer', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('page_title', 'Login');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('info', $info);
$template->add_snippet('email', $email);
$template->add_snippet('assets_url', $assets_url);

/** Display page contents **/
echo $template->display();
