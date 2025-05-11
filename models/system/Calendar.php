<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */

class Calendar
{

    public function current_date_time(){
        date_default_timezone_set("Asia/karachi");
       return date('Y-m-d H:i:s');
    }

    public function current_date(){
        date_default_timezone_set("Asia/karachi");
        return date('Y-m-d H:i:s');
    }

    public function current_time(){
        date_default_timezone_set("Asia/karachi");
        return date('Y-m-d H:i:s');
    }

}///class
