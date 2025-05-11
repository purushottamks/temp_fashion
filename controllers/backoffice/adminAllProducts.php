<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';


/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$product = new Product();
$security = new Security();
$category = new Category();
$collecion = new Collection();
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


if(isset($_POST['edit_product'])){

    $params = array();
    $product_id = $security->post('product_id');
    $params['name'] = $security->post('product_name');
    $params['price'] = $security->post('product_price');
    $params['category_id'] = $security->post('product_category');
    $params['is_custom'] = 'no';
    if(isset($_POST['custom'])){
        $params['is_custom'] = 'yes';
    }


    if($_FILES['product_image']['error'] == 0){
        $old_image = BASE_DIR.'/uploads/'.$security->post('old_image');
        $thumbnail = BASE_DIR.'/uploads/'.$security->post('thumbnail');
        $uploaded_img = $image->upload_image('product_image', 'productImages');
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

    if($db->update('products', $params, " id = {$product_id}")){
        $info = $notification->success('Updated Successfully');
    }else{
        $info = $notification->danger('Error please try again');
    }


}

if(isset($_POST['ajax']) && $_POST['ajax']==1){

    if(isset($_POST['action']) && $_POST['action']=='view_product'){
        echo 'view product';
    }

    if(isset($_POST['action']) && $_POST['action']=='edit_product'){
        echo 'edit product';

    }

    if(isset($_POST['action']) && $_POST['action']=='delete_product'){
        $product_id = $security->post('product_id');
        if($db->delete('products', " id = {$product_id}")){
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
$products = $product->products($perPage, $offset ,$page);

$rows = $products[0];
$pagination = $products[1];

$products_rows = '';
foreach($rows as $row){
    $products_rows.="<tr id='row_".$row['id']."'>
                        <td>".++$offset."</td>
                        <td>".$row['name']."</td>
                        <td><img class='img img-thumbnail' src='".BASE_URL."uploads/".$row['thumbnail']."' /></td>
                        <td>".$row['price']."</td>
                        <td>".$category->categoryName($row['category_id'])."</td>
                        <td>collection</td>
                        <td class='menu-action'>
                        <a data-action='view_product' data-custom='".$row['is_custom']."' data-product_id='".$row['id']."' data-product_name='".$row['name']."' data-product_price='".$row['price']."' data-product_image='".$row['image']."' data-thumbnail='".$row['thumbnail']."' data-product_category='".$row['category_id']."' onclick='show_product(this)'  class='btn menu-icon vd_bg-green'> 
                           <i class='fa fa-eye'></i> 
                        </a> 
                        <a data-action='delete_product' data-custom='".$row['is_custom']."' data-product_id='".$row['id']."' data-product_name='".$row['name']."' data-product_price='".$row['price']."' data-product_image='".$row['image']."' data-product_category='".$row['category_id']."' onclick='delete_product(this)' class='btn menu-icon vd_bg-red'> 
                           <i class='fa fa-times'></i> 
                        </a>
                        </td>
                     </tr>";
}


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/adminAllProducts.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('page_title', 'All Products');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('products', $products_rows);
$template->add_snippet('pagination', $pagination);
$template->add_snippet('categories', $category->categories_dropdown());
$template->add_snippet('header', $includes->backoffice_header());

/** Display page contents **/
echo $template->display();
