<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$security = new Security();
$collection = new Collection();
$image = new Image();
$notification = new Notification();
$info = '';

if(!$user->loged_in()){
    header('location:login');
}
if(!$userRole->can_access(array(1))){
    header('location:adminLogin');
}

if(isset($_POST['submit'])){
    $params = array();
    $img_path = $image->upload_image('image', 'collectionImages');
    $params['name'] =  $security->post('name');

    if($img_path == 'type_error'){
            $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $params['thumbnail'] =  $img_path[0];
        $params['image'] =  $img_path[1];
        if($collection->store($params)){
            $info = $notification->success('Collection successfully created');
        }else{
            $info = $notification->danger('Error please try again later');
        }
    }
}


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/addCollection.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'Add Collection');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('header', $includes->backoffice_header());


/** Display page contents **/
echo $template->display();
