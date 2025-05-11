<!DOCTYPE html>
<head>
    <meta charset="utf-8" />
    <title>Login</title>
    <meta name="keywords" content="HTML5 Template, CSS3, All Purpose Admin Template, Vendroid" />
    <meta name="description" content="Login Pages - Responsive Admin HTML Template">
    <meta name="author" content="Venmond">

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="{{assets_url}}img/ico/apple-touch-icon-144-precomposed.html">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="{{assets_url}}img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="{{assets_url}}img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="{{assets_url}}img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="{{assets_url}}img/favicon.png">


    <!-- CSS -->

    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="{{assets_url}}css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="{{assets_url}}css/font-awesome-ie7.min.css"><![endif]-->
    <link href="{{assets_url}}css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="{{assets_url}}css/fonts.css"  rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="{{assets_url}}plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">


    <link href="{{assets_url}}plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">

    <!-- Specific CSS -->


    <!-- Theme CSS -->
    <link href="{{assets_url}}css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="{{assets_url}}css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="{{assets_url}}css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->



    <!-- Responsive CSS -->
    <link href="{{assets_url}}css/theme-responsive.min.css" rel="stylesheet" type="text/css">




    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="{{assets_url}}custom/custom.css" rel="stylesheet" type="text/css">



    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="{{assets_url}}js/modernizr.js"></script>
    <script type="text/javascript" src="{{assets_url}}js/mobile-detect.min.js"></script>
    <script type="text/javascript" src="{{assets_url}}js/mobile-detect-modernizr.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="{{assets_url}}js/html5shiv.js"></script>
    <script type="text/javascript" src="{{assets_url}}js/respond.min.js"></script>
    <![endif]-->

</head>

<body id="pages" class="full-layout no-nav-left no-nav-right  nav-top-fixed background-login     responsive remove-navbar login-layout   clearfix" data-active="pages "  data-smooth-scrolling="1">
<div class="vd_body">
    <!-- Header Start -->

    <!-- Header Ends -->
    <div class="content">
        <div class="container">

            <!-- Middle Content Start -->

            <div class="vd_content-wrapper">
                <div class="vd_container">
                    <div class="vd_content clearfix">
                        <div class="vd_content-section clearfix">
                            <div class="vd_login-page">
                                <div class="heading clearfix">
                                    <div class="logo">
                                        <h2 class="mgbt-xs-5"><img src="{{assets_url}}img/logo.jpg" alt="logo"></h2>
                                    </div>
                                    <h4 class="text-center font-semibold vd_grey">LOGIN TO YOUR ACCOUNT</h4>
                                </div>
                                <div class="panel widget">
                                    <div class="panel-body">
                                        <div class="login-icon entypo-icon"> <i class="icon-key"></i> </div>
                                        <form class="form-horizontal" id="login-form" action="" method="post" role="form">
                                            {{info}}

                                            <div class="alert alert-success vd_hidden">
                                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                                                <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span><strong>Well done!</strong>. </div>
                                            <div class="form-group  mgbt-xs-20">
                                                <div class="col-md-12">
                                                    <div class="label-wrapper sr-only">
                                                        <label class="control-label" for="email">Email</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="email-input-wrapper"> <span class="menu-icon"> <i class="fa fa-envelope"></i> </span>
                                                        <input type="email" placeholder="Email" id="email" name="email" value="{{email}}" class="required" required>
                                                    </div>
                                                    <div class="label-wrapper">
                                                        <label class="control-label sr-only" for="password">Password</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="password-input-wrapper" > <span class="menu-icon"> <i class="fa fa-lock"></i> </span>
                                                        <input type="password" placeholder="Password" id="password" name="password" value="{{password}}" class="required" required>
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="vd_login-error" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle fa-fw"></i> Please fill the necessary field </div>
                                            <div class="form-group">
                                                <div class="col-md-12 text-center mgbt-xs-5">
                                                    <button class="btn vd_bg-green vd_white width-100" type="submit" id="submit_login" name="submit_login">Login</button>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="row">
                                                        <div class="col-xs-6">
                                                            <div class="vd_checkbox">
                                                                <input type="checkbox" name="remember_me" id="remember_me" value="1">
                                                                <label for="remember_me"> Remember me</label>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-6 text-right">
                                                            <div class=""> <a href="forget_password">Forget Password? </a> </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <!-- Panel Widget -->
                            </div>
                            <!-- vd_login-page -->

                        </div>
                        <!-- .vd_content-section -->

                    </div>
                    <!-- .vd_content -->
                </div>
                <!-- .vd_container -->
            </div>
            <!-- .vd_content-wrapper -->

            <!-- Middle Content End -->

        </div>
        <!-- .container -->
    </div>
    <!-- .content -->

    <!-- Footer Start -->
    <footer class="footer-2"  id="footer">
        <div class="vd_bottom ">
            <div class="container">
                <div class="row">
                    <div class=" col-xs-12">
                        <div class="copyright text-center">
                            Copyright &copy;2014 Venmond Inc. All Rights Reserved
                        </div>
                    </div>
                </div><!-- row -->
            </div><!-- container -->
        </div>
    </footer>
    <!-- Footer END -->

</div>

<!-- .vd_body END  -->
<a id="back-top" href="#" data-action="backtop" class="vd_back-top visible"> <i class="fa  fa-angle-up"> </i> </a>
<!--
<a class="back-top" href="#" id="back-top"> <i class="icon-chevron-up icon-white"> </i> </a> -->

<!-- Javascript =============================================== -->
<!-- Placed at the end of the document so the controllers load faster -->
<script type="text/javascript" src="{{assets_url}}js/jquery.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="{{assets_url}}js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="{{assets_url}}js/bootstrap.min.js"></script>
<script type="text/javascript" src='plugins/jquery-ui/jquery-ui.custom.min.js'></script>
<script type="text/javascript" src="{{assets_url}}plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<script type="text/javascript" src="{{assets_url}}js/caroufredsel.js"></script>
<script type="text/javascript" src="{{assets_url}}js/plugins.js"></script>

<script type="text/javascript" src="{{assets_url}}plugins/breakpoints/breakpoints.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/dataTables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js"></script>

<script type="text/javascript" src="{{assets_url}}plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/tagsInput/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/pnotify/js/jquery.pnotify.min.js"></script>

<script type="text/javascript" src="{{assets_url}}js/theme.js"></script>
<script type="text/javascript" src="custom/custom.js"></script>

<!-- Specific Page Scripts Put Here -->

<!-- Specific Page Scripts END -->

</body>

</html>