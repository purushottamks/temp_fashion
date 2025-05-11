<?php
 function get_page(){

     if(is_dir('db')){
         ini_set('max_execution_time', 300);
         if(file_exists("controllers/backoffice/installer.php")){
            include("controllers/backoffice/installer.php");
         }
     }else{
         if(isset($_GET['view']) && !empty($_GET['view'])){
             $page = $_GET['view'];
         }else{
             $page = 'index';
         }

         if(file_exists("controllers/frontdesk/".$page.'.php')){
             include("controllers/frontdesk/".$page.'.php');
         }elseif(file_exists("controllers/backoffice/".$page.'.php')){
             include("controllers/backoffice/".$page.'.php');
         }else{
             include("controllers/backoffice/admin404.php");
         }
     }
}

