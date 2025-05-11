<!doctype html>
<html class="no-js" lang="">

<head>
	<!-- Basic page needs
    ============================================ -->
	<meta charset="utf-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<title>INVICTA GENTLEMAN</title>
	<meta name="description" content="">

	<!-- Mobile specific metas
    ============================================ -->
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<!-- fonts
    ============================================ -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>

	<!-- Favicon
    ============================================ -->
	<link rel="shortcut icon" type="image/x-icon" href="{{assets_url}}img/favicon.png">

	<!-- CSS  -->

	<!-- Bootstrap CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/bootstrap.min.css">

	<!-- font-awesome CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/font-awesome.min.css">

	<!-- owl.carousel CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/owl.carousel.css">

	<!-- owl.theme CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/owl.theme.css">

	<!-- owl.transitions CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/owl.transitions.css">

	<!-- fancybox CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/fancybox/jquery.fancybox.css">

	<!-- animate CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/animate.css">

	<!-- meanmenu CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/meanmenu.min.css" media="all" />

	<!-- normalize CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/normalize.css">

	<!-- RS slider CSS
    ============================================ -->
	<link rel="stylesheet" type="text/css" href="{{assets_url}}lib/rs-plugin/css/settings.css" media="screen" />

	<!-- main CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/main.css">

	<!-- style CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/style.css">

	<!-- responsive CSS
    ============================================ -->
	<link rel="stylesheet" href="{{assets_url}}css/responsive.css">

	<!-- modernizr js
    ============================================ -->
	<script src="{{assets_url}}js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
<![endif]-->

<!-- Add your site or application content here -->

<!-- header start -->
<header>
	<!-- header-mid-area start -->
	<div class="header-mid-area">
		<div class="container">
			<div class="row">
				<!-- logo start -->
				<div class="col-lg-6 col-md-6 col-sm-4 col-xs-12">
					<div class="logo">
						<a href="{{base_url}}"><img src="{{assets_url}}img/logo/logo.png"  style="width: 230px;" alt="" /></a>
					</div>
				</div>
				<!-- logo end -->
				<div class="col-lg-6 col-md-6 col-sm-8 col-xs-12">
					<!-- cart-total start -->
					{{cart_web}}
					<!-- cart-total end -->
				</div>
			</div>
		</div>
	</div>
	<!-- header-mid-area end -->
	<!-- mainmenu-area start -->
	<div class="mainmenu-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12 col-sm-12">
					<div class="mainmenu">
						<nav>
							{{main_navigation}}
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- mainmenu-area end -->
	<!-- mobile-menu-area start -->
	<div class="mobile-menu-area">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="mobile-menu">
						{{mobile_navigation}}
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- mobile-menu-area end -->
</header>
<!-- header end -->

<!-- breadcrumb-area start -->
<div class="breadcrumb-area">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="breadcrumb">
					<ul>
						<li><a href="">Home</a> <i class="fa fa-angle-right"></i></li>
						<li>Checkout</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- breadcrumb-area end -->


<!-- checkout-area start -->
<div class="checkout-area">
	<div class="container">
		<div class="row">
			{{info}}
			<form action="" method="post" id="checkout_form">
				<input type="hidden" name ="sat_user_to_session" value="1">
				<input type="hidden" name ="ajax" value="1">
				<div class="col-lg-6 col-md-6">
					<div class="checkbox-form">
						<h3>Billing Details</h3>
						<div class="row">
							<div class="col-md-12">
								<div class="country-select">
									<label>Country <span class="required">*</span></label>
									<select id="country" name="country" required >
										<option value="pakistan">Pakistan</option>
										<option value="usa">United State</option>
										<option value="canade">Canada</option>
										<option value="norway">Norway</option>
										<option value="australia">Australia</option>
									</select>
								</div>
							</div>
							<div class="col-md-6">
								<div class="checkout-form-list">
									<label>First Name <span class="required">*</span></label>
									<input type="text" placeholder="First Name" id="first_name" name="first_name" required />
								</div>
							</div>
							<div class="col-md-6">
								<div class="checkout-form-list">
									<label>Last Name <span class="required">*</span></label>
									<input type="text" placeholder="Last Name" id="last_name" name="last_name" required />
								</div>
							</div>
							<div class="col-md-12">
								<div class="checkout-form-list">
									<label>Company Name</label>
									<input type="text" placeholder="Company Name" id="company_name" name="company_name" required />
								</div>
							</div>
							<div class="col-md-12">
								<div class="checkout-form-list">
									<label>Address <span class="required">*</span></label>
									<input type="text" placeholder="Street address" id="street_address" name="street_address" required  />
								</div>
							</div>
							<div class="col-md-12">
								<div class="checkout-form-list">
									<input type="text" placeholder="Apartment, suite, unit etc. (optional)" id="house_number" name="house_number" required />
								</div>
							</div>
							<div class="col-md-12">
								<div class="checkout-form-list">
									<label>Town / City <span class="required">*</span></label>
									<input type="text" placeholder="Town / City"  id="city" name="city"  required />
								</div>
							</div>

							<div class="col-md-6">
								<div class="checkout-form-list">
									<label>Postcode / Zip <span class="required">*</span></label>
									<input type="text" placeholder="Postcode / Zip" id="post_code" name="post_code"  required />
								</div>
							</div>
							<div class="col-md-6">
								<div class="checkout-form-list">
									<label>Email Address <span class="required">*</span></label>
									<input type="email" placeholder="" id="email" name="email"  required />
								</div>
							</div>
							<div class="col-md-6">
								<div class="checkout-form-list">
									<label>Phone  <span class="required">*</span></label>
									<input type="text" placeholder="Phone" id="phone" name="phone"  required />
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6">
					<div class="your-order">
						<h3>Your order</h3>
						<div class="your-order-table table-responsive">
							<table>
								<thead>
								<tr>
									<th class="product-name">Product</th>
									<th class="product-total">Total</th>
								</tr>
								</thead>
								<tbody>
								{{cart_html}}
								</tbody>
								<tfoot>
								<tr class="cart-subtotal">
									<th>Cart Subtotal</th>
									<td><span class="amount">{{subtotal}}</span></td>
								</tr>
								<tr class="shipping">
									<th>Shipping</th>
									<td>
										{{shipping}}
									</td>
								</tr>
								<tr class="order-total">
									<th>Order Total</th>
									<td><strong><span class="amount">{{total}}</span></strong>
									</td>
								</tr>
								</tfoot>
							</table>
						</div>
						<div class="payment-method">
							<div class="payment-accordion">
								<!-- ACCORDION START -->
								<h3>PayPal <img src="{{assets_url}}img/cart/payment.png" alt="" /></h3>
								<div class="payment-content">
									<p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
								</div>
								<!-- ACCORDION END -->
							</div>

							<div class="order-button-payment">
								<input type="submit" id="place_order" name="place_order" value="Place order" />
							</div>

						</div>
					</div>
				</div>
			</form>

			<form action="https://www.sandbox.paypal.com/cgi-bin/webscr" id="one_time_payment_from" name="contributiontracking" method="post">
				<input type="hidden" name="business" value="Davidwelchtraining-facilitator@bigpond.com" />
				<input type="hidden" name="return" value="{{base_url}}thankyou" />
				<input type="hidden" name="cancel_return" value="{{base_url}}paypalCancel" />
				<input type="hidden" name="notify_url" value="{{base_url}}paypalNotify" />
				<input type="hidden" name="cmd" value="_xclick" />
				<input type="hidden" name="no_note" value="1" />
				<input type="hidden" name="no_shipping" value="1">
				<input type="hidden" name="currency_code" value="USD" >
				<input type="hidden" name="country" value="USA" />
				<input type="hidden" name="item_name" value="Sneacker" />
				<input type="hidden" name="amount" value="{{total}}" />
				<input type="hidden" name="custom" id="custom" value="0" />
				<input type="hidden" name="quantity" id="credits_value"  value="1">
			</form>

		</div>
	</div>
</div>
<!-- checkout-area end -->

<!-- brand-area start -->
<div class="brand-area">
	<div class="container">
		<!-- section-heading start -->
		<div class="row">
			<div class="col-md-12">
				<div class="section-heading">
					<h3>Our Brands</h3>
				</div>
			</div>
		</div>
		<!-- section-heading end -->
		</div>
	</div>

<!-- brand-area end -->

<!-- footer start -->
   {{footer}}
<!-- footer end -->

<!-- JS -->

<!-- jquery js -->
<script src="{{assets_url}}js/vendor/jquery-1.11.2.min.js"></script>

<!-- price-slider js -->
<script src="{{assets_url}}js/price-slider.js"></script>

<!-- bootstrap js -->
<script src="{{assets_url}}js/bootstrap.min.js"></script>

<!-- owl.carousel.min js -->
<script src="{{assets_url}}js/owl.carousel.min.js"></script>

<!-- jquery.scrollUp js -->
<script src="{{assets_url}}js/jquery.scrollUp.min.js"></script>

<!-- mixitup js -->
<script src="{{assets_url}}js/jquery.mixitup.min.js"></script>

<!-- fancybox js -->
<script src="{{assets_url}}js/fancybox/jquery.fancybox.pack.js"></script>

<!-- jquery-counterup js -->
<script src="{{assets_url}}js/jquery.counterup.min.js"></script>
<script src="{{assets_url}}js/waypoints.min.js"></script>

<!-- jquery-meanmenu js -->
<script src="{{assets_url}}js/jquery.meanmenu.js"></script>

<!-- jquery.collapse js -->
<script src="{{assets_url}}js/jquery.collapse.js"></script>

<!-- rs-plugin js -->
<script type="text/javascript" src="{{assets_url}}js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="{{assets_url}}js/jquery.themepunch.revolution.min.js"></script>
<script src="{{assets_url}}rs-plugin/rs.home.js"></script>

<!-- wow js -->
<script src="{{assets_url}}js/wow.js"></script>

<script>
    new WOW().init();
</script>

<!-- plugins js -->
<script src="{{assets_url}}js/plugins.js"></script>

<!-- main js -->
<script src="{{assets_url}}js/main.js"></script>


<script>

	$(document).ready(function(e){

	    $('#checkout_form').submit(function(e){
			let formData = new FormData(this);
			$.ajax({
				url:"",
				type:"post",
				data:formData,
				processData:false,
                contentType:false,
				success:function(response){
					if(response != 'error'){
					    $("#custom").val(response);
						$("#one_time_payment_from").submit();
					}
				},
				error:function(response){
					console.log(response);
				}
			});
            e.preventDefault();
		})
	})


    function addToCart(id){
       let base_url = "{{base_url}}";
       $.ajax({
            url:"",
            type:"post",
            data:{ajax:"1", action:"addToCart", productId:id},
            success:function(response){
                if(response == "added_to_cart"){
                    window.location.href = base_url+"cart";
                }
            },
            error:function(response){
                console.log(response);
            }
        })
    }

</script>


</body>

</html>
