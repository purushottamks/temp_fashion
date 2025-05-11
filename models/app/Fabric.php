<?php
/**
 * Created by PhpStorm.
 * User: Yasir
 * Date: 17/07/2018
 * Time: 3:07 PM
 */

class Fabric
{

    private $db;
    private $pagination;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
    }


    public function fabrics($perPage, $offset, $page){
        $table = 'fabrics';
        $url = BASE_URL.'adminAllFabrics/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }
    
    
    
    public function fabricsSidebar($perPage, $offset, $page){
        $table = 'fabrics';
        $url = BASE_URL.'adminAllFabrics/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }

    public function fabrics_dropdown(){
       $query = "SELECT * FROM fabrics";
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

    public function storeFabric($params , $print=false){
        $query = "INSERT INTO fabrics (`name`, `color_id`, `material_id`, `pattern_id`, `category_id`, `description`, `thickness`, `composition`, `pattern`, `image`, `thumbnail`, `extra_price`)
                  VALUES ('{$params['name']}', {$params['color_id']}, {$params['material_id']}, {$params['pattern_id']}, {$params['category_id']}, '{$params['description']}', {$params['thickness']}, {$params['composition']}, {$params['pattern']}, '{$params['image']}', '{$params['thumbnail']}', {$params['extra_price']} )";
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


    public function fabricName($fabric_id){
        return $this->db->fetch_by_field('name', 'fabrics', " id = {$fabric_id}");
    }

    public function fabricPrice($fabric_id){
        return $this->db->fetch_by_field('extra_price', 'fabrics', " id = {$fabric_id}");
    }

}