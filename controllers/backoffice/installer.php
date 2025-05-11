<?php
session_start();
$info = '';
$domain = $_SERVER['REQUEST_URI'].$_SERVER['REQUEST_URI'];

if(isset($_POST['submit_install'])){

    $hname = $_POST['host_name'];
    $dbname= $_POST['database_name'];
    $uname = $_POST['user_name'];
    $pword = $_POST['password'];

    $con = mysqli_connect($hname, $uname, $pword, $dbname);

    if(!$con){
        $_SESSION['message'] = '<div class="alert alert-danger">Provided database information is wrong.</div>';
        header('location: '.$_SERVER['HTTP_REFERER']);
    }else{
        $dbFile = fopen('connection.php','w') or die("Unable to open file!");

        $content= '<?php
        defined("DB_SERVER") ? NULL : define("DB_SERVER", "'.$hname.'");
        defined("DB_DATABASE") ? NULL : define("DB_DATABASE", "'.$dbname.'");
        defined("DB_USERNAME") ? NULL : define("DB_USERNAME", "'.$uname.'");
        defined("DB_PASSWORD") ? NULL : define("DB_PASSWORD", "'.$pword.'");
        ?>';

        fwrite($dbFile, $content);
        fclose($dbFile);


        /// config
        $configFile = fopen('config.php','w') or die("Unable to open file!");
        $config= "<?php 
        define('BASE_DIR', dirname(__FILE__));
        define('HOST', \$_SERVER['HTTP_HOST']);
        ///live
        define('BASE_URL', 'http://".$domain."');
        ?>";

        fwrite($configFile, $config);
        fclose($configFile);

        $dbStructure = 'db/installer.sql';
        $lines = file($dbStructure);

        if(is_array($lines)){
            $importSql = "";
            foreach($lines as $line){
                $importSql .= $line;
                if(substr(trim($line), strlen(trim($line))-1) == ";"){
                    mysqli_query($con,$importSql);
                    $importSql = "";
                }
            }
        }
        rename('db', '_db');
        mysqli_close($con);
        header('location: /suto/adminRegister');
    }

}


?>

<!DOCTYPE html>
<html lang="">
<head>
    <meta charset="utf-8" />
    <title>INSTALL</title>
    <meta name="keywords" content="HTML5 Template, CSS3, All Purpose Admin Template, Vendroid" />
    <meta name="description" content="Login Pages - Responsive Admin HTML Template">
    <meta name="author" content="Venmond">

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="backoffice_assets/img/ico/apple-touch-icon-144-precomposed.html">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="backoffice_assets/img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="backoffice_assets/img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="backoffice_assets/img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="backoffice_assets/img/favicon.png">


    <!-- CSS -->

    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="backoffice_assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]><link type="text/css" rel="stylesheet" href="backoffice_assets/css/font-awesome-ie7.min.css"><![endif]-->
    <link href="backoffice_assets/css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="backoffice_assets/css/fonts.css"  rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="backoffice_assets/plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">


    <link href="backoffice_assets/plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css">
    <link href="backoffice_assets/plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">

    <!-- Specific CSS -->


    <!-- Theme CSS -->
    <link href="backoffice_assets/css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]> <link href="backoffice_assets/css/ie.css" rel="stylesheet" > <![endif]-->
    <link href="backoffice_assets/css/chrome.css" rel="stylesheet" type="text/chrome"> <!-- chrome only css -->



    <!-- Responsive CSS -->
    <link href="backoffice_assets/css/theme-responsive.min.css" rel="stylesheet" type="text/css">




    <!-- for specific page in style css -->

    <!-- for specific page responsive in style css -->


    <!-- Custom CSS -->
    <link href="backoffice_assets/custom/custom.css" rel="stylesheet" type="text/css">



    <!-- Head SCRIPTS -->
    <script type="text/javascript" src="backoffice_assets/js/modernizr.js"></script>
    <script type="text/javascript" src="backoffice_assets/js/mobile-detect.min.js"></script>
    <script type="text/javascript" src="backoffice_assets/js/mobile-detect-modernizr.js"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="backoffice_assets/js/html5shiv.js"></script>
    <script type="text/javascript" src="backoffice_assets/js/respond.min.js"></script>
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
                                        <h2 class="mgbt-xs-5"><img src="backoffice_assets/img/logo.jpg" alt="logo"></h2>
                                    </div>
                                    <h4 class="text-center font-semibold vd_grey">Please fill the required fields</h4>
                                </div>
                                <div class="panel widget">
                                    <div class="panel-body">
                                        <div class="login-icon entypo-icon"> <i class="icon-key"></i> </div>
                                        <form class="form-horizontal" id="login-form" action="" method="post" role="form">
                                            <?php if(isset($_SESSION['message'])){
                                                echo $_SESSION['message'];
                                            } ?>

                                            <div class="alert alert-success vd_hidden">
                                                <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                                                <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span><strong>Well done!</strong>. </div>
                                            <div class="form-group  mgbt-xs-20">
                                                <div class="col-md-12">



                                                    <div class="label-wrapper">
                                                        <label class="control-label sr-only" for="password">Host Name</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="password-input-wrapper" >
                                                        <span class="menu-icon">
                                                            <i class="fa fa-desktop"></i>
                                                        </span>
                                                        <input type="text" value="" placeholder="Host Name" id="host_name" name="host_name" class="required" required>
                                                    </div>




                                                    <div class="label-wrapper">
                                                        <label class="control-label sr-only" for="password">Database Name</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="password-input-wrapper" >
                                                        <span class="menu-icon">
                                                            <i class="fa fa-database"></i>
                                                        </span>
                                                        <input type="text" value="" placeholder="Database Name" id="database_name" name="database_name" class="required" required>
                                                    </div>


                                                    <div class="label-wrapper">
                                                        <label class="control-label sr-only" for="confirmPassword">User Name</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="confirmPwd" >
                                                        <span class="menu-icon"> <i class="fa fa-user"></i> </span>
                                                        <input type="text" placeholder="User Name" value="" id="user_name" name="user_name" class="required" required>
                                                    </div>

                                                    <div class="label-wrapper">
                                                        <label class="control-label sr-only" for="confirmPassword">Password</label>
                                                    </div>
                                                    <div class="vd_input-wrapper" id="confirmPwd" >
                                                        <span class="menu-icon"> <i class="fa fa-lock"></i> </span>
                                                        <input type="password" placeholder="password" value="" id="password" name="password">
                                                    </div>
                                                    <span id="error"></span>
                                                </div>
                                            </div>
                                            <div id="vd_login-error" class="alert alert-danger hidden"><i class="fa fa-exclamation-circle fa-fw"></i> Please fill the necessary field </div>
                                            <div class="form-group">
                                                <div class="col-md-12 text-center mgbt-xs-5">
                                                    <button class="btn vd_bg-green vd_white width-100" type="submit" id="submit_install" name="submit_install">Install</button>
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
                            Copyright &copy;2014 Ranktailor Inc. All Rights Reserved
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


<!-- Javascript =============================================== -->
<!-- Placed at the end of the document so the controllers load faster -->
<script type="text/javascript" src="backoffice_assets/js/jquery.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="backoffice_assets/js/excanvas.js"></script>
<![endif]-->
<script type="text/javascript" src="backoffice_assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src='backoffice_assets/plugins/jquery-ui/jquery-ui.custom.min.js'></script>
<script type="text/javascript" src="backoffice_assets/plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<script type="text/javascript" src="backoffice_assets/js/caroufredsel.js"></script>
<script type="text/javascript" src="backoffice_assets/js/plugins.js"></script>

<script type="text/javascript" src="backoffice_assets/plugins/breakpoints/breakpoints.js"></script>
<script type="text/javascript" src="backoffice_assets/plugins/dataTables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="backoffice_assets/plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js"></script>

<script type="text/javascript" src="backoffice_assets/plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="backoffice_assets/plugins/tagsInput/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="backoffice_assets/plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="backoffice_assets/plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="backoffice_assets/plugins/pnotify/js/jquery.pnotify.min.js"></script>

<script type="text/javascript" src="backoffice_assets/js/theme.js"></script>
<script type="text/javascript" src="backoffice_assets/js/custom.js"></script>

<script>

    function validatePassword(){
        let pwd = $("#password").val();
        let repwd = $("#confirmPassword").val();
        console.log(pwd+" "+repwd);

        if(pwd.length >= 8 && repwd.length >= 8){
            if(pwd == repwd){
                $("#error").text('Healthy').css({"color":"green"});
            }else{
                $("#error").text('Password does not match').css({"color":"red"});
            }
        }else{
            $("#error").text('Password must be 8 charectors long').css({"color":"red"});
        }
    }

</script>

<!-- Specific Page Scripts Put Here -->

<!-- Specific Page Scripts END -->

</body>

</html>
