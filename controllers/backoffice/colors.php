<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$security = new Security();
$db = Database::getInstance();
$notification = new Notification();
$info = '';

if(!$user->loged_in()){
    header('location:adminLogin');
}
if(!$userRole->can_access(array(1))){
    header('location:login');
}

if(isset($_POST['ajax']) && $_POST['ajax']==1){

    if(isset($_POST['action']) && $_POST['action'] == 'deleteColor'){
        $id = $security->post('id');
        if($db->delete('colors', " id= {$id}")){
            echo 'color_deleted';
        }
    }

    die();
}

if(isset($_POST['submit'])){
    $name = $security->post('name');
    if($db->query("INSERT INTO colors (`name`) VALUES ('{$name}')")){
        $info = $notification->success('Color successfully added');
    }else{
        $info = $notification->danger('error');
    }
}

/// colors
$colors = $db->fetch_table('colors');
$colors_html = '';
foreach ($colors as $color){
    $colors_html.='<tr> 
                        <td>'.$color['name'].'</td> 
                        <td><button class="btn btn-danger" onclick="delete_color(this, '.$color['id'].')">Delete</button></td> 
                   </tr>';
}
/// colors

/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/colors.tpl';

/** Sections **/
///$template->backoffice_section('header', 'inc');
$template->backoffice_section('sidebar', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('footer', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'Colors');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('navigation', $includes->sidebar());
$template->add_snippet('colors_html', $colors_html);
$template->add_snippet('header', $includes->backoffice_header());

/** Display page contents **/
echo $template->display();
