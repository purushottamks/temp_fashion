<?php
/**
 * Created by PhpStorm.
 * User: Yasir
 * Date: 17/07/2018
 * Time: 3:07 PM
 */

class Collection
{

    private $db;
    private $pagination;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
    }


    public function collections($perPage, $offset, $page){
        $table = 'collections';
        $url = BASE_URL.'allCollections/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }

    public function collections_dropdown(){
       $query = "SELECT * FROM collections";
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
        $query = "INSERT INTO collections (`name`, `image`, `thumbnail`) VALUES ('{$params['name']}', '{$params['image']}', '{$params['thumbnail']}')";
        if($print){
            echo $query;
        }

        if ($this->db->query($query)){
            return true;
        }else{
            return false;
        }
    }


    public function collectionName($collection_id){
        return $this->db->fetch_by_field('name', 'collection', " id = {$collection_id}");
    }

    public function productCollections($product_id){
        $query = "SELECT collections.*, products_collections.* 
                  FROM collections 
                  INNER JOIN products_collections
                  ON collections.id = products_collections.collection_id
                  WHERE products_collections.product_id = {$product_id} ";
        $run_query = $this->db->query($query);
        $product_collections = array();
        if($this->db->num_rows($run_query) > 0){
            $fetch = $this->db->fetch($run_query);
            do{
                $product_collections[$fetch['']] = $fetch[''];
            }while($fetch);
        }
        return json_encode($product_collections);
    }


}