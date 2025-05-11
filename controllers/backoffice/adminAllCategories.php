<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$category = new Category();
$security = new Security();
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

if(isset($_POST['edit_category'])){

    $params = array();

    if($_FILES['cat_image']['error'] == 0){
        echo $old_image = BASE_DIR.'/uploads/'.$security->post('old_image');
        echo $thumbnail = BASE_DIR.'/uploads/'.$security->post('thumbnail');
        $uploaded_img = $image->upload_image('cat_image', 'categoryImages');
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

    $cat_id = $security->post('category_id');
    $params['name'] = $security->post('cat_name');
    if($db->update('categories', $params, " id = {$cat_id}")){
        $info = $notification->success('Updated Successfully');
    }else{
        $info = $notification->danger('Error please try again');
    }
}

if(isset($_POST['ajax']) && $_POST['ajax']==1){


    if(isset($_POST['action']) && $_POST['action']=='view_category'){
        $category_id = $security->post('category_id');

    }

    if(isset($_POST['action']) && $_POST['action']=='edit_category'){
        $category_id = $security->post('category_id');

    }

    if(isset($_POST['action']) && $_POST['action']=='delete_category'){
        $category_id = $security->post('category_id');
        if($db->delete('categories', " id = {$category_id}")){
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
$categories = $category->categories($perPage, $offset ,$page);

$rows = $categories[0];
$pagination = $categories[1];

$categories_rows = '';
foreach($rows as $row){
    $categories_rows.="<tr id='row_".$row['id']."'>
                        <td>".++$offset."</td>
                        <td>".$row['name']."</td>
                        <td><img class='img img-thumbnail' src='".BASE_URL."uploads/".$row['thumbnail']."' /></td>
                        <td class='menu-action'>
                        
                        <a data-action='view_category' data-category_id='".$row['id']."' data-category_name='".$row['name']."' data-category_image='".$row['image']."' data-thumbnail='".$row['thumbnail']."' onclick='show_category(this)' class='btn menu-icon vd_bg-green'> 
                           <i class='fa fa-eye'></i> 
                        </a> 
                        
                        <a data-action='delete_category' data-category_id='".$row['id']."' data-category_name='".$row['name']."' data-category_image='".$row['image']."' onclick='delete_category(this)' class='btn menu-icon vd_bg-red'> 
                           <i class='fa fa-times'></i> 
                        </a>
                        </td>
                     </tr>";
}


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/adminAllCategories.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'All Categories');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('pagination', $pagination);
$template->add_snippet('categories', $categories_rows);
$template->add_snippet('header', $includes->backoffice_header());

/** Display page contents **/
echo $template->display();
