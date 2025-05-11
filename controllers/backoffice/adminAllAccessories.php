<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';


/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$product = new Product();
$accessory = new Accessory();
$security = new Security();
$category = new AccessoryCat();
$db = Database::getInstance();
$image = new Image();
$notification = new Notification();
$info = '';

if(!$user->loged_in()){
    header('location:adminLogin');
}
if(!$userRole->can_access(array(1))){
    header('location:adminLogin');
}


if(isset($_POST['edit_accessory'])){

    $params = array();
    $accessory_id = $security->post('accessory_id');
    $params['name'] = $security->post('accessory_name');
    $params['category'] = $security->post('accessory_category');
    $params['price'] = $security->post('price');


    if($_FILES['accessory_image']['error'] == 0){
        $old_image = BASE_DIR.'/uploads/'.$security->post('old_image');
        $thumbnail = BASE_DIR.'/uploads/'.$security->post('thumbnail');
        $uploaded_img = $image->upload_image('accessory_image', 'accessoryImages');
        if(isset($_post['old_image']) && !empty($_POST['old_image'])){
            if(file_exists($old_image)){
                unlink($old_image);
            }
            if(file_exists($thumbnail)){
                unlink($thumbnail);
            }
        }
        $params['thumbnail'] = $uploaded_img[0];
        $params['image'] = $uploaded_img[1];
    }

    if($db->update('accessories', $params, " id = {$accessory_id}")){
        $info = $notification->success('Updated Successfully');
    }else{
        $info = $notification->danger('Error please try again');
    }


}

if(isset($_POST['ajax']) && $_POST['ajax']==1){

    if(isset($_POST['action']) && $_POST['action']=='view_accessory'){
        echo 'view accessory';
    }

    if(isset($_POST['action']) && $_POST['action']=='edit_accessory'){
        echo 'edit accessory';

    }

    if(isset($_POST['action']) && $_POST['action']=='delete_accessory'){
        $accessory_id = $security->post('accessory_id');
        if($db->delete('accessories', " id={$accessory_id}")){
            echo 'success';
        }else{
            echo 'error';
        }
    }
    die();
}


if(isset($_GET['param1'])){
    $page = $security->get('param1');
}else{
    $page = 1;
}

$perPage = 20;
$offset = ($page*$perPage)-$perPage;
$accessories = $accessory->accessories($perPage, $offset ,$page);

$rows = $accessories[0];
$pagination = $accessories[1];

$accessories_rows = '';
foreach($rows as $row){

    $accessories_rows.="<tr id='row_".$row['id']."'>
                        <td>".++$offset."</td>
                        <td>".$row['name']."</td>
                        <td><img class='img img-thumbnail' src='".BASE_URL."uploads/".$row['thumbnail']."' /></td>                     
                        <td>".$category->categoryName($row['category'])."</td>
                        <td>".$row['price']."</td>
                        <td class='menu-action'>
                        <a data-action='view_accessory'  data-accessory_id='".$row['id']."' data-accessory_name='".$row['name']."' data-accessory_image='".$row['image']."' data-thumbnail='".$row['thumbnail']."' data-accessory_category='".$row['category']."' data-price='".$row['price']."' onclick='show_accessory(this)'  class='btn menu-icon vd_bg-green'> 
                           <i class='fa fa-eye'></i> 
                        </a> 
                        <a data-action='delete_accessory' data-accessory_id='".$row['id']."' data-accessory_name='".$row['name']."' data-accessory_image='".$row['image']."' data-accessory_category='".$row['category']."' data-price='".$row['price']."' onclick='delete_accessory(this)' class='btn menu-icon vd_bg-red'> 
                           <i class='fa fa-times'></i> 
                        </a>
                        </td>
                     </tr>";

}


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/adminAllAccessories.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'All Accessories');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('accessories', $accessories_rows);
$template->add_snippet('pagination', $pagination);
$template->add_snippet('categories', $category->categories_dropdown());
$template->add_snippet('header', $includes->backoffice_header());


/** Display page contents **/
echo $template->display();
