<?php
/**
 * Created by PhpStorm.
 * User: Yasir
 * Date: 17/07/2018
 * Time: 3:07 PM
 */

class Category
{

    private $db;
    private $pagination;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
    }


    public function categories($perPage, $offset, $page){
        $table = 'categories';
        $url = BASE_URL.'adminAllCategories/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }

    public function categories_dropdown(){
       $query = "SELECT * FROM categories";
       $run_query = $this->db->query($query);
       $dropdown = '';
       if($run_query){
           $fetch_query = $this->db->fetch($run_query);
           if($this->db->num_rows($run_query) > 0){
               do{
                   $dropdown.='<option value="'.$fetch_query['id'].'">'.$fetch_query['name'].'</option>';
               }while($fetch_query = $this->db->fetch($run_query));
           }
       }
       return $dropdown;
    }

    public function storeCategory($params , $print=false){
        $query = "INSERT INTO categories (`name`, `image`, `thumbnail`) VALUES ('{$params['name']}', '{$params['image']}', '{$params['thumbnail']}')";
        if($print){
            echo $query;
        }

        if ($this->db->query($query)){
            return true;
        }else{
            return false;
        }
    }


    public function categoryName($category_id){
        return $this->db->fetch_by_field('name', 'categories', " id = {$category_id}");
    }

}