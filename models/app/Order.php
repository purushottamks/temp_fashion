<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Order
{
    protected $db;
    private $pagination;
    private $user;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->pagination = new Pagination();
        $this->user = new User();
    }

    public function addOrder($user_id){
        $order_object = json_encode($_SESSION['cart']);
        $query_string = "INSERT INTO orders (`order_object`, `order_status`,  `user_id`)
                         VALUES('{$order_object}', 1, {$user_id})";

        if($this->db->query($query_string)){
           unset($_SESSION['cart']);
           return $this->db->inserted_id();
        }
        return false;
    }


    public function allOrders(){
        $query = "SELECT * FROM orders";
        $run_query = $this->db->query($query);
        $orders = '';
        if($this->db->num_rows($run_query) > 0){
            $fetch_query = $this->db->fetch($run_query);
            do{
                $orders.='<tr>
                            <td>'.$fetch_query['id'].'</td>
                            <td>'.$this->user->user_info($fetch_query['user_id'], 'first_name').' '.$this->user->user_info($fetch_query['user_id'], 'last_name').'</td>
                            <td>'.$this->user->user_info($fetch_query['user_id'], 'email').'</td>
                            <td>'.$fetch_query['date_time'].'</td>
                            <td>
                            <a href="'.BASE_URL.'orderDetail/'.$fetch_query['id'].'">
                               <button class="btn btn-primary">Detail</button>
                            </a></td>
                          </tr>';
            }while($fetch_query = $this->db->fetch($run_query));
          return $orders;
        }
    }


    public function getOrder($id){
        $query_string = "SELECT * FROM orders WHERE id = {$id} ";
        if($fetch = $this->db->fetch_direct($query_string)){
            return $fetch;
        }
        return false;
    }

}///end class

