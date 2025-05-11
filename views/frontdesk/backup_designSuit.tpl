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
    <link rel="stylesheet" href="{{assets_url}}css/meanmenu.min.css" media="all"/>

    <!-- normalize CSS
    ============================================ -->
    <link rel="stylesheet" href="{{assets_url}}css/normalize.css">

    <!-- RS slider CSS
    ============================================ -->
    <link rel="stylesheet" type="text/css" href="{{assets_url}}lib/rs-plugin/css/settings.css" media="screen"/>

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


    <style>
        .suit_image {
            height: 800px;
            top:-100px !important;
        }

        a:hover, a:focus {
            color: #2a6496;
            text-decoration: none;
        }

        .square-service-block {
            position: relative;
            overflow: hidden;
            margin: 2px auto 0px auto;
        }

        .square-service-block a {
            background-color: #d0c0bf;
            border-radius: 5px;
            display: block;
            padding: 10px 30px;
            text-align: center;
            width: 100%;
        }

        .square-service-block a:hover {
            background-color: rgba(231, 76, 60, 0.8);
            border-radius: 5px;
        }

        .active_menu{
            background-color: rgba(231, 76, 60, 0.8) !important;
            border-radius: 5px;
        }

        .ssb-icon {
            color: #fff;
            display: inline-block;
            font-size: 28px;
            margin: 0 0 20px;
        }

        h2.ssb-title {
            color: #fff;
            font-size: 20px;
            font-weight: 200;
            margin: 0;
            padding: 0;
            text-transform: uppercase;
        }

        .square-service-block p {
            color: black !important;
            font-size: 12px;
            font-weight: bold;
        }

        .hidden {
            display: none;
            visibility: hidden;
        }

        .fabric_name {
            color: #3a6180;
            font-size: 10px;
            line-height: 0px;
        }
    </style>

</head>
<body>
<!--[if lt IE 8]>
<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade
    your browser</a> to improve your experience.</p>
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
                        <a href=""><img src="{{assets_url}}img/logo/logo.jpg" alt=""/></a>
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
                <div class="col-md-6"></div>
                <div class="col-md-6 introjs-relativePosition">
                    <div class="mobile-menu">
                        <nav id="dropdown">
                            {{mobile_navigation}}
                        </nav>
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

<!-- blog-area start -->
<div class="shop-area">
    <div class="container">
        <div class="row">
            <!-- blog-left-sidebar end -->
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <!-- toolbar start -->
                <div class="toolbar">
                </div>
                <!-- toolbar end -->
                <div class="clear"></div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="row">

                            <input type="hidden" id="active_view" value="front_coat">

                            <div class="col-md-3" style="height: 550px; overflow-y: scroll;">

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="select_product(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/Product.png">
                                        </div>
                                        <p class="font-sm">Select Product</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="fit_menu(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/fit.png">
                                        </div>
                                        <p class="font-sm">Fit</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="fabric_collection(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/fabric.png">
                                        </div>
                                        <p class="font-sm">Fabric</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="lining_collection(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/lining.png">
                                        </div>
                                        <p class="font-sm">Lining</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="buttonsCollection(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/button.png">
                                        </div>
                                        <p class="font-sm">Buttoning</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="lapels_collection(this)" >
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/Lapels.png">
                                        </div>
                                        <p class="font-sm">Lapels</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="pocket_submenu(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/Pockets.png">
                                        </div>
                                        <p class="font-sm">Pockets</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="vent_collection(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/Vents.png">
                                        </div>
                                        <p class="font-sm">Vents</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="jacket_detail(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/jacket_details.png">
                                        </div>
                                        <p class="font-sm">Jacket Details</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="trousers_menu(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/trousers.png">
                                        </div>
                                        <p class="font-sm">Trousers</p>
                                    </a>
                                </div>

                                <div class="square-service-block">
                                    <a href="javascript:void(0)" onclick="waistcoat_collection(this)">
                                        <div class="ssb-icon">
                                            <img src="{{base_url}}uploads/images/Waistcoat.png">
                                        </div>
                                        <p class="font-sm">Waistcoat</p>
                                    </a>
                                </div>

                            </div>


                            <div id="menu1" class="col-md-3 second_menu" style="display: none;">
                                <div class="col-md-12" style="padding: 0px;">
                                    <div class="square-service-block">
                                        <a href="javascript:void(0)" onclick="three_piece_suit(this)">
                                            <div class="ssb-icon">
                                                <img src="{{base_url}}uploads/images/three_piece.png">
                                            </div>
                                            <p class="font-sm">Three Piece Suit</p>
                                        </a>
                                    </div>
                                    <div class="square-service-block">
                                        <a href="javascript:void(0)" onclick="suit(this)">
                                            <div class="ssb-icon">
                                                <img src="{{base_url}}uploads/images/suit.png">
                                            </div>
                                            <p class="font-sm">Suit</p>
                                        </a>
                                    </div>
                                    <div class="square-service-block">
                                        <a href="javascript:void(0)" onclick="jacket(this)">
                                            <div class="ssb-icon">
                                                <img src="{{base_url}}uploads/images/jacket.png">
                                            </div>
                                            <p class="font-sm">Jacket</p>
                                        </a>
                                    </div>
                                    <div class="square-service-block">
                                        <a href="javascript:void(0)" onclick="trousers(this)">
                                            <div class="ssb-icon">
                                                <img src="{{base_url}}uploads/images/trousers.png">
                                            </div>
                                            <p class="font-sm">Trousers</p>
                                        </a>
                                    </div>
                                </div>
                            </div>



                            <div id="menu2" class="col-md-3 second_menu" style="display: none;">
                                <div class="col-md-12" style="padding: 0px;">

                                    <div class="square-service-block">
                                        <a href="javascript:void(0)" onclick="slim_size(this)">
                                            <p class="font-sm">Slim</p>
                                        </a>
                                    </div>

                                    <div class="square-service-block">
                                        <a href="javascript:void(0)" onclick="classic_size(this)">
                                            <p class="font-sm">Classic</p>
                                        </a>
                                    </div>

                                </div>
                            </div>


                            <div id="fabric_collection" class="col-md-8 second_menu" style="display: none; border: 2px solid darkgrey">
                                <div class="row" style="background-color: #f3e7e7; padding: 10px; margin-bottom: 15px;">

                                    <div class="col-md-3">
                                        <select class="fabric_filter" id="fabric_color">
                                            <option value="0">Color1</option>
                                            <option value="1">Color2</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select class="fabric_filter" id="fabric_material">
                                            <option value="0">Material1</option>
                                            <option value="1">Material2</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select class="fabric_filter" id="fabric_pattern">
                                            <option value="0">Pattern1</option>
                                            <option value="1">Pattern2</option>
                                        </select>
                                    </div>

                                    <div class="col-md-3">
                                        <select class="fabric_filter" id="fabric_category">
                                            <option value="0">Category1</option>
                                            <option value="1">Category2</option>
                                        </select>
                                    </div>

                                </div>
                                <div id="fabric_container" class="row">
                                    {{fabric_collection}}
                                </div>
                            </div>


                            <div id="lining_collection" class="col-md-8 second_menu" style="display: none; border: 2px solid darkgrey">

                                <div class="row">
                                    <h3>Matching &nbsp; <input type="checkbox"></h3>
                                    <hr>
                                </div>

                                <div id="lining_container" class="row">
                                    {{lining_collection}}
                                </div>
                            </div>


                            <div id="buttons_collection" class="col-md-8 second_menu" style="display: none; border: 2px solid darkgrey">


                                <div class="select-choice" data-tab-id="32" data-option-id="1701"
                                     data-parameter-id="display-option-523">
                                    <div class="option-image">
                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/buttoning-single-one.png.big_3d.png">
                                        <div class="option-radio-button">
                                        <span class="fa-stack pull-right">
                                            <input type="radio" id="" name="button_type" value="single_one" onclick="change_coat(this)" >
                                        </span>
                                        </div>
                                    </div>
                                    <div class="option-information">
                                        <div class="option-name">Single one button</div>
                                        <div class="option-description">The singel breasted jacket is a popular choice,
                                            particularily in recent years. Just a single button is a bit unusual, but
                                            has become more popular over the last few years.
                                        </div>
                                    </div>
                                </div>

                                <div class="select-choice selected" data-tab-id="32" data-option-id="1702"
                                     data-parameter-id="display-option-523">
                                    <div class="option-image">
                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/buttoning-single-two.png.big_3d.png">
                                        <div class="option-radio-button">
                                        <span class="fa-stack pull-right">
                                            <input type="radio" id="" name="button_type" value="single_two" onclick="change_coat(this)">
                                        </span>
                                        </div>
                                    </div>
                                    <div class="option-information">
                                        <div class="option-name">Single two buttons</div>
                                        <div class="option-description">The singel breasted jacket is a popular choice,
                                            particularily in recent years. Two buttons signals an easy and fashionable
                                            look.
                                        </div>
                                    </div>
                                </div>

                                <div class="select-choice" data-tab-id="32" data-option-id="1703"  data-parameter-id="display-option-523">
                                    <div class="option-image">
                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/buttoning-single-three.png.big_3d.png">
                                        <div class="option-radio-button">
                                        <span class="fa-stack pull-right">
                                            <input type="radio" id="" name="button_type" value="single_three" onclick="change_coat(this)">
                                        </span>
                                        </div>
                                    </div>
                                    <div class="option-information">
                                        <div class="option-name">Single three buttons</div>
                                        <div class="option-description">The singel breasted jacket is a popular choice,
                                            particularily in recent years. A jacket with three buttons signals a more
                                            formal style and always feels correct in more traditional settings.
                                        </div>
                                    </div>
                                </div>

                                <div class="select-choice" data-tab-id="32" data-option-id="1730"
                                     data-parameter-id="display-option-523">
                                    <div class="option-image">
                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/buttoning-double-four.png.big_3d.png">
                                        <div class="option-radio-button">
                                        <span class="fa-stack pull-right">
                                            <input type="radio" id="" name="button_type" value="double_four" onclick="change_coat(this)">
                                        </span>
                                        </div>
                                    </div>
                                    <div class="option-information">
                                        <div class="option-name">Double four buttons</div>
                                        <div class="option-description">The double breasted jacket is a classic and
                                            elegant choice. A jacket with Four buttons has a more relaxed look than Six
                                            buttons.
                                        </div>
                                    </div>
                                </div>

                                <div class="select-choice" data-tab-id="32" data-option-id="1731"
                                     data-parameter-id="display-option-523">
                                    <div class="option-image">
                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/buttoning-double-six.png.big_3d.png">
                                        <div class="option-radio-button">
                                        <span class="fa-stack pull-right">
                                            <input type="radio" id="" name="button_type" value="double_six" onclick="change_coat(this)">
                                        </span>
                                        </div>
                                    </div>
                                    <div class="option-information">
                                        <div class="option-name">Double six buttons</div>
                                        <div class="option-description">The double breasted jacket is a classic and
                                            elegant choice. A jacket with Six buttons signal a more formal style and
                                            always feels correct in more traditional settings.
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="lapels_collection" class="col-md-3 second_menu" style="display: none;">

                               <div id="lapels_container" class="row">
                                    <div class="col-md-12" style="padding: 0px;">

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="lapel_submenu('lapel_type', this)" >
                                                <p class="font-sm">Type</p>
                                            </a>
                                        </div>

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="lapel_submenu('lapel_width',this)" >
                                                <p class="font-sm">Width</p>
                                            </a>
                                        </div>

                                        <div id="buttonhole_option" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="lapel_submenu('lapel_buttonhole', this)" >
                                                <p class="font-sm">Buttonholes</p>
                                            </a>
                                        </div>

                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="lapel_submenu('lapel_stitches', this)" >
                                                <p class="font-sm">Distinct Stitch</p>
                                            </a>
                                        </div>

                                       <!---<div class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="lapel_submenu('lapel_satin', this)" >
                                                <p class="font-sm">Satin Lapels</p>
                                            </a>
                                        </div>--->

                                    </div>
                                </div>
                            </div>

                            <div id="trousers_menu" class="col-md-3 second_menu" style="display: none;">

                               <div id="trousers_menu_container" class="row">
                                    <div class="col-md-12" style="padding: 0px;">

                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="trouser_fabric_options()" >
                                                <p class="font-sm">Trouser fabric</p>
                                            </a>
                                        </div>


                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="trouser_pressed_unpressed_options()" >
                                                <p class="font-sm">Pressed trousers</p>
                                            </a>
                                        </div>


                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="trouser_plates_options()" >
                                                <p class="font-sm">Trouser pleats</p>
                                            </a>
                                        </div>


                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="belt_loop_options()" >
                                                <p class="font-sm">Belt loops</p>
                                            </a>
                                        </div>


                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="brace_button_options()" >
                                                <p class="font-sm">Brace buttons</p>
                                            </a>
                                        </div>


                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="trouser_cuff_options()" >
                                                <p class="font-sm">Trouser cuff</p>
                                            </a>
                                        </div>


                                        <div id="distinct_stitch_button" class="square-service-block">
                                            <a href="javascript:void(0)"  onclick="satin_braids_options()" >
                                                <p class="font-sm">Satin braids</p>
                                            </a>
                                        </div>


                                    </div>
                                </div>
                            </div>


                            <div id="lapels_inner_menu_type" class="col-md-6 third_menu" style="display: none;">

                               <div id="lapels_inner_menu_type_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">

                                        <div class="panel-body" style="max-height: 743px;">
                                            <h4>Type</h4>

                                            <div class="select-choice selected" data-tab-id="33" data-option-id="1705" data-parameter-id="display-option-527">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-notched.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Notched</div>
                                                    <div class="option-description">Notched lapels are the most common for single buttoned suits.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="lapel_type" onclick="change_lapel_type(this)" value="notched">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1704" data-parameter-id="display-option-527">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-peaked.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Peaked</div>
                                                    <div class="option-description">Peaked lapels are standard on double buttoned suits.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="lapel_type" onclick="change_lapel_type(this)" value="peaked">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1706" data-parameter-id="display-option-527">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-shawl.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Shawl</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="lapel_type" onclick="change_lapel_type(this)" value="shawl">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="lapels_inner_menu_type" class="col-md-6 third_menu" style="display: none;">

                               <div id="lapels_inner_menu_type_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" style="max-height: 743px;">

                                            <h4>Type</h4>

                                            <div class="select-choice selected" data-tab-id="33" data-option-id="1698" data-parameter-id="display-option-525">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-narrow.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Narrow</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1699" data-parameter-id="display-option-525">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-notched.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Normal</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1700" data-parameter-id="display-option-525">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-wide.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Wide</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio">
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>



                            <div id="lapels_inner_menu_width" class="col-md-6 third_menu" style="display: none;">

                               <div id="lapels_inner_menu_width_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" style="max-height: 743px;">
                                            <h4>Width</h4>
                                            <div class="select-choice selected" data-tab-id="33" data-option-id="1698" data-parameter-id="display-option-525">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-narrow.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Narrow</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" onclick="change_lapel_width(this)" name="lapel_width" value="narrow">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1699" data-parameter-id="display-option-525">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-notched.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Normal</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" onclick="change_lapel_width(this)" name="lapel_width" value="normal">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1700" data-parameter-id="display-option-525">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapel-wide.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Wide</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" onclick="change_lapel_width(this)" name="lapel_width" value="wide">
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="lapels_inner_menu_buttonholes" class="col-md-6 third_menu" style="display: none;">

                               <div id="lapels_inner_menu_buttonholes_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">

                                        <div class="panel-body" style="max-height: 743px;">

                                            <h4>Buttonholes</h4>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1709" data-parameter-id="display-option-526">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapelhole-0.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No lapel buttonhole</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="buttonholes_type" onclick="lapel_buttonhole(this)" value="no">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="1710" data-parameter-id="display-option-526">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapelhole-1.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">One lapel buttonhole</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="buttonholes_type" onclick="lapel_buttonhole(this)" value="one">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="33" data-option-id="1711" data-parameter-id="display-option-526">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/lapelhole-2.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Two lapel buttonholes</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="buttonholes_type" onclick="lapel_buttonhole(this)" value="two">
                                                </div>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div id="lapels_inner_menu_lapel_stitches" class="col-md-6 third_menu" style="display: none;">

                               <div id="lapels_inner_menu_lapel_stitches_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">

                                        <div class="panel-body" style="max-height: 743px;">

                                            <h4>Distinct Stitch</h4>

                                            <div class="select-choice selected" data-tab-id="33" data-option-id="870" data-parameter-id="display-option-383">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pick-stitching-yes.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes, I want distinct stitching on the lapels.<br><strong>+$15</strong></div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="distinct_stitch">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="33" data-option-id="871" data-parameter-id="display-option-383">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pick-stitching-no.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="distinct_stitch">
                                                </div>
                                            </div>


                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div id="pocket_collection" class="col-md-3 second_menu" style="display: none;">

                               <div id="pocket_container" class="row">
                                    <div class="col-md-12" style="padding: 0px;">

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="pocket_style_menu(this)" >
                                                <p class="font-sm">Style</p>
                                            </a>
                                        </div>

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="number_of_pockets_menu(this)" >
                                                <p class="font-sm">Number</p>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>

                            <div id="pocket_style_menu" class="col-md-6 third_menu" style="display: none;">

                                <div id="pocket_style_menu_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">

                                        <div class="panel-body">
                                            <h4>Pocket Style</h4>
                                                <div class="select-choice selected" data-tab-id="34" data-option-id="1867" data-parameter-id="display-option-601">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pockets-side.png.big_3d.png">
                                                    </div>
                                                    <div class="option-information">
                                                        <div class="option-name">Flap pockets</div>
                                                        <div class="option-description">Straight pockets with flap</div>
                                                    </div>
                                                    <div class="option-radio-button">
                                                        <input type="radio" name="pocket_style" value="flaped" onclick="pocket_style(this)">
                                                    </div>
                                                </div>

                                                <div class="select-choice" data-tab-id="34" data-option-id="1868" data-parameter-id="display-option-601">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pockets-slanted.png.big_3d.png">
                                                    </div>
                                                    <div class="option-information">
                                                        <div class="option-name">Slanted</div>
                                                        <div class="option-description">Fashionable look to give the jacket that extra stylish edge.</div>
                                                    </div>
                                                    <div class="option-radio-button">
                                                        <input type="radio" name="pocket_style" value="slanted" onclick="pocket_style(this)">
                                                    </div>
                                                </div>

                                                <div class="select-choice" data-tab-id="34" data-option-id="1869" data-parameter-id="display-option-601">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pockets-piped.png.big_3d.png">
                                                    </div>
                                                    <div class="option-information">
                                                        <div class="option-name">Piped</div>
                                                        <div class="option-description">Perfect for the formal look. Standard on smoking jacket.</div>
                                                    </div>
                                                    <div class="option-radio-button">
                                                        <input type="radio" name="pocket_style" value="piped" onclick="pocket_style(this)">
                                                    </div>
                                                </div>

                                                <div class="select-choice" data-tab-id="34" data-option-id="1870" data-parameter-id="display-option-601">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pockets-patch.png.big_3d.png">
                                                    </div>
                                                    <div class="option-information">
                                                        <div class="option-name">Patch</div>
                                                        <div class="option-description">Great way to get a more casual look. Great to match with chinos or jeans.</div>
                                                    </div>
                                                    <div class="option-radio-button">
                                                        <input type="radio" name="pocket_style" value="patched" onclick="pocket_style(this)">
                                                    </div>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="number_of_pockets" class="col-md-6 third_menu" style="display: none;">

                                <div id="number_of_pockets_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">

                                        <div class="panel-body">
                                            <h4>Number Of Pockets</h4>

                                                <div class="select-choice selected" data-tab-id="34" data-option-id="1728" data-parameter-id="display-option-535">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/side-pockets-2.png.big_3d.png">
                                                    </div>
                                                    <div class="option-information">
                                                        <div class="option-name">Two pockets</div>
                                                        <div class="option-description">With two pockets (plus the breast pocket), you have made a classic choice.</div>
                                                    </div>
                                                    <div class="option-radio-button">
                                                        <input type="radio" name="pocket_numbers" onclick="number_of_pockets(this)">
                                                    </div>
                                                </div>

                                                <div class="select-choice" data-tab-id="34" data-option-id="1729" data-parameter-id="display-option-535">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/side-pockets-3.png.big_3d.png">
                                                    </div>
                                                    <div class="option-information">
                                                        <div class="option-name">Three pockets</div>
                                                        <div class="option-description">The 'top pocket', above the right pocket, is smaller than the two other pockets. Usual on suits of British design.</div>
                                                    </div>
                                                    <div class="option-radio-button">
                                                        <input type="radio" name="pocket_numbers" onclick="number_of_pockets(this)">
                                                    </div>
                                                </div>

                                                <div class="select-choice" data-tab-id="34" data-option-id="1727" data-parameter-id="display-option-535">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/productdesigner/options/side-pockets-0.png.big_3d.png">
                                                    </div>
                                                    <div class="option-information">
                                                        <div class="option-name">No pockets</div>
                                                        <div class="option-description"></div>
                                                    </div>
                                                    <div class="option-radio-button">
                                                        <input type="radio" name="pocket_numbers" onclick="number_of_pockets(this)">
                                                    </div>
                                                </div>
                                            </div>
                                    </div>
                                </div>
                            </div>



                            <div id="vent_collection" class="col-md-3 second_menu" style="display: none;">

                               <div id="vent_container" class="row">

                                    <div class="col-md-12" style="padding: 0px;">

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="vents_styles('no')" >
                                                <p class="font-sm">No Vents</p>
                                            </a>
                                        </div>

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="vents_styles('one')" >
                                                <p class="font-sm">One Vent</p>
                                            </a>
                                        </div>

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="vents_styles('two')" >
                                                <p class="font-sm">Two Vents</p>
                                            </a>
                                        </div>

                                    </div>

                                </div>
                            </div>


                            <div id="jacket_detail" class="col-md-3 second_menu" style="display: none;">

                               <div id="jacket_container" class="row">
                                    <div class="col-md-12" style="padding: 0px;">

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="monogram_menu(this)" >
                                                <p class="font-sm">Monogram</p>
                                            </a>
                                        </div>



                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="working_cuff(this)" >
                                                <p class="font-sm">Working Cuff</p>
                                            </a>
                                        </div>



                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="elbow_patch(this)" >
                                                <p class="font-sm">Elbow Patches</p>
                                            </a>
                                        </div>


                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="shiny_buttons(this)" >
                                                <p class="font-sm">Shiny Buttons</p>
                                            </a>
                                        </div>


                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="floating_canvas(this)" >
                                                <p class="font-sm">Floating Canvas</p>
                                            </a>
                                        </div>


                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="lining_type(this)" >
                                                <p class="font-sm">Lining Type</p>
                                            </a>
                                        </div>


                                    </div>
                                </div>
                            </div>


                            <div id="monogram_menu" class="col-md-6 third_menu" style="display: none;">
                                <div id="monogram_content_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" >

                                            <h4>Monogram</h4>

                                            <span class="hidden" id="user_name">08/28/2018</span>

                                            <div class="monogram-enable" data-tab-id="36" data-option-id="1722" data-parameter-id="533" data-form-value="yes">
                                                <div class="option-image"><img src="https://canvas-media.suitopia.com/var/productdesigner/options/monogram.jpg.big_3d.png"></div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes<br><strong>+$20</strong></div>
                                                    <div class="option-description">Personalise your suit by having a text embroidered on the inner pocket.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                <input type="radio" name="monogram_text" value="yes" onclick="set_monogram(this)" />
                                                </div>
                                            </div>

                                            <div class="monogram-enable selected no-border" data-tab-id="36" data-option-id="1721" data-parameter-id="533" data-form-value="no">
                                                <div class="option-image"><img src="https://canvas-media.suitopia.com/var/productdesigner/options/no.jpg.big_3d.png"></div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="monogram_text" value="no"  onclick="set_monogram(this)"/>
                                                </div>
                                            </div>


                                            <div class="monogram-values hidden">
                                                <div class="monogram-text">
                                                    <label for="monogram-text">Text:</label>
                                                    <input id="monogram-text" type="text" value="07/31/2018" style="background-color: rgb(255, 255, 255); color: rgb(0, 0, 0); font-family: Garamond;">
                                                </div>
                                                <div class="monogram-font">
                                                    <label for="monogram-font">Font:</label>
                                                    <select id="monogram-font">

                                                        <option value="885" selected="">Garamond</option>

                                                        <option value="886">Lucida Calligraphy</option>

                                                        <option value="887">Verdana</option>

                                                        <option value="888">Script MT Bold</option>

                                                        <option value="889">Monotype Corsiva</option>

                                                    </select>
                                                </div>
                                                <div class="monogram-color">
                                                    <label for="monogram-color">Colour:</label>
                                                    <select id="monogram-color" name="monogram-color">

                                                        <option data-fg="#000000" data-bg="#ffffff" data-image="/media/productdesigner/img/default_display_image.png" value="874" style="color:#000000;background-color:#ffffff;" selected="">Black</option>

                                                        <option data-fg="#808080" data-bg="#ffffff" data-image="/media/productdesigner/img/default_display_image.png" value="875" style="color:#808080;background-color:#ffffff;">Grey</option>

                                                        <option data-fg="#00008B" data-bg="#ffffff" data-image="/media/productdesigner/img/default_display_image.png" value="876" style="color:#00008B;background-color:#ffffff;">Dark blue</option>

                                                        <option data-fg="#009900" data-bg="#ffffff" data-image="/media/productdesigner/img/default_display_image.png" value="878" style="color:#009900;background-color:#ffffff;">Green</option>

                                                        <option data-fg="#800080" data-bg="#ffffff" data-image="/media/productdesigner/img/default_display_image.png" value="882" style="color:#800080;background-color:#ffffff;">Purple</option>

                                                        <option data-fg="#FF0000" data-bg="#ffffff" data-image="/media/productdesigner/img/default_display_image.png" value="883" style="color:#FF0000;background-color:#ffffff;">Red</option>

                                                        <option data-fg="#87CEFA" data-bg="#111111" data-image="/media/productdesigner/img/default_display_image.png" value="877" style="color:#87CEFA;background-color:#111111;">Light blue</option>

                                                        <option data-fg="#FFFF00" data-bg="#111111" data-image="/media/productdesigner/img/default_display_image.png" value="879" style="color:#FFFF00;background-color:#111111;">Yellow</option>

                                                        <option data-fg="#FFA500" data-bg="#111111" data-image="/media/productdesigner/img/default_display_image.png" value="880" style="color:#FFA500;background-color:#111111;">Orange</option>

                                                        <option data-fg="#FFC0CB" data-bg="#111111" data-image="/media/productdesigner/img/default_display_image.png" value="881" style="color:#FFC0CB;background-color:#111111;">Pink</option>

                                                        <option data-fg="#FFFFFF" data-bg="#111111" data-image="/media/productdesigner/img/default_display_image.png" value="884" style="color:#FFFFFF;background-color:#111111;">White</option>

                                                    </select>
                                                </div>
                                                <div class="monogram-button">
                                                    <button class="btn btn-primary">Ok</button>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="trouser_fabric_panel" class="col-md-6 third_menu" style="display: none;">
                                <div id="trouser_fabric_panel_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" >
                                            <h4>Fabric</h4>
                                            <label><input type="radio" name="trouser_fabric_option" onclick="change_trouser_fabric(this)" data-fabric_id="matching"> <strong>Matching</strong></label>
                                            <hr>
                                            <label><input type="radio" name="trouser_fabric_option" onclick="change_trouser_fabric(this)" data-fabric_id="2"> <strong>Choose</strong></label>
                                            <hr>
                                            {{trouser_fabrics_html}}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="trouser_pressed_unpressed_panel" class="col-md-6 third_menu" style="display: none;">
                                <div id="trouser_pressed_unpressed_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" style="max-height: 651px;">




                                            <div class="select-choice" data-tab-id="55" data-option-id="786" data-parameter-id="display-option-346">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/trousers-pressed-yes.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes</div>
                                                    <div class="option-description">The trousers have a crease along the leg.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="is_pressed" value="pressed" onclick="pressed_unpressed(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="55" data-option-id="787" data-parameter-id="display-option-346">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/trousers-pressed-no.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description">The trousers are not creased along the leg.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="is_pressed" value="unpressed" onclick="pressed_unpressed(this)">
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="trouser_plates_panel" class="col-md-6 third_menu" style="display: none;">
                                <div id="trouser_plates_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body">

                                            <div class="select-choice" data-tab-id="55" data-option-id="788" data-parameter-id="display-option-347">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pleats-0.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No pleats</div>
                                                    <div class="option-description">The trousers have no pleats.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="trouser_plates" value="no_pleats" onclick="trouser_plates(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="55" data-option-id="789" data-parameter-id="display-option-347">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pleats-1.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Single pleats</div>
                                                    <div class="option-description">The trousers have one pleat on both sides of the front.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="trouser_plates" value="single_pleats" onclick="trouser_plates(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="55" data-option-id="790" data-parameter-id="display-option-347">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/pleats-2.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Double pleats</div>
                                                    <div class="option-description">The trousers have two pleats on both sides of the front.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="trouser_plates" value="double_pleats" onclick="trouser_plates(this)">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="belt_loop_panel" class="col-md-6 third_menu" style="display: none;">
                                <div id="belt_loop_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" style="max-height: 689px;">

                                            <div class="select-choice" data-tab-id="55" data-option-id="781" data-parameter-id="display-option-344">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/belt-loops-yes.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes</div>
                                                    <div class="option-description">The trousers have belt loops.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="belt_loop" value="yes" onclick="set_belt_loops(this)" />
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="55" data-option-id="782" data-parameter-id="display-option-344">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/belt-loops-no.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description">The trousers does not have belt loops. If you choose this option you might also want to choose buttons for braces on the add-on page.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="belt_loop" value="no" onclick="set_belt_loops(this)" />
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="brace_button_panel" class="col-md-6 third_menu" style="display: none;">
                                <div id="brace_button_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body">

                                            <div class="select-choice" data-tab-id="55" data-option-id="793" data-parameter-id="display-option-349">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/SuspenderButtons_Small_2_1.jpg.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes, I want buttons for braces in my trousers.<br><strong>+$10</strong></div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="brace_button_type" value="yes" onclick="set_brace_buttons(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="55" data-option-id="794" data-parameter-id="display-option-349">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/none_7_4.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="brace_button_type" value="no" onclick="set_brace_buttons(this)">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="trouser_cuff_panel" class="col-md-6 third_menu" style="display: none;">
                                <div id="trouser_cuff_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body">


                                            <div class="select-choice" data-tab-id="55" data-option-id="791" data-parameter-id="display-option-348">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/cuffs-yes.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes</div>
                                                    <div class="option-description">The trousers have cuffs.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="trouser_cuff" value="yes" onclick="set_trouser_cuff(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="55" data-option-id="792" data-parameter-id="display-option-348">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/cuffs-no.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description">The trousers have no cuffs.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="trouser_cuff" value="no" onclick="set_trouser_cuff(this)">
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="satin_braids_panel" class="col-md-6 third_menu" style="display: none;">
                                <div id="satin_braids_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body">




                                            <div class="select-choice" data-tab-id="55" data-option-id="784" data-parameter-id="display-option-345">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/satin_braids_1.jpg.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Single</div>
                                                    <div class="option-description">The trousers have a single satin braid down the outside of each leg.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="satin_braids" value="single" onclick="set_satin_braids(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="55" data-option-id="783" data-parameter-id="display-option-345">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/satin_braids_no.jpg.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description">The trousers do not have satin braids down the side of the leg.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="satin_braids" value="no" onclick="set_satin_braids(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="55" data-option-id="785" data-parameter-id="display-option-345">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/satin_braids_2.jpg.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Double</div>
                                                    <div class="option-description">The trousers have double satin braids down the outside of each leg.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="satin_braids" value="double" onclick="set_satin_braids(this)">
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="working_cuff_menu" class="col-md-6 third_menu" style="display: none;">
                                <div id="working_cuff_content_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" >
                                            <h4>Working Cuff</h4>

                                            <div class="select-choice selected" data-tab-id="36" data-option-id="897" data-parameter-id="display-option-392">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/RealButtons_Small.jpg.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes, I want working cuffs.<br><strong>+$15</strong></div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="cuff_type" value="yes" onclick="set_working_cuff(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="36" data-option-id="898" data-parameter-id="display-option-392">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/none_7_6.png.small_3d_copy.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                   <input type="radio" name="cuff_type" value="no" onclick="set_working_cuff(this)">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="elbow_patch_menu" class="col-md-6 third_menu" style="display: none;">
                                <div id="elbow_patch_menu_content_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" style="max-height: 743px;">
                                            <h4>Elbow Patches</h4>

                                            <div class="elbowpatch select-choice  col-xs-4" data-type="elbowpatch" data-option-id="16" data-tab-id="36">
                                                <div class="elbowpatch-item">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/elbowpatches/none_1.png.thumb.png" class="img-responsive" style="height: 110px;">
                                                    </div>
                                                    <div class="option-information text-center" style="height: 35px;">
                                                        <div class="option-name">None<br><strong>+$0</strong></div>
                                                    </div>
                                                    <div class="option-radio-button text-center">
                                                        <input type="radio" name="elbow_patch" value="none" onclick="set_elbow_patch(this)">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="elbowpatch select-choice selected col-xs-4" data-type="elbowpatch" data-option-id="11" data-tab-id="36">
                                                <div class="elbowpatch-item">
                                                    <div class="option-image">
                                                        <img src="https://canvas-media.suitopia.com/var/elbowpatches/LE-022_white.jpg.thumb.png" class="img-responsive" style="height: 110px;">
                                                    </div>
                                                    <div class="option-information text-center" style="height: 35px;">
                                                        <div class="option-name">White<br><strong>+$15</strong></div>
                                                    </div>
                                                    <div class="option-radio-button text-center">
                                                        <input type="radio" name="elbow_patch" value="3" onclick="set_elbow_patch(this)">
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="shiny_buttons_menu" class="col-md-6 third_menu" style="display: none;">
                                <div id="shiny_buttons_menu_content_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" style="max-height: 743px;">
                                            <h4>Shiny Buttons</h4>

                                            <div class="select-choice selected" data-tab-id="36" data-option-id="899" data-parameter-id="display-option-393">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/golden_button.jpg.big_3d.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes, I want brass buttons on my jacket.<br><strong>+$20</strong></div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="shiny_buttons" value="yes" onclick="set_shiny_buttons(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="36" data-option-id="900" data-parameter-id="display-option-393">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/none_8.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description"></div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="shiny_buttons" value="no" onclick="set_shiny_buttons(this)">
                                                </div>
                                            </div>


                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="floating_canvas_menu" class="col-md-6 third_menu" style="display: none;">
                                <div id="floating_canvas_content_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body">
                                            <h4>Floating Canvas</h4>

                                            <div class="select-choice" data-tab-id="36" data-option-id="1848" data-parameter-id="display-option-594">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/Handstitched_floating_half_canvas1.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Yes<br><strong>+$140</strong></div>
                                                    <div class="option-description">Premium hand stitched half floating canvas</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="floating_canvas" value="yes" onclick="set_floating_canvas(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="36" data-option-id="1847" data-parameter-id="display-option-594">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/Regular_half_canvas1.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">No</div>
                                                    <div class="option-description">Regular half canvas</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="floating_canvas" value="no" onclick="set_floating_canvas(this)">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="lining_type_menu" class="col-md-6 third_menu" style="display: none;">
                                <div id="lining_type_content_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body">
                                            <h4>Lining Type</h4>

                                            <div class="select-choice" data-tab-id="36" data-option-id="1852" data-parameter-id="display-option-596">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/full_lining.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Full lining</div>
                                                    <div class="option-description">Standard full lining</div>
                                                </div>
                                                <div class="option-radio-button">
                                               <input type="radio" name="lining_type" value="full_lining" onclick="set_lining_type(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice" data-tab-id="36" data-option-id="1853" data-parameter-id="display-option-596">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/half_lining.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">Half lining<br><strong>+$60</strong></div>
                                                    <div class="option-description">Half lining for a lighter feeling.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="lining_type" value="half_lining" onclick="set_lining_type(this)">
                                                </div>
                                            </div>

                                            <div class="select-choice selected" data-tab-id="36" data-option-id="1854" data-parameter-id="display-option-596">
                                                <div class="option-image">
                                                    <img src="https://canvas-media.suitopia.com/var/productdesigner/options/quart_lining.png.big_3d.png">
                                                </div>
                                                <div class="option-information">
                                                    <div class="option-name">1/4 lining<br><strong>+$70</strong></div>
                                                    <div class="option-description">For an extra light and cool feeling.</div>
                                                </div>
                                                <div class="option-radio-button">
                                                    <input type="radio" name="lining_type" value="one_forth" onclick="set_lining_type(this)">
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="waistcoat_menu" class="col-md-3 second_menu" style="display: none;">
                               <div id="waistcoat_menu_container" class="row">
                                    <div class="col-md-12" style="padding: 0px;">

                                        <div class="square-service-block">
                                            <a href="javascript:void(0)" onclick="waistcoat(this)" >
                                                <p class="font-sm">Waistcoat</p>
                                            </a>
                                        </div>

                                        <div class="square-service-block" id="waistcoat_fabric_menu_link">
                                            <a href="javascript:void(0)" onclick="waistcoat_fabric(this)" >
                                                <p class="font-sm">Fabric</p>
                                            </a>
                                        </div>

                                    </div>
                                </div>
                            </div>


                            <div id="waistcoat_fabric_menu" class="col-md-6 third_menu" style="display: none;">
                                <div id="waistcoat_fabric_content_container" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" >
                                            <h4>Waistcoat</h4>
                                            <label><input type="radio" name="waistcoat_option" value="yes" onclick="waistcoat_option(this)">Yes</label>
                                            <br/>
                                            <label><input type="radio" name="waistcoat_option" value="no" onclick="waistcoat_option(this)">No</label>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div id="waistcoat_fabric_menu2" class="col-md-6 third_menu" style="display: none;">
                                <div id="waistcoat_fabric_content_container2" class="row">
                                    <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                        <div class="panel-body" >
                                            <h4>Fabric</h4>
                                                <label><input type="radio" name="waistcoat_fabric_option" onclick="change_waistcoat_fabric(this)" data-fabric_id="matching"> <strong>Matching</strong></label>
                                            <hr>
                                                <label><input type="radio" name="waistcoat_fabric_option" onclick="change_waistcoat_fabric(this)" data-fabric_id="2"> <strong>Choose</strong></label>
                                            <hr>
                                            {{waistcoat_fabrics_html}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div id="waistcoat_detail" class="col-md-6 third_menu" style="display: none;">
                        <div id="waistcoat_detail_content_container" class="row">
                            <div class="col-md-12" style="padding: 5px; border: 2px solid grey">
                                <div class="panel-body">
                                    <h4>Waistcoat</h4>

                                    <div class="select-choice selected" data-tab-id="38" data-option-id="1799" data-parameter-id="display-option-568">
                                        <div class="option-image">
                                            <img src="https://canvas-media.suitopia.com/var/productdesigner/options/waistcoat-yes.png.big_3d.png">
                                        </div>
                                        <div class="option-information">
                                            <div class="option-name">Yes<br><strong>+$121</strong></div>
                                            <div class="option-description">Waistcoat in the same fabric as your suit or jacket. The waistcoat is of classic design, with five buttons and the shiny lining at the back.</div>
                                        </div>
                                        <div class="option-radio-button">
                                            <input type="text" name="waistcoat_option">
                                        </div>
                                    </div>

                                    <div class="select-choice" data-tab-id="38" data-option-id="1798" data-parameter-id="display-option-568">
                                        <div class="option-image">
                                            <img src="https://canvas-media.suitopia.com/var/productdesigner/options/waistcoat-no.png.big_3d.png">
                                        </div>
                                        <div class="option-information">
                                            <div class="option-name">No</div>
                                            <div class="option-description"></div>
                                        </div>
                                        <div class="option-radio-button">
                                            <input type="text" name="waistcoat_option">
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>



                    <div class="col-md-6" id="suit_canvas" style="display: none">
                        <div style="height: 1000px;">
                            <div id="trouser_alert" class="alert alert-info" style="position: absolute; bottom:50%; left 100px; z-index: 99; display: none;">
                                <strong>Trousers</strong> are not selected
                            </div>
                            <div id="suit">
                               {{suit}}
                            </div>
                        </div>

                        <div style="z-index:100; position: absolute; top: 0px; right: 0px; background: #efe3e3; width: 100px; height: 550px;">
                            <div class="container-fluid">
                                <div class="row-fluid">
                                    <br>
                                    <div onclick="front_coat()" class="col-md-12  btn-block btn-primary" style="margin-left: 3px; margin-right:3px; margin-top: 3px;">
                                        <strong>Front Coat</strong>
                                    </div>

                                    <div onclick="front_suit()" class="col-md-12  btn-block btn-primary" style="margin-left: 3px; margin-right:3px; margin-top: 3px;">
                                        <strong>Front Suit</strong>
                                    </div>

                                    <div onclick="back_coat()" class="col-md-12 btn-block btn-primary" style="margin-left: 3px; margin-right:3px; margin-top: 3px;">
                                        <strong>Back Coat</strong>
                                    </div>

                                    <div onclick="back_suit()" class="col-md-12 btn-block btn-primary" style="margin-left: 3px; margin-right:3px; margin-top: 3px;">
                                        <strong>Back Suit</strong>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- blog-area end -->
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

<!-- rs-plugin js -->
<script type="text/javascript" src="{{assets_url}}js/jquery.themepunch.tools.min.js"></script>
<script type="text/javascript" src="{{assets_url}}js/jquery.themepunch.revolution.min.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
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


    let acookie = getCookie("myCoat");

    let myCoat;
    if (!acookie){ /// create cookie if not exist
        alert('create new cookie');
        myCoat = { }; /// namespace
        myCoat.product = 'three_piece'; /// three_piece, suit, jacket, trousers
        myCoat.fit = '2'; /// slim =1, classic=2
        myCoat.fabric = '2'; /// fabric id
        myCoat.lining = '2'; /// lining id
        myCoat.button_type = 'single_one'; /// single_one, single_two, single_three, double_four, double_six
        myCoat.lapel_type = 'notched';  /// notched, peaked, shawl
        myCoat.lapel_width = 'narrow'; /// narrow, normal, wide
        myCoat.distinctStitch = 'no'; /// yes, no
        myCoat.lapelFabric = '2'; /// lapel color id
        myCoat.pocketStyle = 'flaped'; /// flap, slanted, piped, patch
        myCoat.pockets = 'two'; /// no , two, three
        myCoat.vent = 'two'; /// no, one, two
        myCoat.jacketMonogram = 'no'; /// yes, no
        myCoat.jacketMonogramText = ''; /// text
        myCoat.jacketMonogramFont = ''; /// text
        myCoat.jacketMonogramColor = ''; /// text
        myCoat.workingCuff = 'no'; /// yes, no
        myCoat.elbowPatch = 'no'; /// patch id
        myCoat.jacketShinyButtons = 'no'; /// yes, no
        myCoat.jacketfloatingCanvas = 'no'; /// yes, no
        myCoat.jacketLiningType = 'full_lining'; /// full_lining, half_lining, one_forth
        myCoat.waistcoat = 'yes'; /// yes, no
        myCoat.waistcoatFabric = '2'; /// waistcoat fabric id
        myCoat.trousersFabric = '2'; /// waistcoat fabric id
        myCoat.trousersPleats = 'no_pleats'; /// no_pleats single_pleats double_pleats
        myCoat.trousersBeltLoops = 'no'; /// no yes
        myCoat.lapelButtonholes = 'no'; /// no one two
        myCoat.trousersPressed = 'unpressed'; /// pressed unpressed
        $.cookie('myCoat', JSON.stringify(myCoat));
    }else{
        myCoat = JSON.parse($.cookie('myCoat'));
        console.log(myCoat);
    }


    function getCookie(c_name) {
        let c_value = document.cookie,
            c_start = c_value.indexOf(" " + c_name + "=");
        if (c_start == -1) c_start = c_value.indexOf(c_name + "=");
        if (c_start == -1) {
            c_value = null;
        } else {
            c_start = c_value.indexOf("=", c_start) + 1;
            var c_end = c_value.indexOf(";", c_start);
            if (c_end == -1) {
                c_end = c_value.length;
            }
            c_value = unescape(c_value.substring(c_start, c_end));
        }
        return c_value;
    }


    function update_params(parameter, p_value){
        myCoat = JSON.parse($.cookie('myCoat'));
        myCoat[parameter] = p_value;
        let coat_obj = JSON.stringify(myCoat);
        console.log(coat_obj);
        ///$.cookie('myCoat', coat_obj);
        ////document.cookie
        console.log($.cookie('myCoat'));
    }


    function get_parameter_value(parameter){
        myCoat = JSON.parse($.cookie('myCoat'));
        return myCoat[parameter];
    }

    let fabric_container = '';


    $(document).ready(function () {

        $(".square-service-block").on("click", function(e){
            $(".square-service-block").find('a').removeClass("active_menu");
            $(this).find('a').addClass("active_menu");
        })

        $(".fabric_filter").on('change', function () {
            let fabric_color = $("#fabric_color").val();
            let fabric_matterial = $("#fabric_material").val();
            let fabric_pattern = $("#fabric_pattern").val();
            let fabric_category = $("#fabric_category").val();
            fabric_container = $("#fabric_container").html();

            $.ajax({
                url: "",
                type: "post",
                data: {ajax:1, action:'get_fabric', color:fabric_color, material:fabric_matterial, pattern:fabric_pattern, category:fabric_category},
                success: function (response) {
                    $("#fabric_container").html(response);
                },
                error: function (response) {
                    alert(response);
                }
            });
        })
    })

    $(window).load(function(e){
        reload_page(get_parameter_value('product'));
        render_view();
        $("#suit_canvas").show();
    })


    function reload_page(target){
        coatString = JSON.stringify(myCoat);
        $.ajax({
            url:"",
            type:'post',
            data:{ajax:1, action:'update_suit', target:target, coatParams:coatString},
            success:function(response){
                $("#suit").empty();
                $("#suit").html(response);
                show_side();
                trouser_adjustment();
            },
            error:function(response){
                console.log('error');
                console.log(response);
            }
        })
    }


    function adjust_fitting(){
        if(get_parameter_value('fit')== 'slim'){
            $(".classic").hide();
            $(".slim").show();
        }else{
            $(".slim").hide();
            $(".classic").show();
        }
    }


    function change_fabric(e){
        myCoat.fabric = $(e).data('fabric_id');
    }

    function show_side(){
        if($.cookie('view_side') == 'front_coat' || $.cookie('view_side') == 'front_suit' ){
            $(".back").hide();
        }else{
            $(".front").hide();
        }

        //// check if waistcoat included
        if(get_parameter_value('waistcoat') == 'no'){
            $(".waist_coat").hide();
            $(".lining_hide").hide();
        }

        //// check if product is jacket
        if(get_parameter_value('product') == 'jacket'){
            $("#trouser_alert").show();
        }else{
            $("#trouser_alert").hide();
        }

        //// check if product is trousers
        if(get_parameter_value('product') == 'trousers'){
               $(".waistcoat").hide();
               $(".lining").hide();
        }

        vents_styles(get_parameter_value('vent'));
    }

    function active_side(){
        return $.cookie('view_side');
    }


    function pocket_adjustment(){
        $(".pocket").hide();
        switch($.cookie('pocket_type')){
            case 'flaped':
                $.cookie('pocket_type','flaped');
                $(".pocket.pocket_flap").show();
                break;
            case 'slanted':
                $.cookie('pocket_type','slanted');
                $(".pocket.pocket_slanted").show();
                break;
            case 'piped':
                $.cookie('pocket_type','piped');
                $(".pocket.pocket_piped").show();
                break;
            case 'patched':
                $.cookie('pocket_type','patched');
                $(".pocket.pocket_patch").show();
                break;
            default:
                $.cookie('pocket_type','flaped');
                $(".pocket.pocket_flap").show();
        }
    }

    function three_piece_suit(e) {
        update_params('product','three_pieces');
        update_params('waistcoat','yes');
        reload_page('product');
    }

    function suit(e) {
        update_params('product','suit');
        update_params('waistcoat','no');
        reload_page('product');
    }

    function jacket(e) {
        update_params('product','jacket');
        update_params('waistcoat','no');
        reload_page('product');
    }

    function trousers(e) {
        update_params('product','trousers');
        $(".base_front").hide();
        $(".base_back").hide();
        $(".coller_back").hide();
        $(".lapel").hide();
        $(".button").hide();
        $(".pocket").hide();
        $(".waist_coat").hide();
        $(".vent").hide();
        $("#trouser_alert").hide();
        ///show_side();
    }

    function fit_menu(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#menu2").show();
    }


    function select_product() {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#menu1").show();
    }

    function classic_size(e) {
        update_params('fit','classic');
        render_view();
        vents_styles(get_parameter_value('vent'));
    }

    function slim_size(e) {
        update_params('fit','slim');
        render_view();
        vents_styles(get_parameter_value('vent'));
    }

    function render_view(){
        switch(active_side()){
            case 'front_coat':
                if(get_parameter_value('fit')== 'slim'){
                    $(".front.slim").show();
                    $(".front.classic").hide();
                }else{
                    $(".front.classic").show();
                    $(".front.slim").hide();
                }
                $(".back").hide();
                break;
            case 'back_coat':
                if(get_parameter_value('fit')== 'slim'){
                    $(".back.slim").show();
                    $(".back.classic").hide();
                }else{
                    $(".back.classic").show();
                    $(".back.slim").show();
                }
                $(".front").hide();
                break;
            case 'front_suit':
                if(get_parameter_value('fit')== 'slim'){
                    $(".front.slim").show();
                    $(".front.classic").hide();
                }else{
                    $(".front.classic").show();
                    $(".front.slim").hide();
                }
                $(".lapel").hide();
                $(".button").hide();
                $(".pocket").hide();
                $(".base_front").hide();
                $(".base_back").hide();
                $(".base_back").hide();
                $(".pocket").hide();
                $(".back").hide();
                break;
            case 'back_suit':
                if(get_parameter_value('fit')== 'slim'){
                    $(".back.slim").show();
                    $(".back.classic").hide();
                }else{
                    $(".back.classic").show();
                    $(".back.slim").hide();
                }
                $(".lapel").hide();
                $(".button").hide();
                $(".pocket").hide();
                $(".front").hide();
                break;
            default:
                if(get_parameter_value('fit')== 'slim'){
                    $(".front.slim").show();
                    $(".front.classic").hide();
                }else{
                    $(".front.classic").show();
                    $(".front.slim").hide();
                }
                $(".back").hide();
        }
    }


    function fabric_collection(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#fabric_collection").show();
    }

    function lining_collection(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#lining_collection").show();
    }

    function front_coat(e) {
        $.cookie('view_side', 'front_coat');
        $('.back').hide();
        $('.front').show();
        if(get_parameter_value('waistcoat') == 'no'){
            $(".waist_coat").hide();
        }else {
            $(".waist_coat."+get_parameter_value('fit')).show();
        }
    }

    function back_coat() {
        $.cookie('view_side', 'back_coat');
        $('.front').hide();
        $('.back').show();
        /*$(".vent").hide();
        $(".one_vent").show();*/
        vents_styles(get_parameter_value('vent'));
    }

    function front_suit(e) {
        $.cookie('view_side', 'front_suit');
        $('.back').hide();
        $('.front').show();
        $('.base_front').hide();
        $('.lapel').hide();
        $('.button').hide();
        $('.pocket').hide();
        if(get_parameter_value('waistcoat') == 'no'){
            $(".waist_coat").hide();
        }else {
            $(".waist_coat."+get_parameter_value('fit')).show();
        }
    }

    function back_suit(e) {
        $.cookie('view_side', 'back_suit');
        $('.front').hide();
        $('.back').show();
        $('.base_back').hide();
        $('.vent').hide();
        $('.coller_back').hide();
        if(get_parameter_value('waistcoat') == 'no'){
            $(".lining").hide();
        }else {
            $(".lining."+get_parameter_value('fit')).show();
        }
    }


    function changeLining(e) {
        update_params('lining', $(e).data('lining_id'));
        let lurl = $(e).data('lining_url');
        $(".lining").attr('src', lurl);
        ///back_suit(e);
        /*
        */
    }

    function buttonsCollection(e) {
        $(".second_menu").hide();
        $("#buttons_collection").show();
    }

    function change_coat(e){
        update_params('button_type',$(e).val())
        reload_page('button_type');
    }

    function coat_adjustment(){
        let type = '';
        if($.cookie('coat_style')){
            type = $.cookie('coat_style');
        }else{
            type = 'single_one';
            $.cookie('coat_style', type)
        }

        $(".base_front").hide();
        $('.lapel').hide();
        $('.button').hide();
        $("."+type+".base_front").show();

        lapel_adjustment();

        $("."+type+".button").show();
    }

    function button_adjustment(type){
         $(".button").hide();
         let coat_style = $.cookie('coat_style');
         $("."+coat_style+".button").show();
    }

    function lapels_collection(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#lapels_collection").show();
    }

    function pocket_submenu(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#pocket_collection").show();
    }

    function vent_collection(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#vent_collection").show();
    }

    function jacket_detail(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#jacket_detail").show();
    }

    function waistcoat_collection(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#waistcoat_menu").show();
    }

    function lapel_submenu(fun, e){
        $(".third_menu").hide();

        switch(fun){
            case 'lapel_type':
                $("#lapels_inner_menu_type").show();
                break;
            case 'lapel_width':
                $("#lapels_inner_menu_width").show();
                break;
            case 'lapel_buttonhole':
                $("#lapels_inner_menu_buttonholes").show();
                break;
            case 'lapel_stitches':
                $("#lapels_inner_menu_lapel_stitches").show();
                break;
            case 'lapel_satin':
                ///
                break;
        }
    }

    function vents_styles(number_of_vents){

        $(".vent").hide();
        if(active_side() == 'back_coat'){
            switch (number_of_vents){
                case 'no':
                    update_params('vent', 'no');
                    break;
                case 'one':
                    $(".two_vents").hide();
                    $(".one_vent").show();
                    update_params('vent', 'one');
                    break;
                case 'two':
                    $(".one_vent").hide();
                    $(".two_vents").show();
                    update_params('vent', 'two');
                    break;
            }
        }
    }


    function lapel_adjustment(){
        $(".lapel").hide();

        let fitting = $.cookie('fitting');
        if(!fitting){
            $.cookie('fitting', 'classic');
            fitting = $.cookie('fitting');
        }

        let lapel_type = $.cookie('lapel_type');
        if(!lapel_type){
            lapel_type = 'notched';
        }

        let lapel_width = $.cookie('lapel_width');
        if(!lapel_width){
            lapel_width='narrow';
        }


        let coat_style = $.cookie('coat_style');
        if(!coat_style){
            coat_style='single_one';
        }

        let activate_lapel = ".lapel_"+lapel_type+".lapel_"+lapel_width+"."+fitting+"."+coat_style;
        $(activate_lapel).show();
    }


    function coat_lapel_adjustment(coat_style){

        let fitting = $.cookie('fitting');
        if(fitting){
            $.cookie('fitting', 'slim');
            fitting = $.cookie('fitting');
        }

        let lapel_type = $.cookie('lapel_type');
        if(lapel_type){
            lapel_type = 'notched';
        }

        let lapel_width = $.cookie('lapel_width');
        if(lapel_width){
            lapel_width='narrow';
        }

        $.cookie('coat_style', coat_style);
        if(coat_style){
            coat_style='single_one';
        }

        let activate_lapel = ".lapel_"+lapel_type+".lapel_"+lapel_width+"."+coat_style+"."+fitting;
        $(".lapel").hide();
        $(activate_lapel).show();
    }


    function change_lapel_type(e) {

        update_params('lapel_type', $(e).val());
        reload_page('lapel_type');
        if($(e).val() == 'shawl'){
            $("#buttonhole_option").hide();
            $("#distinct_stitch_button").hide();
        }else{
            $("#buttonhole_option").show();
            $("#distinct_stitch_button").show();
        }
    }

    function change_lapel_width(e) {
        update_params('lapel_width',$(e).val());
        reload_page('lapel_width');
    }

    function lapel_buttonhole(e) {
        let holes_count = $(e).val();
        if(holes_count == 'no'){
            return false;
        }

        $(".lapel").css("display", "none");
        switch(holes_count){
            case 'one':
                $(".lapel.single_one").css("display", "block");
                $.cookie('lapel_holes','one');
                break;
            case 'two':
                $(".lapel.single_two").css("display", "block");
                $.cookie('lapel_holes','two');
                break;
        }
    }


    function pocket_style_menu(e){
        $(".third_menu").hide();
        $("#pocket_style_menu").show();
    }

    function number_of_pockets_menu(e){
        $(".third_menu").hide();
        $("#number_of_pockets").show();
    }

    function pocket_style(e){
        update_params('pocketStyle', $(e).val());
        reload_page('product_style');
    }

    function monogram_menu(e) {
        $(".third_menu").hide();
        $("#monogram_menu").show();
    }


    function trousers_menu(e) {
        $(".second_menu").hide();
        $(".third_menu").hide();
        $("#trousers_menu").show();
    }


    function trouser_fabric_options(){
        $(".third_menu").hide();
        $("#trouser_fabric_panel").show();
    }

    function trouser_pressed_unpressed_options(){
        $(".third_menu").hide();
        $("#trouser_pressed_unpressed_panel").show();

    }

    function trouser_plates_options(){
        $(".third_menu").hide();
        $("#trouser_plates_panel").show();
    }

    function belt_loop_options(){
        $(".third_menu").hide();
        $("#belt_loop_panel").show();
    }

    function brace_button_options(){
        $(".third_menu").hide();
        $("#brace_button_panel").show();
    }

    function trouser_cuff_options(){
        $(".third_menu").hide();
        $("#trouser_cuff_panel").show();
    }

    function satin_braids_options(){
        $(".third_menu").hide();
        $("#satin_braids_panel").show();
    }


    function set_monogram(e){
        if($(e).val() == 'yes'){
            update_params('jacketMonogram','yes');
        }else{
            update_params('jacketMonogram','no');
        }
        reload_page('monogram');
    }


    function working_cuff(e) {
        $(".third_menu").hide();
        $("#working_cuff_menu").show();
    }

    function set_working_cuff(e){
        if($(e).val() == 'yes'){
            update_params('workingCuff','yes');
        }else{
            update_params('workingCuff','no');
        }
        reload_page('workingCuff');
    }

    function elbow_patch(e) {
        $(".third_menu").hide();
        $("#elbow_patch_menu").show();
    }

    function set_elbow_patch(e){
        if($(e).val() == 'none'){
            update_params('elbowPatch','no');
        }else{
            update_params('elbowPatch', $(e).val());
        }
        reload_page('elbowPatch');
    }

    function shiny_buttons(e) {
        $(".third_menu").hide();
        $("#shiny_buttons_menu").show();
    }

    function set_shiny_buttons(e){
        update_params('jacketShinyButtons', $(e).val());
        reload_page('jacketShinyButtons');
    }


    function floating_canvas(e) {
        $(".third_menu").hide();
        $("#floating_canvas_menu").show();
    }

    function set_floating_canvas(e){
        update_params('jacketfloatingCanvas', $(e).val());
        reload_page('jacketfloatingCanvas');
    }

    function lining_type(e) {
        $(".third_menu").hide();
        $("#lining_type_menu").show();
    }

    function set_lining_type(e){
        update_params('jacketLiningType', $(e).val());
        reload_page('jacketLiningType');
    }

    function waistcoat() {
        $(".third_menu").hide();
        $("#waistcoat_fabric_menu").show();
    }

    function waistcoat_option(e){
       update_params('waistcoat', $(e).val());
       if($(e).val() == 'no'){
           $("#waistcoat_fabric_menu_link").hide();
       }else{
           $("#waistcoat_fabric_menu_link").show();
       }
       reload_page('waistcoat')
    }

    function waistcoat_fabric() {
        $(".third_menu").hide();
        $("#waistcoat_fabric_menu2").show();
    }

    function change_fabric(e){
        update_params('fabric', $(e).data('fabric_id'));
        reload_page('fabric');
    }

    function change_waistcoat_fabric(e){
        if($(e).data('fabric_id') == 'matching'){
            update_params('waistcoatFabric', get_parameter_value('fabric'));
        }else{
            update_params('waistcoatFabric', $(e).data('fabric_id'));
        }
        reload_page('waistcoatFabric');
    }

    function change_trouser_fabric(e){
        if($(e).data('fabric_id') == 'matching'){
            update_params('trousersFabric', get_parameter_value('fabric'));
        }else{
            update_params('trousersFabric', $(e).data('fabric_id'));
        }
        reload_page('trousersFabric');
    }

    function pressed_unpressed(e) {
        alert("before "+$(e).val())
        if($(e).val() == 'pressed'){
            update_params('trousersPressed', 'pressed');
        }else{
            update_params('trousersPressed', 'unpressed');
        }

        alert(get_parameter_value('trousersPressed'));
        //trouser_adjustment();
    }

    function trouser_plates(e) {
        $(".trousers_pleats").hide();
        if($(e).val() == "single_pleats"){
            $(".trousers_pleats.single_pleats").show();
            update_params('trousersPleats', 'single_pleats');
        }else if($(e).val() == "double_pleats"){
            $(".trousers_pleats.double_pleats").show();
            update_params('trousersPleats', 'double_pleats');
        }else{
            $(".trousers_pleats").hide();
            update_params('trousersPleats', 'no_pleats');
        }
        reload_page('trousers_pleats');
    }

    function trouser_adjustment(){
        $(".trouser_front").hide();
        $(".trouser_front."+get_parameter_value('fit')+"."+get_parameter_value('trousersPressed')).show();
    }

    function set_belt_loops(e) {
        if($(e).val() == 'yes'){
            update_params('trousersBeltLoops','yes');
            if(get_parameter_value('view_side')=='front'){
                $(".front.belt_loops").show();
                $(".back.belt_loops").hide();
            }else{
                $(".front.belt_loops").hide();
                $(".back.belt_loops").show();
            }
        }else{
            update_params('trousersBeltLoops','no');
            $(".belt_loops").hide();
        }
    }

</script>

</body>
</html>
