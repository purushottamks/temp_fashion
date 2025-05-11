<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */

class Input
{
    protected $db;

    public function __construct()
    {
        $this->db = new Database();
    }
	
    public function get($input) {
        $input = $_GET[$input];
        $input = mysqli_real_escape_string($this->db->con(), $input);
        $input = trim($input);
        return $input;
    }

    public function post($input) {
        $input = $_POST[$input];
        $input = mysqli_real_escape_string($this->db->con(), $input);
        $input = trim($input);
        return $input;
    }

    public function request($input) {
        $input = $_REQUEST[$input];
        $input = mysqli_real_escape_string($this->db->con(), $input);
        $input = trim($input);
        return $input;
    }
}///classs
