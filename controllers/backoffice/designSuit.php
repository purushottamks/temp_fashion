<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$info = '';

if(!$user->loged_in()){
    header('location:adminLogin');
}


if(!$userRole->can_access(array(1))){
    header('location:adminLogin');
}


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/designSuit.tpl';

/** Sections **/
///$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'Design Your Suit');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('header', $includes->backoffice_header());

/** Display page contents **/
echo $template->display();
