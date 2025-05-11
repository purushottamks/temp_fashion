<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */

class Security
{
    protected $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }


    public function is_exist($table, $field, $value){
        $query = "SELECT * FROM {$table} WHERE {$field} = '{$value}'";
        $run_query = $this->db->query($query);
         if($this->db->num_rows($run_query)>0){
             return true;
         }else{
             return false;
         }
    }


    public function post($data) {
        $data = $_POST[$data];
        $data = mysqli_real_escape_string($this->db->getConnection(), $data);
        $data = trim($data);
        return $data;
    }

    public function get($data) {
        $data = $_GET[$data];
        $data = mysqli_real_escape_string($this->db->getConnection(), $data);
        $data = trim($data);
        return $data;
    }

    public function clean_output($data)
    {
        $data = stripslashes($data);
        return $data;
    }

    public function password($pwd){
        $pwd = $_POST[$pwd];
        $pwd = sha1($pwd);
        $pwd = substr($pwd, 0,30);
        return $pwd;
    }

    public function realescape($data){
        return mysqli_real_escape_string($this->db->con(), $data);
    }


    public function DBin($string)
    {
        $a = html_entity_decode($string);
        return trim(htmlspecialchars($a,ENT_QUOTES));
    }


    public function DBout($string)
    {
        $string = stripslashes(trim($string));
        return str_replace("&#039;","'",html_entity_decode($string,ENT_QUOTES,'UTF-8'));
    }




}///classs
