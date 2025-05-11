<?php

function __autoload($class){

    if(file_exists(BASE_DIR.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'app'.DIRECTORY_SEPARATOR.$class.'.php')){
        require_once(BASE_DIR.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'app'.DIRECTORY_SEPARATOR.$class.'.php');
    }

    if(file_exists(BASE_DIR.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'app'.DIRECTORY_SEPARATOR.'prestashop'.DIRECTORY_SEPARATOR.$class.'.php')){
        require_once(BASE_DIR.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'app'.DIRECTORY_SEPARATOR.'prestashop'.DIRECTORY_SEPARATOR.$class.'.php');
    }

    if(file_exists(BASE_DIR.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'system'.DIRECTORY_SEPARATOR.$class.'.php')){
        require_once(BASE_DIR.DIRECTORY_SEPARATOR.'models'.DIRECTORY_SEPARATOR.'system'.DIRECTORY_SEPARATOR.$class.'.php');
    }

}

?>