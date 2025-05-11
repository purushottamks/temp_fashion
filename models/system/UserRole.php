<?php

/**
 * Created by PhpStorm.
 * User: yasir
 * Date: 1/15/2017
 * Time: 11:49 PM
 */
class UserRole
{

    protected $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function can_access($levels){
        $user_level =  $this->get_user_role();

        if(in_array($user_level, $levels)){
            return true;
        }else{
            return false;
        }
    }

    public function get_user_role(){
        $user_id = $_SESSION['user_id'];
        return $this->db->fetch_by_field('role_id', 'users', $user_id);
    }


}