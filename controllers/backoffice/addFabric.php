<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$security = new Security();
$fabric = new Fabric();
$image = new Image();
$notification = new Notification();
$db = Database::getInstance();
$info = '';

if(!$user->loged_in()){
    header('location:adminLogin');
}
if(!$userRole->can_access(array(1))){
    header('location:adminLogin');
}

if(isset($_POST['submit'])){
    $params = array();
    $img_path = $image->upload_image('image', 'fabricImages');
    $params['name'] =  $security->post('name');
    $params['color_id'] =  $security->post('color');
    $params['material_id'] =  $security->post('material');
    $params['pattern_id'] =  $security->post('pattern_id');
    $params['category_id'] =  $security->post('category');
    $params['description'] =  $security->post('description');
    $params['thickness'] =  $security->post('thickness');
    $params['composition'] =  $security->post('composition');
    $params['pattern'] =  $security->post('pattern');
    $params['extra_price'] =  $security->post('extra_price');

    if($img_path == 'type_error'){
            $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $params['thumbnail'] =  $img_path[0];
        $params['image'] =  $img_path[1];
        if($fabric->storeFabric($params)){
            $info = $notification->success('Fabric successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }
}

/*
 * Dropdowns
 * */

/// colors
$colors = $db->fetch_table('colors');
$colors_dropdown = '';
foreach ($colors as $color){
    $colors_dropdown.='<option value="'.$color['id'].'">'.$color['name'].'</option>';
}
/// colors

/// categories
$categories = $db->fetch_table('categories');
$categories_dropdown = '';
foreach ($categories as $category){
    $categories_dropdown.='<option value="'.$category['id'].'">'.$category['name'].'</option>';
}
/// categories

/// pattern
$patterns = $db->fetch_table('fabric_pattern');
$patterns_dropdown = '';
foreach ($patterns as $pattern){
    $patterns_dropdown.='<option value="'.$pattern['id'].'">'.$pattern['name'].'</option>';
}
/// pattern

/// material
$materials = $db->fetch_table('fabric_material');
$materials_dropdown = '';
foreach ($materials as $material){
    $materials_dropdown.='<option value="'.$material['id'].'">'.$material['name'].'</option>';
}
/// material


/* Dropdowns end */


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/addFabric.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'Add Fabric');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('colors_dropdown', $colors_dropdown);
$template->add_snippet('categories_dropdown', $categories_dropdown);
$template->add_snippet('patterns_dropdown', $patterns_dropdown);
$template->add_snippet('materials_dropdown', $materials_dropdown);
$template->add_snippet('header', $includes->backoffice_header());

/** Display page contents **/
echo $template->display();
