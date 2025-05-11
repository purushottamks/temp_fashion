<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/frontdesk_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();

$template = new Template();
$template->filename = 'views/frontdesk/cancel.tpl';

/** Sections **/
$template->frontdesk_section('header', 'inc');
$template->frontdesk_section('scripts', 'inc');
$template->frontdesk_section('js_links', 'inc');
$template->frontdesk_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('info', $info);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('main_navigation', $includes->main_navigation());
$template->add_snippet('mobile_navigation', $includes->mobile_navigation());
$template->add_snippet('cart_web', $includes->cart_web());

/** Display page contents **/
echo $template->display();
////print_r($_SESSION);