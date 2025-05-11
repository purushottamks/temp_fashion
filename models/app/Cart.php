<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Cart
{
    protected $db;
    private $pagination;
    private $product;
    private $accessories;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
        $this->product = new Product();
        $this->accessories = new Accessory();
        if(session_id() == ''){
            session_start();
        }
    }


    public function addItem($product, $quantity, $item){
        $_SESSION['cart'][$product] = array("product"=>$product, "quantity"=>$quantity, "item"=>$item);
    }

    public function addCustomItem(){
        $custom_product = json_decode($_COOKIE['myCoat'], true);
        $_SESSION['cart']['customSuit'] = array("product"=>$custom_product, "quantity"=>$custom_product['quantity']);
    }


    public function removeItem($product, $item){ /// product or accessory
           if(isset($_SESSION['cart'][$product])){
                unset($_SESSION['cart'][$product]);
           }
    }


    public function getQuantity($product){
        if(isset($_SESSION['cart'][$product])){
            return $_SESSION['cart'][$product]['quantity'];
        }
    }


    public function cartItemsQuantity(){
        return count($_SESSION['cart']);
    }

    public function cartTotalAmount(){
        $total = 0;
        foreach($_SESSION['cart'] as $row){
            $product = $this->product->getCustomProducts();
            $total+=$product['price'];
        }
        return $total;
    }

    public function cartHTML(){
           return 'renderd HTML';
    }

    public function cartDropdown(){
           return 'renderd HTML';
    }

    public function getCart(){

        $products = array();
        if(isset($_SESSION['cart'])){
            foreach ($_SESSION['cart'] as $key=>$row){
                if($key == 'customSuit'){
                    $products[$key] = $this->customProductForCart($row['product'], $row['quantity']);
                    $products[$key]['quantity'] = $row['quantity'];
                    $products[$key]['item'] = 'customProduct';
                    $products[$key]['customProduct'] = true;
                }else{
                    if($row['item'] == 'product'){
                        $products[$key] = $this->product->productInfo($row['product']);
                        $products[$key]['item'] = 'product';
                    }else{
                        $products[$key] = $this->accessories->accessoryInfo($row['product']);
                        $products[$key]['item'] = 'accessory';
                    }
                    $products[$key]['quantity'] = $row['quantity'];
                }
            }
            return $products;
        }
        return false;
    }


    public function customProductForCart($customProduct, $quantity){

        if($customProduct['fabric'] == $customProduct['trousersFabric']){
            $name = $this->product->fabricName($customProduct['fabric']);
        }else{
            $name = "Jacket Fabric: ".$this->product->fabricName($customProduct['fabric'])."<br> Trouser Fabric: ".$this->product->fabricName($customProduct['trousersFabric']);
        }

        $arr = array(
            'name'=>$name,
            'price'=>$customProduct['price'],
            'quantity'=>$quantity,
            'id'=>'customSuit',
            'thumbnail'=>'thumbnail',
            'components'=>$customProduct
        );
        return $arr;
    }

}///end class

