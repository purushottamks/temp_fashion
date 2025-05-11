<?php
/**
 * Created by PhpStorm.
 * User: Yasir
 * Date: 17/07/2018
 * Time: 3:07 PM
 */

class Lining
{
    private $db;
    private $pagination;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
    }


    public function linings($perPage, $offset, $page){
        $table = 'linings';
        $url = BASE_URL.'adminAllLinings/';
        $where = '';
        return $this->pagination->paginate_table($table, $perPage, $offset, $url, $where);
    }

    public function allLinings(){
            $query = "SELECT * FROM linings";
            $run_query = $this->db->query($query);
            $all_linings = '';
            if($run_query && $this->db->num_rows($run_query) > 0){
                $fetch = $this->db->fetch($run_query);
                do{
                    $all_linings.='<div class="col-md-3">
                                        <a href="javascript:void(0)" data-lining_id="'.$fetch['id'].'" data-lining_url="'.BASE_URL.'uploads/'.$fetch['lining_image'].'" onclick="changeLining(this)">
                                            <div class="ssb-icon">
                                                <img src="'.BASE_URL.'uploads/'.$fetch['image'].'">
                                                <span class="font-sm fabric_name">'.$fetch['name'].'</span>
                                            </div>
                                        </a>
                                    </div>';
                }while($fetch = $this->db->fetch($run_query));
            }
            return $all_linings;
    }

    public function linings_dropdown(){
       $query = "SELECT * FROM linings";
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

    public function storeLining($params , $print=false){
        $query = "INSERT INTO linings (`name`, `image`, `thumbnail`, `lining_thumbnail`, `lining_image`) 
                  VALUES ('{$params['name']}', '{$params['image']}', '{$params['thumbnail']}', '{$params['lining_thumbnail']}', '{$params['lining_image']}')";
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


    public function liningName($fabric_id){
        return $this->db->fetch_by_field('name', 'linings', " id = {$fabric_id}");
    }

}