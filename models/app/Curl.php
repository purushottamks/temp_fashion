<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Curl
{

    public function __construct()
    {
        ///
    }

    public function curl_get($url){
        $session = curl_init();
        curl_setopt($session, CURLOPT_URL, $url);
        curl_setopt($session, CURLOPT_HTTPGET, 1);
        curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($session, CURLOPT_SSL_VERIFYPEER, false);
        $data =  curl_exec($session);
        curl_close($session);
        return $data;
    }


    public function curl_post($url, $post_fields = 'null'){
        $session = curl_init();
        curl_setopt($session, CURLOPT_URL, $url);
        curl_setopt($session, CURLOPT_POST, 1);
        curl_setopt($session, CURLOPT_HEADER, false);
        curl_setopt($session, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
        if($post_fields != 'null'){
            curl_setopt($session, CURLOPT_POSTFIELDS, $post_fields);
        }
        curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
        if(@ereg("^(https)",$url)) curl_setopt($session,CURLOPT_SSL_VERIFYPEER,false);
        $data = curl_exec($session);
        curl_close($session);
        return $data;
    }



    public function curl_put($url, $post_fields)
    {
        $session = curl_init();
        curl_setopt($session, CURLOPT_URL, $url);
        curl_setopt($session, CURLOPT_CUSTOMREQUEST, "PUT");
        curl_setopt($session, CURLOPT_HEADER, false);
        curl_setopt($session, CURLOPT_HTTPHEADER, array('Accept: application/json', 'Content-Type: application/json'));
        curl_setopt($session, CURLOPT_POSTFIELDS, $post_fields);
        curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
        if (@ereg("^(https)", $url)) curl_setopt($session, CURLOPT_SSL_VERIFYPEER, false);
        $data = curl_exec($session);
        curl_close($session);
        return $data;
    }


}///end class