<?php
include_once('models/autoload.php');
/** instances of models **/
$includes = new Includes();

if(session_id() == '' ){
    session_start();
}
session_destroy();

header('location:adminLogin');