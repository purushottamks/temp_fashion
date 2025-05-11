<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'frontdesk_assets/';
/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$pagination = new Pagination();
$product = new Product();
$accessory = new Accessory();
$security = new Security();
$categoryObj = new AccessoryCat();
$cart = new Cart();

/*
 * security checks
 * */

/*if(!$user->loged_in()){
    header('location:login');
}
if(!$userRole->can_access(array(1))){
    header('location:login');
}*/


if(isset($_POST['ajax']) && $_POST['ajax'] == 1){
    if(isset($_POST['action']) && $_POST['action']=="addToCart"){
        $accessoryId = $security->post('accessoryId');
        $cart->addItem($accessoryId, 1,'accessory');
        echo 'added_to_cart';
    }
    die();
}



$accessory_html = '';
if(isset($_GET['param1'])){

    if(isset($_GET['param2'])){
        $page = $security->get('param2');
    }else{
        $page = 1;
    }

    $perPage = 50;
    $offset = ($page*$perPage)-$perPage;
    $category = $security->get('param1');
    $category_name = $categoryObj->categoryName($category);
    $accessories = $accessory->accessoryByCategory($category, $perPage, $page);
    $accessories_list = $accessories[0];
    $pagination = $accessories[1];

    foreach ($accessories_list as $accessory){

        $accessory_html.='<!-- single-product start -->
						<div class="col-lg-4 col-md-4 col-sm-4">
							<div class="single-product">
								<div class="product-img">
									<a href="#">
										<img class="primary-image" src="'.BASE_URL.'uploads/'.$accessory['image'].'" alt="" />
										<img class="secondary-image" src="'.BASE_URL.'uploads/'.$accessory['image'].'" alt="" />
									</a>
									<div class="actions">
										<div class="action-buttons">
											<div class="add-to-cart">
												<a href="javascript:void(0)" onclick="addToCart('.$accessory['id'].')">Add to cart</a>
											</div>
											<div class="quickviewbtn">
												<a href="#" data-toggle="tooltip" title="Quick View"><i class="fa fa-search-plus"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="product-content">
									<h2 class="product-name"><a href="#">'.$accessory['name'].'</a></h2>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
									</div>
									<div class="price-box">
										<span class="new-price">'.$accessory['price'].'</span>
									</div>
								</div>
							</div>
						</div>
						<!-- single-product end --> ';
    }

}else{
    $products = "No accessory found";
}

/** Template **/
$template = new Template();
$template->filename = 'views/frontdesk/accessories.tpl';

/** Sections **/
$template->frontdesk_section('header', 'inc');
$template->frontdesk_section('scripts', 'inc');
$template->frontdesk_section('js_links', 'inc');
$template->frontdesk_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('main_navigation', $includes->main_navigation());
$template->add_snippet('mobile_navigation', $includes->mobile_navigation());
$template->add_snippet('accessories', $accessory_html);
$template->add_snippet('pagination', $pagination);
$template->add_snippet('current_category', $category_name);
$template->add_snippet('category_links', $categoryObj->categories_links());
$template->add_snippet('cart_web', $includes->cart_web());
/** Display page contents **/
echo $template->display();
