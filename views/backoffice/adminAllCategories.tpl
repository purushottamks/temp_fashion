<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title>{{title}}</title>
    <meta name="keywords" content="HTML5 Template, CSS3, All Purpose Admin Template, "/>
    <meta name="description" content="Responsive Admin Template for multipurpose use">
    <meta name="author" content="Venmond">

    <!-- Set the viewport width to device width for mobile -->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144"
          href="{{assets_url}}img/ico/apple-touch-icon-144-precomposed.html">
    <link rel="apple-touch-icon-precomposed" sizes="114x114"
          href="{{assets_url}}img/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72"
          href="{{assets_url}}img/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed"
          href="{{assets_url}}img/ico/apple-touch-icon-57-precomposed.png">
    <link rel="shortcut icon" href="{{assets_url}}img/ico/favicon.png">


    <!-- CSS -->

    <!-- Bootstrap & FontAwesome & Entypo CSS -->
    <link href="{{assets_url}}css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <!--[if IE 7]>
    <link type="text/css" rel="stylesheet" css/font-awesome-ie7.min.css"><![endif]-->
    <link href="{{assets_url}}css/font-entypo.css" rel="stylesheet" type="text/css">

    <!-- Fonts CSS -->
    <link href="{{assets_url}}css/fonts.css" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href="{{assets_url}}plugins/jquery-ui/jquery-ui.custom.min.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/prettyPhoto-plugin/css/prettyPhoto.css" rel="stylesheet"
          type="text/css">
    <link href="{{assets_url}}plugins/isotope/css/isotope.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/pnotify/css/jquery.pnotify.css" media="screen" rel="stylesheet"
          type="text/css">
    <link href="{{assets_url}}plugins/google-code-prettify/prettify.css" rel="stylesheet" type="text/css">


    <link href="{{assets_url}}plugins/mCustomScrollbar/jquery.mCustomScrollbar.css" rel="stylesheet"
          type="text/css">
    <link href="{{assets_url}}plugins/tagsInput/jquery.tagsinput.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/bootstrap-switch/bootstrap-switch.css" rel="stylesheet"
          type="text/css">
    <link href="{{assets_url}}plugins/daterangepicker/daterangepicker-bs3.css" rel="stylesheet"
          type="text/css">
    <link href="{{assets_url}}plugins/bootstrap-timepicker/bootstrap-timepicker.min.css" rel="stylesheet"
          type="text/css">
    <link href="{{assets_url}}plugins/colorpicker/css/colorpicker.css" rel="stylesheet" type="text/css">

    <!-- Specific CSS -->
    <link href="{{assets_url}}plugins/fullcalendar/fullcalendar.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/fullcalendar/fullcalendar.print.css" rel="stylesheet" type="text/css">
    <link href="{{assets_url}}plugins/introjs/css/introjs.min.css" rel="stylesheet" type="text/css">

    <!-- Theme CSS -->
    <link href="{{assets_url}}css/theme.min.css" rel="stylesheet" type="text/css">
    <!--[if IE]>
    <link href="{{assets_url}}css/ie.css" rel="stylesheet"> <![endif]-->
    <link href="{{assets_url}}css/chrome.css" rel="stylesheet" type="text/chrome">
    <!-- chrome only css -->


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

    <style>
        .img-thumbnail{
            max-width: 100px;
            max-height: 100px;
        }
    </style>

</head>

<body id="dashboard" class="full-layout  nav-right-hide nav-right-start-hide  nav-top-fixed      responsive    clearfix"
      data-active="dashboard " data-smooth-scrolling="1">
<div class="vd_body">
    <!-- Header Start -->

    {{header}}


    <div class="modal fade" id="loading" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:200px !important; top:200px">
            <div class="modal-content">

                <div class="modal-body clearfix" id="edit_category_content">
                      <img src="{{assets_url}}img/pre_loader.gif">
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>


    <div class="modal fade" id="edit_category" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:85%">

            <div class="modal-header vd_bg-green vd_white">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                            class="fa fa-times"></i></button>
                <h4 class="modal-title" id="view_category_heading">View Category</h4>
            </div>

            <div class="modal-content">

                <div class="modal-body clearfix" id="edit_category_content">
                    <form id="edit_form" method="post" action="" enctype="multipart/form-data">

                        <input type="hidden" id="old_image" name="old_image" value="">
                        <input type="hidden" id="thumbnail" name="thumbnail" value="">
                        <input type="hidden" id="category_id" name="category_id" value="">

                        <div class="form-group">
                            <label for="cat_name">Category Name</label>
                            <input type="text" id="cat_name" name="cat_name" value="">
                        </div>

                        <div class="form-group">
                            <label for="cat_image">Category Image</label>
                            <input type="file" id="cat_image" name="cat_image" value="">
                        </div>

                        <div class="form-group text-center">
                            <img id="show_image" src="" />
                        </div>

                        <div class="form-group">
                            <input type="submit" id="edit_category" name="edit_category" value="Update" class="btn btn-success">
                        </div>

                    </form>
                </div>

            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>




    <div class="modal fade" id="view_category" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="width:85% !important;">
            <div class="modal-content">
                <div class="modal-header vd_bg-green vd_white">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                                class="fa fa-times"></i></button>
                    <h4 class="modal-title" id="view_category_heading">View Category</h4>
                </div>
                <div class="modal-body clearfix" id="view_category_content">

                </div>
                <div class="modal-footer background-login">
                    <button type="button" class="btn vd_btn vd_bg-red" data-dismiss="modal">Close</button>
                </div>
            </div>
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>



    <!-- Header Ends -->
    <div class="content">
        <div class="container">
            <!----- side bar ------->
            {{sidebar}}
            <!----- side bar ------->

            <div class="vd_navbar vd_nav-width vd_navbar-chat vd_bg-black-80 vd_navbar-right   ">
                <div class="navbar-tabs-menu clearfix">
			<span class="expand-menu" data-action="expand-navbar-tabs-menu">
            	<span class="menu-icon menu-icon-left">
            		<i class="fa fa-ellipsis-h"></i>
                    <span class="badge vd_bg-red">
                        20
                    </span>
                </span>
            	<span class="menu-icon menu-icon-right">
            		<i class="fa fa-ellipsis-h"></i>
                    <span class="badge vd_bg-red">
                        20
                    </span>
                </span>
            </span>

                    <div class="menu-container">
                        <div class="navbar-search-wrapper">
                            <div class="navbar-search vd_bg-black-30">
                                <span class="append-icon"><i class="fa fa-search"></i></span>
                                <input type="text" placeholder="Search"
                                       class="vd_menu-search-text no-bg no-bd vd_white width-70" name="search">

                                <div class="pull-right search-config">
                                    <a data-toggle="dropdown" href="javascript:void(0);" class="dropdown-toggle"><span
                                                class="prepend-icon vd_grey"><i class="fa fa-cog"></i></span></a>
                                    <ul role="menu" class="dropdown-menu">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                        <li class="divider"></li>
                                        <li><a href="#">Separated link</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
                <div class="navbar-menu clearfix">
                    <div class="content-list content-image content-chat">
                        <ul class="list-wrapper no-bd-btm pd-lr-10">
                            <li class="group-heading vd_bg-black-20">FAVORITE</li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar.jpg"
                                                                alt="example image">
                                    </div>
                                    <div class="menu-text">Jessylin
                                        <div class="menu-info">
                                            <span class="menu-date">Administrator </span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar-2.jpg"
                                                                alt="example image"></div>
                                    <div class="menu-text">Rodney Mc.Cardo
                                        <div class="menu-info">
                                            <span class="menu-date">Designer </span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="badge status vd_bg-grey">&nbsp;</span></div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar-3.jpg"
                                                                alt="example image"></div>
                                    <div class="menu-text">Theresia Minoque
                                        <div class="menu-info">
                                            <span class="menu-date">Engineering </span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                </a>
                            </li>
                            <li class="group-heading vd_bg-black-20">FRIENDS</li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar-4.jpg"
                                                                alt="example image"></div>
                                    <div class="menu-text">Greg Grog
                                        <div class="menu-info">
                                            <span class="menu-date">Developer </span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="badge status vd_bg-grey">&nbsp;</span></div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar-5.jpg"
                                                                alt="example image"></div>
                                    <div class="menu-text">Stefanie Imburgh
                                        <div class="menu-info">
                                            <span class="menu-date">Dancer</span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="vd_grey font-sm"><i
                                                    class="fa fa-mobile"></i></span></div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar-6.jpg"
                                                                alt="example image"></div>
                                    <div class="menu-text">Matt Demon
                                        <div class="menu-info">
                                            <span class="menu-date">Musician </span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="vd_grey font-sm"><i
                                                    class="fa fa-mobile"></i></span></div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar-7.jpg"
                                                                alt="example image"></div>
                                    <div class="menu-text">Jeniffer Anastasia
                                        <div class="menu-info">
                                            <span class="menu-date">Senior Developer </span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    <div class="menu-icon"><img src="{{assets_url}}img/avatar/avatar-8.jpg"
                                                                alt="example image"></div>
                                    <div class="menu-text">Daniel Dreamon
                                        <div class="menu-info">
                                            <span class="menu-date">Sales Executive </span>
                                        </div>
                                    </div>
                                    <div class="menu-badge"><span class="badge status vd_bg-green">&nbsp;</span></div>
                                </a>
                            </li>

                        </ul>
                    </div>


                </div>
                <div class="navbar-spacing clearfix">
                </div>
            </div>
            <!-- Middle Content Start -->

            <div class="vd_content-wrapper">
                <div class="vd_container">
                    <div class="vd_content clearfix">
                        <div class="vd_head-section clearfix">
                            <div class="vd_panel-header">
                                <ul class="breadcrumb">
                                    <li><a href="../../index.php">Home</a></li>
                                    <li class="active">{{page_title}}</li>
                                </ul>
                                <div class="vd_panel-menu hidden-sm hidden-xs"
                                     data-intro="<strong>Expand Control</strong><br/>To expand content page horizontally, vertically, or Both. If you just need one button just simply remove the other button code."
                                     data-step=5 data-position="left">
                                    <div data-action="remove-navbar" data-original-title="Remove Navigation Bar Toggle"
                                         data-toggle="tooltip" data-placement="bottom"
                                         class="remove-navbar-button menu"><i class="fa fa-arrows-h"></i></div>
                                    <div data-action="remove-header" data-original-title="Remove Top Menu Toggle"
                                         data-toggle="tooltip" data-placement="bottom"
                                         class="remove-header-button menu"><i class="fa fa-arrows-v"></i></div>
                                    <div data-action="fullscreen"
                                         data-original-title="Remove Navigation Bar and Top Menu Toggle"
                                         data-toggle="tooltip" data-placement="bottom" class="fullscreen-button menu"><i
                                                class="glyphicon glyphicon-fullscreen"></i></div>

                                </div>

                            </div>
                        </div>
                        <!-- vd_head-section -->

                        <div class="vd_title-section clearfix">
                            <div class="vd_panel-header">
                                <h1>{{page_title}}</h1>
                                <small class="subtitle"></small>
                                <div class="vd_panel-menu  hidden-xs">
                                    <div class="menu no-bg vd_red" data-original-title="Start Layout Tour Guide"
                                         data-toggle="tooltip" data-placement="bottom"
                                         onClick="javascript:introJs().setOption('showBullets', false).start();"><span
                                                class="menu-icon font-md"><i class="fa fa-question-circle"></i></span></div>
                                    <!-- menu -->
                                </div>
                                <!-- vd_panel-menu -->
                            </div>
                            <!-- vd_panel-header -->
                        </div>
                        <!-- vd_title-section -->

                        <div class="vd_content-section clearfix">

                            <!--------------------------->
                            <div class="row">
                                {{info}}
                                <div class="col-md-12">
                                    <div class="panel widget">
                                        <div class="panel-heading vd_bg-grey">
                                            <h3 class="panel-title"> <span class="menu-icon"> <i class="fa fa-dot-circle-o"></i> </span> Table Basic with Hover </h3>
                                        </div>
                                        <div class="panel-body table-responsive">
                                            <table class="table table-hover">
                                                <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>Name</th>
                                                    <th>Image</th>
                                                    <th>Action</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                   {{categories}}
                                                </tbody>
                                            </table>
                                            <ul class="pagination">
                                                {{pagination}}
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- Panel Widget -->
                                </div>
                                <!-- col-md-12 -->
                            </div>
                            <!--------------------------->

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
    {{footer}}
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
<script type="text/javascript" src='{{assets_url}}plugins/jquery-ui/jquery-ui.custom.min.js'></script>
<script type="text/javascript"
        src="{{assets_url}}plugins/jquery-ui-touch-punch/jquery.ui.touch-punch.min.js"></script>

<script type="text/javascript" src="{{assets_url}}js/caroufredsel.js"></script>
<script type="text/javascript" src="{{assets_url}}js/plugins.js"></script>

<script type="text/javascript" src="{{assets_url}}plugins/breakpoints/breakpoints.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/dataTables/jquery.dataTables.min.js"></script>
<script type="text/javascript"
        src="{{assets_url}}plugins/prettyPhoto-plugin/js/jquery.prettyPhoto.js"></script>

<script type="text/javascript"
        src="{{assets_url}}plugins/mCustomScrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/tagsInput/jquery.tagsinput.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/bootstrap-switch/bootstrap-switch.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/blockUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/pnotify/js/jquery.pnotify.min.js"></script>

<script type="text/javascript" src="{{assets_url}}js/theme.js"></script>
<script type="text/javascript" src="{{assets_url}}custom/custom.js"></script>

<!-- Specific Page Scripts Put Here -->
<!-- Flot Chart  -->
<script type="text/javascript" src="{{assets_url}}plugins/flot/jquery.flot.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/flot/jquery.flot.resize.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/flot/jquery.flot.pie.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/flot/jquery.flot.categories.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/flot/jquery.flot.time.min.js"></script>
<script type="text/javascript" src="{{assets_url}}plugins/flot/jquery.flot.animator.min.js"></script>

<!-- Vector Map -->
<script type="text/javascript"
        src="{{assets_url}}plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script type="text/javascript"
        src="{{assets_url}}plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!-- Calendar -->
<script type="text/javascript" src='{{assets_url}}plugins/moment/moment.min.js'></script>
<script type="text/javascript" src='{{assets_url}}plugins/jquery-ui/jquery-ui.custom.min.js'></script>
<script type="text/javascript" src='{{assets_url}}plugins/fullcalendar/fullcalendar.min.js'></script>

<!-- Intro JS (Tour) -->
<script type="text/javascript" src='{{assets_url}}plugins/introjs/js/intro.min.js'></script>

<!-- Sky Icons -->
<script type="text/javascript" src='{{assets_url}}plugins/skycons/skycons.js'></script>


<script>

    var base_url = "{{base_url}}";

    function show_category(e){
       var cat_id = $(e).data('category_id');
       var cat_name = $(e).data('category_name');
       var old_image = $(e).data('category_image');
       var old_thumbnail = $(e).data('thumbnail');
       $("#category_id").val(cat_id);
       $("#cat_name").val(cat_name);
       $("#old_image").val(old_image);
       $("#thumbnail").val(old_thumbnail);
       $("#show_image").attr('src', base_url+"uploads/"+old_image);
       $("#edit_category").modal('show');
    }



    function delete_category(e){
        var action = $(e).data('action');
        var category_id = $(e).data('category_id');
        $("#loading").modal('show');
        $.ajax({
            url:'',
            type:'post',
            data:{ajax:1, action:action, category_id:category_id},
            success:function(response){
                if(response == 'success'){
                    $("#row_"+category_id).remove();
                }
                $("#loading").modal('hide');
            },
            error:function(response){
                console.log(response);
                $("#loading").modal('gide');
            }
        })
    }


    $(document).ready(function(){
       /// $("#loading").modal('show');
    });

</script>

</body>
</html>
