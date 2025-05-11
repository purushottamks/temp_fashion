<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$db = Database::getInstance();
$info = '';
$updateManager = new UpdateManager();
$updateDetail = $updateManager->getUpdateDetails('2.2.1');
echo '<pre>';
print_r($updateDetail);
echo '</pre>';
die('testing');
if(!$user->loged_in()){
    header('location:login');
}

if(!$userRole->can_access(array(1))){
    header('location:login');
}


$query = $db->query("SELECT * FROM coat_components WHERE side='front' AND fabric_id = 1 AND fitting_id = 1");
$fetch = $db->fetch($query);
$images = '';
do{
  $images.='<img style="position:absolute; top:0px; left:0px;" src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
}while($fetch = $db->fetch($query));


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/adminEmpty.tpl';

/** Sections **/
$template->backoffice_section('header', 'inc');
$template->backoffice_section('sidebar', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('footer', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('page_title', 'Empty');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('navigation', $includes->sidebar());



/** Display page contents **/
echo $template->display();
