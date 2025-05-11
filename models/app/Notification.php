<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Notification
{

    public function success($text){
       return '<div class="alert alert-success"> '.$text.' </div>' ;
    }

    public function warning($text){
        return '<div class="alert alert-warning"> '.$text.' </div>' ;
    }

    public function danger($text){
        return '<div class="alert alert-danger"> '.$text.' </div>' ;
    }


}///end class