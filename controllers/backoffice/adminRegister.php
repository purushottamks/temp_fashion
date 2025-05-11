<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';
$info = '';

/** instances of models start **/
$includes = new Includes();
$user = new User();
$db = Database::getInstance();

/**  instances of models end  **/


/**
    Programming logic section start
 **/

$email = '';
$password = '';

if($user->loged_in()){
    header('location:adminIndex');
}


if(isset($_POST['submit_register'])){
    $info = $user->register();
}


/**
Programming logic section end
 **/



/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/adminRegister.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('sidebar', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('footer', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('page_title', 'Register');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('info', $info);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('header', $includes->backoffice_header());


/** Display page contents **/
echo $template->display();
