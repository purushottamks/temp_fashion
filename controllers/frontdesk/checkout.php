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
$order = new Order();
$db = Database::getInstance();
$notification = new Notification();
$order = new Order();
$info = '';

if(isset($_POST['ajax']) && $_POST['ajax'] == 1){

    if(isset($_POST['sat_user_to_session'])){
        $data['country'] = $security->post('country');
        $data['first_name'] = $security->post('first_name');
        $data['last_name'] = $security->post('last_name');
        $data['company'] = $security->post('company_name');
        $data['address'] = $security->post('street_address');
        $data['house'] = $security->post('house_number');
        $data['city'] = $security->post('city');
        $data['postcode'] = $security->post('post_code');
        $data['email'] = $security->post('email');
        $data['phone'] = $security->post('phone');
        $user_id =  $user->registerCustomer($data);
        $order_id = $order->addOrder($user_id);
        if($order_id){
            echo $order_id;
        }else{
            echo 'error';
        }
      }

    die();
}





$shipping = 10;
$subtotal = 0;
$total = 0;
$cart = $cart->getCart();
$cart_html = '';

if(isset($_SESSION['cart'])){
    foreach ($cart as $product){
        $product_total = ($product['price']*$product['quantity']);
        $subtotal+= $product_total;
        $cart_html.= '<tr class="cart_item">
                        <td class="product-name">
                            '.$product['name'].' <strong class="product-quantity"> × '.$product['quantity'].'</strong>
                        </td>
                        <td class="product-total">
                            <span class="amount">'.$product_total.'</span>
                        </td>
                      </tr>';
    }
}else{
    header("location:".BASE_URL."");
}


$total = $subtotal+$shipping;

/** Template **/
$template = new Template();
$template->filename = 'views/frontdesk/checkout.tpl';

/** Sections **/
$template->frontdesk_section('header', 'inc');
$template->frontdesk_section('scripts', 'inc');
$template->frontdesk_section('js_links', 'inc');
$template->frontdesk_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('info', $info);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('main_navigation', $includes->main_navigation());
$template->add_snippet('mobile_navigation', $includes->mobile_navigation());
$template->add_snippet('cart_web', $includes->cart_web());
$template->add_snippet('subtotal', $subtotal);
$template->add_snippet('total', $total);
$template->add_snippet('cart_html', $cart_html);
$template->add_snippet('shipping', $shipping);

/** Display page contents **/
echo $template->display();
////print_r($_SESSION);