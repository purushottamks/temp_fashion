<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Product
{
    protected $db;
    private $pagination;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
    }

    public function products($perPage, $offset, $page){
        $table = 'products';
        $url = BASE_URL.'adminAllProducts/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }

    public function productsByCategory($category, $perPage, $page){
        $table = 'products';
        $url = BASE_URL.'outlet/';
        $params = array();
        $params['page'] = $page;
        $params['category'] = $category;
        $where = 'WHERE category_id = '.$category;
        return $this->pagination->paginate_table_frontdesk($table, $page, $perPage, $url, $params, $where);
    }

    public function storeProduct($params, $print=false){
        $query = "INSERT INTO products (`name`, `price`, `image`, `thumbnail`, `category_id`)VALUES('{$params['name']}', {$params['price']}, '{$params['image']}', '{$params['thumbnail']}', {$params['category_id']})";
        if($print){
            echo $query;
        }

        if ($this->db->query($query)){
            return true;
        }else{
            return false;
        }
    }

    public function getCustomProducts(){
        $query = "SELECT * FROM products WHERE is_custom = 'yes' ";
        $run_query = $this->db->query($query);
        $customProducts = array();
        if($this->db->num_rows($run_query)){
            $fetch = $this->db->fetch($run_query);
            do{
                $customProducts[] =  $fetch;
            }while($this->db->fetch($run_query));
        }
        return $customProducts;
    }

    public function productInfo($id){
        return $this->db->fetch_direct("SELECT * FROM products WHERE id = '{$id}' ");
    }

    public function fabricName($id){
        return $this->db->fetch_by_field('name','fabrics', " id = {$id}");
    }

}///end class

