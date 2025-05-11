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
						<li>Shop</li>
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
			<div class="jumbotron">
				<h3 class="heading">
					Thank you for your order.
				</h3>
			</div>
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
