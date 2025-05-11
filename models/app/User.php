<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class User
{
    protected $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }


    public function register()
    {
        $security = new Security();
        $time = strtotime(date("Y-m-d H:i:s"));
        $date_time = date("Y-m-d H:i:s");
        $email = $security->post('email');
        if ($security->is_exist('users', 'email', $email)) {
            $info = '<div class="alert alert-warning">User already exists with this email id.</div>';
        } else {
            $password = $security->password('password');
            $first_name = $security->post('first_name');
            $last_name = $security->post('last_name');

            $query = "INSERT INTO `users`(`first_name`, `last_name`, `email`, `password`,`joining_date`, `birth_date`, `role_id`, `activation_status`)
                                  VALUES ('{$first_name}', '{$last_name}', '{$email}', '{$password}', '{$date_time}', '{$date_time}', 1, 'active')";
            if ($this->db->query($query)) {
                $info = "<div class='alert alert-success'>User Successfully Registered!</div>";
            } else {
                $info = "<div class='alert alert-danger'>Oops an error occured please try later</div>";
            }
        }
        return $info;
    }

    public function registerCustomer($data)
    {
        $security = new Security();
        $email = $data['email'];

        if ($security->is_exist('users', 'email', $email)) {
             return $this->db->fetch_by_field('id', 'users', " email = '{$email}'");
        } else {
            $query = "INSERT INTO `users` (`first_name`, `last_name`, `email`, `role_id`, `activation_status`, `block_status`, `country`, `company`, `address`, `house`, `city`, `postcode`, `phone`) 
                      VALUES ('{$data['first_name']}', '{$data['last_name']}', '{$data['email']}', 2, 'deactive', 'unblocked', '{$data['country']}', '{$data['company']}', '{$data['address']}', '{$data['house']}', '{$data['city']}', '{$data['postcode']}', '{$data['phone']}')";
            if ($this->db->query($query)) {
                return $this->db->inserted_id();
            } else {
                return "qry_error";
            }
        }
        return "wrong";
    }

    public function activation_link($link, $user_id)
    {
        $time = strtotime(date("Y-m-d H:i:s"));
        $details = base64_encode($time . "-|-" . $user_id);
        $link = $link . $details;
        return $link;
    }


    public function activate_usre($link)
    {
        $link = base64_decode($link);
        $arr = explode('-|-', $link);
        $user_id = $arr[1];
        $link_time = $arr[0];
        $current_time = strtotime(date('Y-m-d H:i:s'));
        $link_time = $link_time + (6 * 3600);

        if ($link_time > $current_time) {
            $query = "UPDATE users SET status = 1 WHERE user_id = '{$user_id}'";

            if($this->db->query($query)){
                return 'activate';
            }else{
                return 'server_error';
            }


        } else {
            return 'expired';
        }

    }


    public function login()
    {
        $security = new Security();
        $email = $security->post('email');
        $password = $security->password('password');
        $query = "SELECT * FROM users WHERE email='{$email}' AND password='{$password}'";
        $run_query = $this->db->query($query);
        $info = '';

        if ($this->db->num_rows($run_query) < 1) {
            $info = '<div class="alert alert-danger">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true"><i class="icon-cross"></i></button>
                    <span class="vd_alert-icon"><i class="fa fa-exclamation-circle vd_red"></i></span><strong>Oh snap!</strong> Username or password is incorrect. </div>';
        } else {
            $fetch_query = $this->db->fetch($run_query);
            if ($fetch_query['activation_status'] == 'deactive') {
                $info = '<div class="alert alert-warning"> Please visit the activation link to verify your accoutnt. </div>';
            } else {

                if ($fetch_query['block_status'] == 'blocked') {
                    $info = '<div class="alert alert-warning"> Your account is blocked please contact Ranksol team as soon as possible . </div>';
                } else {
                    $_SESSION['user_id'] = $fetch_query['id'];
                    $user_role = new UserRole();

                    switch($user_role->get_user_role()){
                        case 1:
                            $_SESSION['admin']= true;
                            header('location:adminIndex');
                            break;
                        default:
                            header('login');
                    }
                }
            }
        }
        return $info;
    }





    public function user_info($user_id, $field = '')
    {
        $query = "SELECT * FROM users WHERE id = '{$user_id}'";
        $run_query = $this->db->query($query);
        $fetch_query = $this->db->fetch($run_query);

        if ($field == '') {
            return $fetch_query;
        } else {
            return $fetch_query[$field];
        }
    }

    public function loged_in()
    {
        if (isset($_SESSION['user_id'])) {
            return true;
        } else {
            return false;
        }
    }


    public function is_admin()
    {
        if (session_id() == '') {
            session_start();
        }
        if (isset($_SESSION['user_id']) && isset($_SESSION['admin_ok'])) {
            return true;
        } else {
            return false;
        }
    }


    public function is_editor()
    {
        if (session_id() == '') {
            session_start();
        }
        if (isset($_SESSION['user_id']) && isset($_SESSION['editor'])) {
            return true;
        } else {
            return false;
        }
    }


    public function loged_in_user_id()
    {
        if (isset($_SESSION['user_id'])) {
            return $_SESSION['user_id'];
        } else {
            false;
        }

    }


    public function users_by_category($category)
    {
        $query = "SELECT * FROM users WHERE depart = '{$category}'";
        $run_query = $this->db->query($query);
        $fetch_query = $this->db->fetch($run_query);
        $data = '';
        if ($this->db->num_rows($run_query) > 0) {

            do {
                $data .= '<option value="' . $fetch_query['user_id'] . '"> ' . $fetch_query['user_name'] . ' </option>';
            } while ($fetch_query = $this->db->fetch($run_query));
        }
        return $data;
    }


    public function all_users($start, $end)
    {
        $query = "SELECT * FROM users";
        $run_query = $this->db->query($query);
        $fetch_query = $this->db->fetch($run_query);
        $data = '';
        $index = 0;
        if ($this->db->num_rows($run_query) > 0) {

            do {
                $index++;
                $data .= '<tr id="row_'.$fetch_query['user_id'].'">
                            <td>' . $index . '</td>
                            <td>' . $fetch_query['user_name'] . '</td>
                            <td>' . $fetch_query['email'] . '</td>
                            <td>' . $fetch_query['phone'] . '</td>
                            <td>' . $this->user_status($fetch_query['status']) . '</td>
                            <td class="menu-action">';
                if ($fetch_query['blocked'] == 0) {
                    $data .= '<a data-original-title="Block" onclick="block_user(' . $fetch_query['user_id'] . ')" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-yellow vd_yellow" title="Block"> <i class="fa fa-ban"></i> </a>';
                } else {
                    $data .= '<a data-original-title="Unblock" onclick="unblock_user(' . $fetch_query['user_id'] . ')" data-toggle="tooltip" data-placement="top" class="btn menu-icon vd_bd-red vd_red" title="Unblock"> <i class="fa fa-ban"></i> </a>';
                }

                $data .= '<a data-original-title="Add To Depart" data-placement="top" class="btn menu-icon vd_bd-green vd_green" title="Add To Depart" onclick="set_id(' . $fetch_query['user_id'] . ')"> <i class="fa fa-list"></i> </a>
                          <a data-original-title="Delete" data-placement="top" class="btn menu-icon vd_bd-red vd_red" title="Delete" onclick="delete_user(' . $fetch_query['user_id'] . ')"> <i class="fa fa-times"></i> </a>
                            </td>
                          </tr>';
            } while ($fetch_query = $this->db->fetch($run_query));
        }
        return $data;
    }


    private function user_status($status)
    {
        switch ($status) {
            case 0;
                return 'Pending';
                break;
            case 1;
                return 'Active';
                break;
        }
    }

    public function block_user($user_id)
    {
        $query = "UPDATE users SET blocked = 1 WHERE user_id = '{$user_id}'";
        $run_query = $this->db->query($query);
        if ($run_query) {
            return 'User Blocked Successfully';
        } else {
            return 'Please try later';
        }
    }


    public function unblock_user($user_id)
    {
        $query = "UPDATE users SET blocked = 0 WHERE user_id = '{$user_id}' ";
        $run_query = $this->db->query($query);
        if ($run_query) {
            return 'User Unblocked Successfully';
        } else {
            return 'Please try later';
        }
    }


    public function add_to_editorial()
    {
        $department = $_POST['department'];
        $user_id = $_POST['user_id'];
        $query = "UPDATE users SET depart = '{$department}' , user_type = 1 WHERE user_id = '{$user_id}' ";
        $run_query = $this->db->query($query);
        if ($run_query) {
            return 'Added To Editorial';
        } else {
            return 'Please try later';
        }
    }


    public function delete_user($user_id)
    {
        $query = "DELETE FROM users WHERE id = {$user_id}";
        if ($this->db->query($query)) {
            $data = 'User successfully deleted';
        } else {
            $data = 'Error plrease try later';
        }
        return $data;
    }


    public function forget_password($email){
        if($this->db->count_records('users', 'email', $email) > 0)
        {
            //$body = 'An email; has been sent to you please check your mail';

            $selectu = "SELECT * FROM users WHERE `email`='{$email}'";
            $run_query = $this->db->query($selectu);
            $fetch_query = $this->db->fetch($run_query);
            $user_level = $fetch_query['level'];
            $select_status = "SELECT * FROM user_levels WHERE id ={$user_level}";
            $run_query = $this->db->query($select_status);
            $fetch_query = $this->db->fetch($run_query);
            if ($fetch_query['title'] == 'super admin') {
                return 'You do not use this service';
            }else{
                $token = $email.'_'.strtotime(date("d-m-Y h:i:sa"));
                $token = base64_encode($token);
                $query = "UPDATE users SET reset_password_key = '{$token}' WHERE email = '{$email}'";
                if($this->db->query($query)){
                    $body = 'Your reset password form has been sent to your email<br>';
                    $body .= "https://".$_SERVER['HTTP_HOST']."/app/forget_password?token=$token";
                    $send_mail = mail($email, 'Reset password', $body);
                    if($send_mail){
                        return 'Send email on your email ID. Please check your email and reset password';
                    }else{
                        return "Mail sending error";
                    }
                }else{
                    return 'server_error';
                }
            }
        }else{
            return 'Email id is not found please register first.';
        }
    }

    public function reset_password($email, $password){
        $query = "UPDATE users SET password = '{$password}' WHERE email = '{$email}'";
        $run_query = $this->db->query($query);
        if($run_query){
            return 'Password Has been reset';
        }else{
            return "Password reset error";
        }
    }

    public function save_box_logo($store){
        $box = new Imagick('uploads/box.jpg');
        $logo_image = new Imagick($_FILES['logo_image']['tmp_name']);
        $logo_image->resizeImage(430,58, Imagick::FILTER_LANCZOS,1);
        $box->compositeImage($logo_image, Imagick::COMPOSITE_DEFAULT, 140,658);
        $shop_box_image = 'uploads/store_images/box'.rand(1000,9999).time().'.jpg';
        $box->writeImage($shop_box_image);
        $old_image = $this->db->fetch_by_field('box_image','tbl_usersettings','store_name',$store);
        if(!empty($old_image)){
            unlink($old_image);
        }
        
        ///echo $shop_box_image;       
        ///$is_saved = $this->db->update('tbl_usersettings','store_name', $store, array('box_image'=>$shop_box_image));
        $query_string = "UPDATE tbl_usersettings SET box_image = '{$shop_box_image}' WHERE store_name = '{$store}' ";
        $is_saved = $this->db->query($query_string);
         
        if($is_saved){
            return 'logo saved';
        }else{
            return 'Error Saving Logo';
        }
    }

    public function shop_box($store){
        return $this->db->fetch_by_field('box_image','tbl_usersettings','store_name',$store);
    }

    public function check_reset_key($email)
    {
        $query = "SELECT * FROM users WHERE `email`='{$email}'";
        $run_query = $this->db->query($query);
        $fetch_query = $this->db->fetch($run_query);
        $reset_key = $fetch_query['reset_key_status'];
        return $reset_key;
    }

    public function is_free($store){
        return $this->db->fetch_by_field('is_free','tbl_usersettings','store_name',$store);
    }

}///end class

