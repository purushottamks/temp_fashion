<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Accessory
{
    protected $db;
    private $pagination;


    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
    }


    public function store($params){
        $query = "INSERT INTO `accessories` (`name`, `image`, `thumbnail`, `category`, `price`) 
                  VALUES ('{$params['name']}', '{$params['image']}', '{$params['thumbnail']}', {$params['category']}, {$params['price']} ) ";
        $run_query = $this->db->query($query);
        if($run_query){
            return true;
        }else{
            return false;
        }
    }


    public function accessories($perPage, $offset, $page){
        $table = 'accessories';
        $url = BASE_URL.'accessories/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }


    public function accessoryByCategory($category, $perPage, $page){
        $table = 'accessories';
        $url = BASE_URL.'accessories/';
        $params = array();
        $params['page'] = $page;
        $params['category'] = $category;
        $where = 'WHERE category = '.$category;
        return $this->pagination->paginate_table_frontdesk($table, $page, $perPage, $url, $params, $where);
    }

    public function accessoryInfo($id){
        $query = "SELECT * FROM accessories WHERE id = {$id}";
        $fetch = $this->db->fetch_direct($query);
        if($fetch){
            return $fetch;
        }
        return false;
    }

}///end class

