<?php
/**
 * Created by PhpStorm.
 * User: Yasir
 * Date: 17/07/2018
 * Time: 3:07 PM
 */

class Button
{

    private $db;
    private $pagination;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
    }


    public function buttons($perPage, $offset, $page){
        $table = 'buttons';
        $url = BASE_URL.'allButtons/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }

    public function buttons_dropdown(){
       $query = "SELECT * FROM buttons";
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

    public function store($params , $print=false){
        $query = "INSERT INTO buttons (`name`, `image`, `thumbnail`, `description`, `fabric_id`, `fit_id`) 
                  VALUES ('{$params['name']}', '{$params['image']}', '{$params['thumbnail']}', '{$params['description']}', {$params['fabric_id']}, {$params['fit_id']})";
        if($print){
            echo $query;
        }

        if ($this->db->query($query)){
            return true;
        }else{
            echo $query;
            return false;
        }
    }


    public function buttonName($collection_id){
        return $this->db->fetch_by_field('name', 'collection', " id = {$collection_id}");
    }

}