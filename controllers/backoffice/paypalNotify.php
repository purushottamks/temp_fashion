<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'/backoffice_assets/';

    /** instances of models **/
    $order = new Order();
    $db = Database::getInstance();
    $paypalResponsee = json_encode($_POST);
    $order_id = $_POST['custom'];
    mail('mailto:testing048000@gmail.com', 'paypall response', $paypalResponsee);
    $db->query("UPDATE orders SET paypalObject = '{$paypalResponsee}' WHERE id = {$order_id} ");
