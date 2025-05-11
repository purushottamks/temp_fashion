<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'frontdesk_assets/';
/** instances of models **/
$includes = new Includes();
$cart = new Cart();
$user = new User();
$pagination = new Pagination();
$product = new Product();
$security = new Security();
$db = Database::getInstance();
$coat = new Coat();

if(isset($_POST['ajax']) && $_POST['ajax'] == 1){

    if(isset($_POST['action']) && $_POST['action']=="addToCart"){
        $product_id = $security->post('productId');
        $cart->addItem($product_id, 1,'product');
        echo 'added_to_cart';
    }


    if(isset($_POST['action']) && $_POST['action']=="removeFromCart"){
        $product_id = $security->post('productId');
        $cart->removeItem($product_id, 'item');
        echo 'removed_from_cart';
    }

    if(isset($_POST['action']) && $_POST['action']=="updateCart"){
        $product_id = $security->post('productId');
        $quantity = $security->post('quantity');
        $cart->addItem($product_id, $quantity,'product');
        echo 'cart_updated';
    }

    if(isset($_POST['action']) && $_POST['action']=="updateCustomCart"){
        $product_id = $security->post('productId');
        $quantity = $security->post('quantity');
        $_SESSION['cart']['customSuit']['quantity'] = $quantity;
        $_SESSION['cart']['customSuit']['product']['quantity'] = $quantity;
        echo 'cart_updated';
    }

    die();
}


$shipping = 0;
$subtotal = 0;
$total = 0;
$cart = $cart->getCart();
$cart_html = '';

if($cart){

    foreach ($cart as $product){
        $shipping+=10;

        $product_total = $product['price']*$product['quantity'];
            $subtotal+= $product_total;
            $height = '';
            if(file_exists("uploads/".$product['thumbnail'])){
                $img = BASE_URL."uploads/".$product['thumbnail'];
                $img = '<a href=""><img src="'.$img.'" alt="No Image"></a>';
            }else{
                $img = $coat->previewCoat($product['components']);
                $img = '<a class="custom_cart_cell" href="">'.$img.'</a>';
                $height = "height:150px";
            }

            $cart_html.= '<tr style="'.$height.'">
                    <td class="">
                        '.$img.'
                    </td>
                    <td class="product-name">
                      <a href="#">'.$product['name'].'</a>
                    </td>
                    <td class="product-price">
                      <span class="amount">'.$product['price'].'</span>
                    </td>';


            if(isset($product['customProduct'])){
                $cart_html.= '<td class="product-quantity">
                       <input type="number" value="'.$product['quantity'].'" data-product_id="'.$product['id'].'" onchange="updateCustomCart(this)">
                      </td>';

                $cart_html.= '<td class="product-subtotal">'.$product_total.'</td>
                       <td class="product-remove">
                          <a href="javascript:void(0)" onclick="removeFromCart(\''.$product['id'].'\')"><i class="fa fa-times"></i></a>
                       </td>
                      </tr>';
            }else{
                $cart_html.= '<td class="product-quantity">
                       <input type="number" value="'.$product['quantity'].'" data-product_id="'.$product['id'].'" onchange="updateCart(this)">
                      </td>';
                $cart_html.= '<td class="product-subtotal">'.$product_total.'</td>
                       <td class="product-remove">
                          <a href="javascript:void(0)" onclick="removeFromCart('.$product['id'].')"><i class="fa fa-times"></i></a>
                       </td>
                      </tr>';
            }

    }
    $total = $subtotal+$shipping;
}



/** Template **/
$template = new Template();
$template->filename = 'views/frontdesk/cart.tpl';

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
$template->add_snippet('cart_html', $cart_html);
$template->add_snippet('subtotal', $subtotal);
$template->add_snippet('total', $total);
$template->add_snippet('shipping', $shipping);

/** Display page contents **/
echo $template->display();
