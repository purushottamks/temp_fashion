<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$security = new Security();
$category = new Category();
$image = new Image();
$notification = new Notification();
$info = '';

if(!$user->loged_in()){
    header('location:adminLogin');
}
if(!$userRole->can_access(array(1))){
    header('location:login');
}

if(isset($_POST['submit'])){
    $params = array();
    $img_path = $image->upload_image('image', 'categoryImages');
    $params['name'] =  $security->post('name');

    if($img_path == 'type_error'){
            $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $params['thumbnail'] =  $img_path[0];
        $params['image'] =  $img_path[1];
        $category->storeCategory($params);
        $info = $notification->success('Category successfully created');
    }
}


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/addCategory.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'Add Category');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('header', $includes->backoffice_header());


/** Display page contents **/
echo $template->display();
