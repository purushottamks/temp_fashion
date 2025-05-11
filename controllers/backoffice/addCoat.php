<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

/** instances of models **/
$includes = new Includes();
$user = new User();
$userRole = new UserRole();
$security = new Security();
$fabric = new Fabric();
$image = new Image();
$db = Database::getInstance();
$notification = new Notification();
$coat = new Coat();
$info = '';

$fabric_id =  $_GET['param1'];
$fabric_name = $fabric->fabricName($fabric_id);

if(!$user->loged_in()){
    header('location:addLogin');
}

if(!$userRole->can_access(array(1))){
    header('location:addLogin');
}


if(isset($_POST['ajax']) && $_POST['ajax'] == 1){

    if(isset($_POST['action']) && $_POST['action']=='delete_component'){
        $id = $security->post('component_id');
        if($db->delete('coat_components', " id = {$id}")){
            echo 'deleted';
        }else{
            echo 'error';
        }
    }

    die();
}



if(isset($_POST['coat_base'])){

    $params = array();
    $img_path = $image->upload_image('coat_base_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $type = $security->post('type');
    $price = $security->post('coat_base_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('coat_base_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `button_style`, `price`) 
                               VALUES ({$fabric_id}, 1, 1, '{$image1}', '{$thumbnail1}', 'front', '{$type}', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `button_style`, `price`) 
                               VALUES ({$fabric_id}, 1, 2, '{$image2}', '{$thumbnail2}', 'front', '{$type}', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }


}

if(isset($_POST['coat_back'])){
    $params = array();
    $img_path = $image->upload_image('coat_back_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $price = $security->post('coat_back_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('coat_back_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 2, 1, '{$image1}', '{$thumbnail1}', 'back', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 2, 2, '{$image2}', '{$thumbnail2}', 'back, '{$price}'')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }


}

if(isset($_POST['trouser_front'])){
    $params = array();
    $img_path = $image->upload_image('trouser_front_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $trousers_style = $security->post('trousers_style');
    $price = $security->post('trouser_front_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('trouser_front_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `trousers_style`, `price`) 
                               VALUES ({$fabric_id}, 8, 1, '{$image1}', '{$thumbnail1}', 'front', '{$trousers_style}', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `trousers_style`, `price`) 
                               VALUES ({$fabric_id}, 8, 2, '{$image2}', '{$thumbnail2}', 'front', '{$trousers_style}', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }


}

if(isset($_POST['trouser_back'])){
    $params = array();
    $img_path = $image->upload_image('trouser_back_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $price = $security->post('trouser_back_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('trouser_back_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 9, 1, '{$image1}', '{$thumbnail1}', 'back', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 9, 2, '{$image2}', '{$thumbnail2}', 'back', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }


}

if(isset($_POST['submit_trouser_pleats'])){
    $params = array();
    $img_path = $image->upload_image('trouser_pleats_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $trouser_pleats = $security->post('trouser_pleats');
    $price = $security->post('trouser_pleat_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('trouser_pleats_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `trousers_pleats`, `price`) 
                               VALUES ({$fabric_id}, 13, 1, '{$image1}', '{$thumbnail1}', 'front', '{$trouser_pleats}', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `trousers_pleats`, `price`) 
                               VALUES ({$fabric_id}, 13, 2, '{$image2}', '{$thumbnail2}', 'front', '{$trouser_pleats}', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }
}

if(isset($_POST['submit_belt_loops'])){
    $params = array();
    $img_path = $image->upload_image('belt_loops_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $belt_loop_side = $security->post('belt_loop_side');
    $price = $security->post('belt_loop_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('belt_loops_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 14, 1, '{$image1}', '{$thumbnail1}', '{$belt_loop_side}', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 14, 2, '{$image2}', '{$thumbnail2}', '{$belt_loop_side}', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }
}

if(isset($_POST['coat_lapels'])){

    $params = array();
    $img_path = $image->upload_image('coat_lapels_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $buttonType = $security->post('buttonType');
    $lapelType = $security->post('lapelType');
    $lapelWidth = $security->post('lapelWidth');
    $price = $security->post('coat_lapel_price');

    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('coat_lapels_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];

        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `button_style`, `lapel_style`, `lapel_width`, `price`) 
                               VALUES ({$fabric_id}, 3, 1, '{$image1}', '{$thumbnail1}', 'front', '{$buttonType}', '{$lapelType}', '{$lapelWidth}', '{$price}')");

        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `button_style`, `lapel_style`, `lapel_width`, `price`) 
                               VALUES ({$fabric_id}, 3, 2, '{$image2}', '{$thumbnail2}', 'front', '{$buttonType}', '{$lapelType}', '{$lapelWidth}', '{$price}')");

        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }

}

if(isset($_POST['back_coller'])){
    $params = array();
    $img_path = $image->upload_image('back_coller_slim_fit', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $price = $security->post('back_coller_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('back_coller_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 4, 1, '{$image1}', '{$thumbnail1}', 'back', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 4, 1, '{$image2}', '{$thumbnail2}', 'back', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }


}

if(isset($_POST['pockets'])){
    $params = array();
    $img_path = $image->upload_image('pocket_image_slim_fit', 'pocketImages');
    $fabric_id = $security->post('fabric_id');
    $price = $security->post('pockets_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('back_coller_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 4, 1, '{$image1}', '{$thumbnail1}', 'front', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 4, 2, '{$image2}', '{$thumbnail2}', 'front', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }
}

if(isset($_POST['coat_buttons'])){
    $params = array();

    $img_path = $image->upload_image('button_slim', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $type = $security->post('type');
    $price = $security->post('buttons_price');

    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('button_classic', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];

         $query_string = "INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `button_style`, `side`, `price`) 
                         VALUES ({$fabric_id}, 5, 1, '{$image1}', '{$thumbnail1}' , '{$type}', 'front', '{$price}')";
        $query_1 = $db->query($query_string);

        $query_string2 = "INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `button_style`, `side`, `price`) 
                         VALUES ({$fabric_id}, 5, 2, '{$image2}', '{$thumbnail2}' , '{$type}', 'front', '{$price}')";
        $query_2 = $db->query($query_string2);

        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            echo $query_string;
            $info = $notification->danger("Error");
        }
    }
}

if(isset($_POST['waist_coat'])){
    $params = array();
    $img_path = $image->upload_image('waist_coat_slim', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $price = $security->post('waist_coat_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('waist_coat_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 10, 1, '{$image1}', '{$thumbnail1}', 'front', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 10, 2, '{$image1}', '{$thumbnail1}', 'front', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }
}

if(isset($_POST['lining'])){
    $params = array();
    $img_path = $image->upload_image('lining_slim', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $price = $security->post('lining_price');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }

    $img_path = $image->upload_image('lining_classic', 'coatImages');
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 11, 1, '{$image1}', '{$thumbnail1}', 'back', '{$price}')");
        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `side`, `price`) 
                               VALUES ({$fabric_id}, 11, 2, '{$image1}', '{$thumbnail1}', 'back', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }
}

if(isset($_POST['coat_pockets'])){
    $params = array();


    $img_path = $image->upload_image('pocket_slim', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }


    $img_path = $image->upload_image('pocket_classic', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $pocket_style = $security->post('pocket_style');
    $number_of_pockets = $security->post('number_of_pockets');
    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `pocket_style`, `number_of_pockets` ,`side`, `price`) 
                               VALUES ({$fabric_id}, 6, 1, '{$image1}', '{$thumbnail1}' , '{$pocket_style}', '{$number_of_pockets}', 'front', '{$price}')");

        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `pocket_style`, `number_of_pockets`, `side`, `price`) 
                               VALUES ({$fabric_id}, 6, 2, '{$image1}', '{$thumbnail1}' , '{$pocket_style}', '{$number_of_pockets}', 'front', '{$price}')");

        if($query_1){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }

    }
}

if(isset($_POST['coat_vents'])){
    $params = array();

    $img_path = $image->upload_image('vent_slim', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $price = $security->post('vent_price');

    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail1 =  $img_path[0];
        $image1 =  $img_path[1];
        if(true){
            $info = $notification->success('Component successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }

    $img_path = $image->upload_image('vent_classic', 'coatImages');
    $fabric_id = $security->post('fabric_id');
    $vent_style = $security->post('vent_style');

    $fitting_id = 1;
    if($img_path == 'type_error'){
        $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
        $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $thumbnail2 =  $img_path[0];
        $image2 =  $img_path[1];
        $query_1 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `vent_style`, `side`, `price`)
                               VALUES({$fabric_id}, 7, 1, '{$image1}', '{$thumbnail1}' , '{$vent_style}', 'back', '{$price}')");

        $query_2 = $db->query("INSERT INTO coat_components (`fabric_id`, `component_id`, `fitting_id`, `image`, `thumbnail`, `vent_style`, `side`, `price`)
                               VALUES({$fabric_id}, 7, 2, '{$image2}', '{$thumbnail2}' , '{$vent_style}', 'back', '{$price}')");
        if($query_1 && $query_2){
            $info = $notification->success("Component added successfully");
        }else{
            $info = $notification->danger("Error");
        }
    }
}

if(isset($_POST['submit'])){
    $params = array();
    $img_path = $image->upload_image('image', 'fabricImages');
    $params['name'] =  $security->post('name');
    $params['color_id'] =  $security->post('color');
    $params['material_id'] =  $security->post('material');
    $params['pattern_id'] =  $security->post('pattern_id');
    $params['category_id'] =  $security->post('category');
    $params['description'] =  $security->post('description');
    $params['thickness'] =  $security->post('thickness');
    $params['composition'] =  $security->post('composition');
    $params['pattern'] =  $security->post('pattern');
    if($img_path == 'type_error'){
            $info = $notification->danger('Please select a valid type of image');
    }elseif($img_path == 'dimention_error'){
            $info = $notification->danger('Please select a valid dimention of image');
    }else{
        $params['thumbnail'] =  $img_path[0];
        $params['image'] =  $img_path[1];
        if($fabric->storeFabric($params)){
            $info = $notification->success('Fabric successfully created');
        }else{
            $info = $notification->danger('Error');
        }
    }
}


/***
collection images
 **/

$base_front = $coat->coatComponents(1 ,$fabric_id);
$base_front_html = "";
foreach($base_front as $item){
    $base_front_html.='<div class="col-md-3 bordered">
                            <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                            <div>
                              <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.str_replace('_', ' ',$item['button_style']).' '.$item['price'].'</span>
                            </div>
                       </div>';
}

$base_back = $coat->coatComponents(2 ,$fabric_id);
$base_back_html = "";
foreach($base_back as $item){
    $base_back_html.='<div class="col-md-3 bordered">
                           <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                           <div>
                              <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['price'].'</span>
                            </div>
                      </div>';
}

$lapels = $coat->coatComponents(3 ,$fabric_id);
$lapels_html = "";
foreach($lapels as $item){
    $lapels_html.='<div class="col-md-3 bordered">
                       <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                       <div>
                           <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                           <span>
                           '.$coat->fitting_title($item['fitting_id']).
                           ', '.$item['side'].
                           ', '.str_replace('_', ' ', $item['button_style']).
                           ', '.$item['lapel_style'].
                           ', '.$item['lapel_width'].
                           ', '.$item['price'].'
                           </span>
                       </div>
                   </div>';
}

$coller = $coat->coatComponents(4 ,$fabric_id);
$coller_html = "";
foreach($coller as $item){
    $coller_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                         <div>
                            <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['price'].'</span>
                         </div>
                   </div>';
}

$button = $coat->coatComponents(5 ,$fabric_id);
$button_html = "";
foreach($button as $item){
    $button_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                       <div>
                          <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                          <span>'.str_replace('_',' ',$item['button_style']).' '.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['price'].'</span>
                       </div>
                    </div>';
}

$pockets = $coat->coatComponents(6 ,$fabric_id);
$pockets_html = "";
foreach($pockets as $item){
    $pockets_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                        <div>
                          <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['pocket_style'].' '.$item['price'].'</span>
                        </div>
                    </div>';
}

$vents = $coat->coatComponents(7 ,$fabric_id);
$vents_html = "";
foreach($vents as $item){
    $vents_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                    <div>
                       <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.str_replace('_',' ', $item['vent_style']).' '.$item['price'].'</span>
                    </div>
                  </div>';
}

$trouser_front = $coat->coatComponents(8 ,$fabric_id);
$trouser_front_html = "";
foreach($trouser_front as $item){
    $trouser_front_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                             <div>
                              <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['trousers_style'].' '.$item['price'].'</span>
                            </div>
                          </div>';
}

$trouser_back = $coat->coatComponents(9 ,$fabric_id);
$trouser_back_html = "";
foreach($trouser_back as $item){
    $trouser_back_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                             <div>
                              <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['price'].'</span>
                            </div>
                         </div>';
}


$waist_coats = $coat->coatComponents(10 ,$fabric_id);
$waist_coat_html = "";
foreach($waist_coats as $item){
    $waist_coat_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                          <div>
                              <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['price'].'</span>
                            </div>
                       </div>';
}

$lining = $coat->coatComponents(11 ,$fabric_id);
$lining_html = "";
foreach($lining as $item){
    $lining_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                      <div>
                            <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['price'].'</span>
                            </div>
                   </div>';
}

$pleats = $coat->coatComponents(13 ,$fabric_id);
$pleats_html = "";
foreach($pleats as $item){
    $pleats_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">Delete</span>
                      <div>
                            <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['trousers_pleats'].' '.$item['price'].'</span>
                            </div>
                   </div>';
}


$belt_loops = $coat->coatComponents(14 ,$fabric_id);
$belt_loops_html = "";
foreach($belt_loops as $item){
    $belt_loops_html.='<div class="col-md-3 bordered">
                        <span class="btn btn-danger btn-xs" onclick="delete_component(this,'.$item['id'].')">delete</span>
                      <div>
                            <img src="'.BASE_URL.'uploads/'.$item['image'].'" />
                              <span>'.$coat->fitting_title($item['fitting_id']).' '.$item['side'].' '.$item['price'].'</span>
                            </div>
                   </div>';
}



/** Template **/
$template = new Template();
$template->filename = 'views/backoffice/addCoat.tpl';

/** Sections **/
////$template->backoffice_section('header', 'inc');
$template->backoffice_section('scripts', 'inc');
$template->backoffice_section('js_links', 'inc');
$template->backoffice_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('title', 'INVICTA GENTLEMAN');
$template->add_snippet('info', $info);
$template->add_snippet('page_title', 'Add Coat Components');
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('sidebar', $includes->sidebar());
$template->add_snippet('fabric_id', $fabric_id);
$template->add_snippet('fabric_name', $fabric_name);
$template->add_snippet('coat_base', $base_front_html);
$template->add_snippet('coat_back', $base_back_html);
$template->add_snippet('coat_lapels', $lapels_html);
$template->add_snippet('back_coller', $coller_html);
$template->add_snippet('buttons', $button_html);
$template->add_snippet('pockets', $pockets_html);
$template->add_snippet('vents', $vents_html);
$template->add_snippet('trouser_front', $trouser_front_html);
$template->add_snippet('trouser_back', $trouser_back_html);
$template->add_snippet('waist_coat', $waist_coat_html);
$template->add_snippet('lining', $lining_html);
$template->add_snippet('pleats_html', $pleats_html);
$template->add_snippet('belt_loops', $belt_loops_html);
$template->add_snippet('header', $includes->backoffice_header());

/** Display page contents **/
echo $template->display();
