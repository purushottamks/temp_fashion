<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'frontdesk_assets/';
/** instances of models **/
$includes = new Includes();
$user = new User();
$pagination = new Pagination();
$product = new Product();
$security = new Security();
$cart = new Cart();

/////unset($_SESSION['cart']);

if(isset($_POST['ajax']) && $_POST['ajax'] == 1){

    if(isset($_POST['action']) && $_POST['action']=="addToCart"){
        $product_id = $security->post('productId');
        $cart->addItem($product_id, 1, 'product');
        echo 'added_to_cart';
    }
    die();
}


if(isset($_GET['param1'])){

    if(isset($_GET['param2'])){
        $page = $security->get('param2');
    }else{
        $page = 1;
    }

    $perPage = 50;
    $offset = ($page*$perPage)-$perPage;
    $category = $security->get('param1');
    $products = $product->productsByCategory($category, $perPage, $page);

    $products_list = $products[0];
    $pagination = $products[1];
    $products_html = '';
    foreach ($products_list as $product){

        $products_html.='<!-- single-product start -->
						<div class="col-lg-4 col-md-4 col-sm-4">
							<div class="single-product">
								<div class="product-img">
									<a href="#">
										<img class="primary-image" src="'.BASE_URL.'uploads/'.$product['image'].'" alt="" />
										<img class="secondary-image" src="'.BASE_URL.'uploads/'.$product['image'].'" alt="" />
									</a>
									<div class="actions">
										<div class="action-buttons">
											<div class="add-to-cart">
												<a href="javascript:void(0)" onclick="addToCart('.$product['id'].')">Add to cart</a>
											</div>
											<div class="quickviewbtn">
												<a href="'.BASE_URL.'uploads/'.$product['image'].'" data-toggle="tooltip" title="Quick View"><i class="fa fa-search-plus"></i></a>
											</div>
										</div>
									</div>
								</div>
								<div class="product-content">
									<h2 class="product-name"><a href="#">'.$product['name'].'</a></h2>
									<div class="pro-rating">
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
										<a href="#"><i class="fa fa-star"></i></a>
									</div>
									<div class="price-box">
										<span class="new-price">'.$product['price'].'</span>
									</div>
								</div>
							</div>
						</div>
						<!-- single-product end --> ';
    }

}else{
    $products = "No products found";
}

/** Template **/
$template = new Template();
$template->filename = 'views/frontdesk/outlet.tpl';

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
$template->add_snippet('cart_web', $includes->cart_web());
$template->add_snippet('products', $products_html);
$template->add_snippet('pagination', $pagination);
$template->add_snippet('cart_web', $includes->cart_web());

/** Display page contents **/
echo $template->display();
////print_r($_SESSION);