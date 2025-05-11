<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
    <meta charset="utf-8" />
    <title>Forget Password</title>
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
      <script type="text/javascript" src="js/html5shiv.js"></script>
      <script type="text/javascript" src="js/respond.min.js"></script>     
    <![endif]-->
    
</head>    

<body id="pages" class="full-layout no-nav-left no-nav-right  nav-top-fixed background-login     responsive remove-navbar login-layout   clearfix" data-active="pages "  data-smooth-scrolling="1">     
<div class="vd_body">
<!-- Header Start -->

<!-- Header Ends --> 
<div class="content"><div class="container">





<!-- Middle Content Start -->

<div class="vd_content-wrapper">
    <div class="vd_container">
    
        <div class="vd_content clearfix">               
            <div class="vd_content-section clearfix">  

            <div class="vd_login-page">     
            	<div class="heading clearfix">
                	<div class="logo"><h2 class="mgbt-xs-5"><img src="{{assets_url}}img/logo.jpg" alt="logo"></h2></div>
                    <h4 class="text-center font-semibold vd_grey">RESET TO YOUR PASSWORD</h4>                     
                </div>
               
                <div class="panel widget">
                    <div class="panel-body">
                    
                          <div class="login-icon">
                                <i class="fa fa-lock"></i>
                          </div>      
                          <div id="password-success" class="alert alert-success vd_hidden"><i class="fa fa-exclamation-circle fa-fw"></i> Your reset password form has been sent to your email </div>              
                          <form class="form-horizontal" method="post"  role="form" id="" action="">
                          {{info}}
                  <div class="alert alert-danger vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>Oh snap!</strong> Change a few things up and try submitting again. </div>
                  <div class="alert alert-success vd_hidden">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-check-circle vd_green"></i></span>Your reset password form has been sent to your email. </div>                            
                             <div class="form-group mgbt-xs-20">
                                 <div class="col-md-12">
                                 	<p class="text-center"><strong>To reset your password, enter the email address you use to sign in to Genesis.</strong> </p>
                                    <div class="vd_input-wrapper" id="email-input-wrapper">
                                        <span class="menu-icon">
                                            <i class="fa fa-envelope"></i>
                                        </span>
                                        <input type="email" placeholder="Email" id="email" name="email" class="required">
                                    </div>   
                                
                                  </div>                            
                            </div>   
                            
                                                                                                        
                            <div class="form-group" id="submit-password-wrapper">
                              <div class="col-md-12 text-center mgbt-xs-5">
                              	<input type="submit" name="submit_email" id="" class="btn vd_bg-green vd_white width-100">  
                              </div>

                            </div>
                          </form>

                          
                    </div>
                </div> <!-- Panel Widget --> 
                <div class="register-panel text-center font-semibold">	
                	<a href="../../index.php">LOGIN</a>
                </div>
                </div> <!-- vd_login-page -->

                
                                                           
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
<script type="text/javascript">
$(document).ready(function() {
	"use strict";

        var form_register_2 = $('#forget-password-form');
        var error_register_2 = $('.alert-danger', form_register_2);
        var success_register_2 = $('.alert-success', form_register_2);
	
	var options = { 
		type: "POST",
		url:  $("#forget-password-form").attr('action'),
		dataType: "json",
		success: function(data) {
			if (data.response == "success") {
				setTimeout(function(){
					$('#submit-password .fa-spinner').remove()	;
					$('#submit-password').addClass('disabled');					
					success_register_2.fadeIn(500);
					error_register_2.fadeOut(500);
				},1500)
				
			} else if (data.response == "error") {
				$('#submit-password .fa-spinner').remove()	;
				$('#submit-password').removeClass('disabled');	
			
			} else if (data.response == "empty") {
					
			} else if (data.response == "unexpected") {
						
			}	
						
		},
		error: function() {

		}
	}; 

        form_register_2.validate({
            errorElement: 'div', //default input error message container
            errorClass: 'vd_red', // default input error message class
            focusInvalid: false, // do not focus the last invalid input
            ignore: "",
            rules: {
				
                email: {
                    required: true,
                    email: true
                },				

				
            },
			
			errorPlacement: function(error, element) {
				if (element.parent().hasClass("vd_checkbox") || element.parent().hasClass("vd_radio")){
					element.parent().append(error);
				} else if (element.parent().hasClass("vd_input-wrapper")){
					error.insertAfter(element.parent());
				}else {
					error.insertAfter(element);
				}
			}, 
			
            invalidHandler: function (event, validator) { //display error alert on form submit              
                success_register_2.fadeOut(500);
                error_register_2.fadeIn(500);


            },

            highlight: function (element) { // hightlight error inputs
		
				$(element).addClass('vd_bd-red');
				$(element).parent().siblings('.help-inline').removeClass('help-inline hidden');
				if ($(element).parent().hasClass("vd_checkbox") || $(element).parent().hasClass("vd_radio")) {
					$(element).siblings('.help-inline').removeClass('help-inline hidden');
				}
				

            },

            unhighlight: function (element) { // revert the change dony by hightlight
                $(element)
                    .closest('.control-group').removeClass('error'); // set error class to the control group
            },

            success: function (label, element) {
                label
                    .addClass('valid').addClass('help-inline hidden') // mark the current input as valid and display OK icon
                	.closest('.control-group').removeClass('error').addClass('success'); // set success class to the control group
				$(element).removeClass('vd_bd-red');

					
            },

            submitHandler: function (form) {
				$(form).find('#submit-password').addClass('disabled').prepend('<i class="fa fa-spinner fa-spin mgr-10"></i>')/*.addClass('disabled').attr('disabled')*/;					
				$(form).ajaxSubmit(options);			
            }
        });	


	
	
});
</script>


<!-- Specific Page Scripts END -->

</body>
</html>