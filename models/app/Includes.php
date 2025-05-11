<?php class Includes{
	  private $template;
	  private $product;
	  private $cart;
	  private $admin_assets_url;
	  private $updateManager;


	  public function __construct()
      {
          $this->cart = new Cart();
          $this->admin_assets_url = BASE_URL.'/backoffice_assets/';
          $this->updateManager = new UpdateManager();
      }


	  private function template() {
		  if($this->template === null){
			  $this->template = new Template();
		  }
		  return $this->template;
	  }

	  public function sidebar() {
	       $this->product = new Product();
		   $this->template()->filename = "views/backoffice/includes/sidebar.inc";

		   if(true) { // for admin
			   $nav_bar =  '';

			  }else {//if user is loged in
			   $nav_bar = '';
			  }

		  $this->template()->add_snippet("base_url", BASE_URL);
          return $this->template()->display();
	  }
	  
    public function backoffice_header() {
       $this->template()->filename = "views/backoffice/includes/header.inc";
        if(true) { // for admin
            $nav_bar =  '';
           }else {//if user is loged in
           $nav_bar = '';
           }

        $updateResult = $this->updateManager->getUpdateDetails('2.4.4');
        $upResult = json_decode($updateResult);

        $latestVersion = @$upResult->version;
        $updateError   = @$upResult->error;
        $update_button = ' <li id="top-menu-1" class="one-icon mega-li">
                                    <button class="btn btn-primary" >
                                        Version 2 Available
                                    </button>
                              </li>';

        if(($updateError=="invalid") || ($updateError=="")){
            $this->template()->add_snippet("update_button", "");
        }else{
            $this->template()->add_snippet("update_button", $update_button);
        }

       $this->template()->add_snippet("base_url", BASE_URL);
       $this->template()->add_snippet("assets_url", $this->admin_assets_url);

       return $this->template()->display();
    }

    public function main_navigation() {
       $this->template()->filename = "views/frontdesk/includes/main_navigation.inc";
        if(true) { // for admin
            $nav_bar =  '';
           }else {//if user is loged in
           $nav_bar = '';
           }

       $this->template()->add_snippet("base_url", BASE_URL);
       return $this->template()->display();
    }

    public function mobile_navigation() {
        $this->template()->filename = "views/frontdesk/includes/mobile_navigation.inc";
        if(true) { // for admin
            $nav_bar =  '';
        }else {//if user is loged in
            $nav_bar = '';
        }
        $this->template()->add_snippet("base_url", BASE_URL);
        return $this->template()->display();
    }

    public function cart_web() {
        $subtotal = '';
        $cart_html = '';
	    $cart = $this->cart->getCart();
        $this->template()->filename = "views/frontdesk/includes/cart_web.inc";

        $shipping = 0;
        $subtotal = 0;
        $total_html = '';
        $count = 0 ;

        if($cart && sizeof($cart) > 0){

            foreach ($cart as $product){
                $shipping+=10;
                $count+=1;

                /*if($product['customProduct']){

                    ///echo 'custom';

                }else{*/
                    $product_total = $product['price']*$product['quantity'];
                    $subtotal+= $product_total;
                    $cart_html.= '<div class="cart-img-details">
                            <div class="cart-img-photo">
                                <a href="#"><img src="'.BASE_URL."uploads/".$product['thumbnail'].'" alt="" /></a>
                                <span class="quantity">'.$product['quantity'].'</span>
                            </div>
                            <div class="cart-img-contaent">
                                <a href="#"><h4>'.$product['name'].'</h4></a>
                                <span>'.$product['price'].'</span>
                            </div>
                            <div class="pro-del"><a href="#"><i class="fa fa-times-circle"></i></a>
                            </div>
                        </div>';
               //// }
            }

            $total = $subtotal+$shipping;
            $total_html = '<div class="cart-inner-bottom">
                            <p class="shipping">Shipping: <span class="amount">'.$shipping.'</span></p>
                            <p class="shipping">Subtotal: <span class="amount">'.$subtotal.'</span></p>
                            <p class="total">Total: <span class="amount">'.$total.'</span></p>
                            <div class="clear"></div>
                            <p class="cart-button-top"><a href="'.BASE_URL.'checkout">Checkout</a></p>
                       </div>';

        }


        $web_small_cart = $cart_html.$total_html;

        /// INCLUDE SNIPPETS ///
        $this->template()->add_snippet("web_small_cart", $web_small_cart);
        $this->template()->add_snippet("count", $count);

        if(true) { // for admin
            $nav_bar =  '';
        }else {//if user is loged in
            $nav_bar = '';
        }
        $this->template()->add_snippet("base_url", BASE_URL);
        return $this->template()->display();
    }

    public function popup_modal($products_dropdown, $box_image_src, $store) {
		  $this->template()->filename = "views/wordpress_includes/popup_modal.inc";
		  $this->template()->add_snippet('box_image_src', $box_image_src);
		  $this->template()->add_snippet('products_dropdown', $products_dropdown);
		  $this->template()->add_snippet('store', $store);
		  return $this->template()->display();
	  }


  }/////end class