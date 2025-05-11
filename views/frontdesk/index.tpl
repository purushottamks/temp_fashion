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
	
	<!-- HOME SLIDER -->
	<div class="slider-wrap">
		<div class="fullwidthbanner-container" >
			<div class="fullwidthbanner">
				<ul>
					<li data-transition="parallaxtoright,parallaxtoleft" data-slotamount="7" data-masterspeed="600"  data-saveperformance="off" >
						<img src="{{assets_url}}img/slider/slider-1/slider1.jpg"  alt="banner_slider02"  data-bgposition="left bottom" data-bgfit="cover" data-bgrepeat="no-repeat">
					<div class="tp-caption customin"
						 data-x="304"
						 data-y="111"
						 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:3;scaleY:3;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						 data-speed="1000"
						 data-start="1500"
						 data-easing="easeInOutExpo"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 5;">
						<img src="{{assets_url}}img/slider/slider-1/slider-text-1.png" alt="">
					</div>
					<div class="tp-caption customin"
						 data-x="300"
						 data-y="200"
						 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:2;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						 data-speed="1000"
						 data-start="2000" 
						 data-easing="easeInOutExpo"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 6;">
						<img src="{{assets_url}}img/slider/slider-1/slider-text-2.png" alt="">
					 </div>
					 <div class="tp-caption small_text customin tp-resizeme"
						 data-x="300" 
						 data-y="300"
						 data-customin="x:0;y:0;z:0;rotationX:0;rotationY:0;rotationZ:0;scaleX:2;scaleY:1;skewX:0;skewY:0;opacity:0;transformPerspective:600;transformOrigin:50% 50%;"
						 data-speed="1000"
						 data-start="2500"
						 data-easing="easeInOutExpo"
						 data-splitin="none"
						 data-splitout="none"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 7; max-width: 742px; max-height: 60px; white-space: normal;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.  sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
					 </div>
					 <div class="tp-caption randomrotate"
						 data-x="299"
						 data-y="400"
						 data-speed="1000"
						 data-start="3000"
						 data-easing="Power3.easeInOut"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 8;"><a href="#"><img src="{{assets_url}}img/slider/slider-1/slider-text-4.png" alt=""></a>
					 </div>
					</li>

					<li data-transition="parallaxtoright,parallaxtoleft" data-slotamount="7" data-masterspeed="300"  data-saveperformance="off" >
						<img src="{{assets_url}}img/slider/slider-1/slider2.jpg"  alt="banner_slider01"  data-bgposition="center top" data-bgfit="cover" data-bgrepeat="no-repeat">
					<div class="tp-caption lft"
						 data-x="304"
						 data-y="111"
						 data-speed="1000"
						 data-start="1200"
						 data-easing="easeInOutExpo"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 5;"><img src="{{assets_url}}img/slider/slider-1/slider-text-1.png" alt="">
					</div>
					<div class="tp-caption lfb"
						 data-x="303"
						 data-y="196"
						 data-speed="1200"
						 data-start="1500"
						 data-easing="easeInOutExpo"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 6;"><img src="{{assets_url}}img/slider/slider-1/slider-text-2.png" alt="">
					</div>
					<div class="tp-caption small_text lfl tp-resizeme"
						 data-x="305"
						 data-y="308"
						 data-speed="1000"
						 data-start="2000"
						 data-easing="easeInOutBack"
						 data-splitin="none"
						 data-splitout="none"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 7; max-width: 372px; max-height: 39px; white-space: normal;">Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
					</div>
					<div class="tp-caption randomrotate"
						 data-x="301"
						 data-y="390"
						 data-speed="1000"
						 data-start="2500"
						 data-easing="Power3.easeInOut"
						 data-elementdelay="0.1"
						 data-endelementdelay="0.1"
						 data-endspeed="300"
						 style="z-index: 8;"><a href="#"><img src="{{assets_url}}img/slider/slider-1/slider-text-4.png" alt=""></a>
					</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- END HOME SLIDER -->




		<!-- banner-area start -->
		<div class="banner-area">
			<div class="container">
				<div class="row">


					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner1.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->


					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner1.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->


				</div>
			</div>
		</div>
		<!-- banner-area end -->




	<!-- banner-area start -->
	<div class="banner-area">
		<div class="container">
			<div class="row">
				<!-- single-banner start -->
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="single-banner">
						<a href="#"><img src="{{assets_url}}img/banner/banner1.jpg" alt="" /></a>
					</div>
				</div>
				<!-- single-banner end -->


				<!-- single-banner start -->
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="single-banner">
						<a href="#"><img src="{{assets_url}}img/banner/banner1.jpg" alt="" /></a>
					</div>
				</div>
				<!-- single-banner end -->


				<!-- single-banner start -->
				<div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
					<div class="single-banner">
						<a href="#"><img src="{{assets_url}}img/banner/banner1.jpg" alt="" /></a>
					</div>
				</div>
				<!-- single-banner end -->
			</div>
		</div>
	</div>	
	<!-- banner-area end -->



		<!-- features-area start -->
		<div class="features-area">
			<div class="container">
				<!-- section-heading start -->
				<div class="row">
					<div class="col-md-12">
						<div class="section-heading">
							<h3>Exclusive Italian Fabrics</h3>
						</div>
					</div>
				</div>


				<!-- section-heading start -->
				<div class="row">
					<div class="col-md-12">

						<h4 class="text-center">
							For the finest custom tailored experience, be sure to explore<br>
							our selection of premium fabrics from one of the world's oldest<br>
							fabric mills, Vitale Barberis Canonico.</h4>

						<p style="text-align: center;">
							<button class="btn-primary">Explore Our Fabrics</button>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- features-area end -->


	<!-- new-product-area end -->


		<!-- banner-2-area start -->
		<div class="banner-2-area">
			<div class="container">
				<div class="row">
					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner6.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->

					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner6.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->
				</div>
			</div>
		</div>
		<!-- banner-2-area end -->


		<!-- banner-2-area start -->
		<div class="banner-2-area">
			<div class="container">
				<div class="row">
					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner6.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->

					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner6.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->


				</div>
			</div>
		</div>
		<!-- banner-2-area end -->

		<!-- banner-2-area start -->
		<div class="banner-2-area">
			<div class="container">
				<div class="row">

					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner5.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->

					<!-- single-banner start -->
					<div class="col-lg-6 col-md-6 col-sm-6">
						<div class="single-banner">
							<a href="#"><img src="{{assets_url}}img/banner/banner5.jpg" alt="" /></a>
						</div>
					</div>
					<!-- single-banner end -->
				</div>
			</div>
		</div>
		<!-- banner-2-area end -->

		<!-- brand-area start -->
	<div class="brand-area">
		<div class="container">
			<!-- section-heading start -->
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading">
						<h3>Our Satisfied Customers</h3>
					</div>
				</div>
			</div>
			<!-- section-heading end -->		
			<div class="row">
				<div class="brand-curosel">
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
					<!-- single-brand start -->
					<div class="col-md-2">
						<div class="single-brand">
							<a href="#"><img src="{{assets_url}}img/brand/1.png" alt="" /></a>
						</div>
					</div>
					<!-- single-brand end -->
				</div>
			</div>
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
		
		<!-- rs-plugin js -->
		<script type="text/javascript" src="{{assets_url}}lib/rs-plugin/js/jquery.themepunch.tools.min.js"></script>
		<script type="text/javascript" src="{{assets_url}}lib/rs-plugin/js/jquery.themepunch.revolution.min.js"></script>
		<script src="{{assets_url}}lib/rs-plugin/rs.home.js"></script>
		
		<!-- wow js -->
        <script src="{{assets_url}}js/wow.js"></script>
		<script>
			new WOW().init();
		</script>	
		
		<!-- plugins js -->
        <script src="{{assets_url}}js/plugins.js"></script>
		
		<!-- main js -->
        <script src="{{assets_url}}js/main.js"></script>

    </body>

</html>
