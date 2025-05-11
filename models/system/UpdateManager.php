<?php

/**
 * Created by PhpStorm.
 * User: yasir
 * Date: 1/15/2017
 * Time: 11:49 PM
 */
class UpdateManager
{

    protected $db;
    protected $curl;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->curl = new Curl();
    }


    public function getUpdateDetails($version){
        $url = "http://dev.ranksol.com/invicta_update/update.php?ver=".$version;
        $response = $this->curl->curl_get($url);
        return $response;
    }


}