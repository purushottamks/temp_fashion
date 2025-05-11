<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$order = new Order();
$security = new Security();
$cart = new Cart();
$productObj = new Product();
$accessory = new Accessory();
$fabric = new Fabric();
$info = '';


if(!$user->loged_in()){
    header('location:adminLogin');
}

if(!$userRole->can_access(array(1))){
    header('location:adminLogin');
}

$order_id =  $security->get('param1');
$order_detail = $order->getOrder($order_id);
$orderObject = json_decode($order_detail['order_object'], true);
$user_detail = $user->user_info($order_detail['user_id']);
$orderHtml = '';
$total = 0;

foreach($orderObject as $id=>$product){

    if($id == 'customSuit'){
        $custom_detail = $cart->customProductForCart($product['product'], $product['quantity']);
        $total+= ($custom_detail['price']*$product['quantity']);
        $orderHtml.='<tr>
                        <td class="text-center">'.$custom_detail['quantity'].'</td>
                        <td>'.$custom_detail['name'].' 
                          <button class="btn btn-primary btn-xs" onclick="customDetail()">Detail</button>
                        </td>
                        <td class="text-right">'.$custom_detail['price'].'</td>
                        <td class="text-right">'.$custom_detail['price']*$product['quantity'].'</td>
                    </tr>';

        $orderHtml.='<tr>';
        $orderHtml.='<td colspan="4">';
        $orderHtml.='<table class="table table-bordered">';
                        foreach($product['product'] as $key=>$component){
                             switch($key){
                                 case 'fabric':
                                     $component = $fabric->fabricName($component);
                                     break;
                                 case 'lining':
                                     $component = $fabric->fabricName($component);
                                     break;
                                 case 'lapelFabric':
                                     $component = $fabric->fabricName($component);
                                     break;
                                 case 'waistcoatFabric':
                                     $component = $fabric->fabricName($component);
                                     break;
                                 case 'trousersFabric':
                                     $component = $fabric->fabricName($component);
                                     break;
                             }
                             $orderHtml.='<tr><th colspan="2">'.$key.'</th><td colspan="2">'.$component.'</td></tr>';
                        }
        $orderHtml.='</table>';
        $orderHtml.='</td>';
        $orderHtml.='</tr>';

        }else{
        if($product['item'] == "accessory"){
            $product_info = $accessory->accessoryInfo($id);
            $total+= ($product_info['price']*$product['quantity']);
            $orderHtml.='<tr>
                        <td class="text-center">'.$product['quantity'].'</td>
                        <td>'.$product_info['name'].'</td>
                        <td class="text-right">'.$product_info['price'].'</td>
                        <td class="text-right">'.$product_info['price']*$product['quantity'].'</td>
                        </tr>';
        }else{
            $product_info = $productObj->productInfo($id);
            $total+= ($product_info['price']*$product['quantity']);
            $orderHtml.='<tr>
                        <td class="text-center">'.$product['quantity'].'</td>
                        <td>'.$product_info['name'].'</td>
                        <td class="text-right">'.$product_info['price'].'</td>
                        <td class="text-right">'.$product_info['price']*$product['quantity'].'</td>
                    </tr>';
        }
    }
}


/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/orderDetail.tpl';

/** Sections **/
//$template->backoffice_section('header', 'inc');
$template->backoffice_section('sidebar', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('footer', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('page_title', 'Order Detail');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('navigation', $includes->sidebar());
$template->add_snippet('orderHtml', $orderHtml);
$template->add_snippet('email', $user_detail['email']);
$template->add_snippet('date_time', $order_detail['date_time']);
$template->add_snippet('total', $total);
$template->add_snippet('header', $includes->backoffice_header());



/** Display page contents **/
echo $template->display();
