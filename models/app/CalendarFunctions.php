<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */

class CalendarFunctions
{

    protected $db;

    public function __construct()
    {
        $this->db = new Database();
    }


    public function current_date_time(){
        return date('Y-m-d H:i:s');
    }


    public function remove_time_from_date($date){
        $separated = explode('-',$date);
        $d = $separated['0'];
        $m = $separated['1'];
        $y =  $separated['2'];
        $date = $y.'-'.$m.'-'.$d;
        return $date;

    }


    public function retur_year_part($date){
        $separated = explode('-',$date);
        $y =  $separated['2'];
        return $y;
    }


    public function change_formate($date){
        $separated = explode('/',$date);
        $d = $separated['0'];
        $m = $separated['1'];
        $y =  $separated['2'];
        $date = $y.'-'.$m.'-'.$d;
        return $date;
    }



    public function get_period($start, $end)
    {
        $time_in = strtotime($start);
        $time_out = strtotime($end);
        $working_time = $time_out - $time_in;
        return $working_time;
    }


    public function date_to_time_stamp($time)
    {
        $hours = floor($time / 3600);
        $minutes = floor(($time / 60) % 60);
        $seconds = $time % 60;

        return "$hours:$minutes:$seconds";
    }


    public function get_timezone(){
        $query = "SELECT time_zone from settings where id = 1 ";
        $run_query = $this->db()->query($query);
        $fetch_query = $this->db()->fetch($run_query);

        return $fetch_query['time_zone'];
    }


    public function date_mon($date){
        $date = strtotime($date);
        $date_time = date("Y-M-d", $date);
    return $date_time;
    }

}/////class end

