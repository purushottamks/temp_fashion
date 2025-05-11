<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Email
{
    protected $db;
    private $security;
    private $calendar;
    public $assigned_vars=array();
    private $email_html;

    public function __construct()
    {
        $this->db = Database::getInstance();
        $this->security = new Security();
        $this->calendar = new Calendar();
        $this->notification = new Notification();
    }

    public function set($key, $value) {
        $this->assigned_vars[$key] = $value;
    }

    public function email_html($template) {
            $output = $this->get_template($template);
            foreach($this->assigned_vars as $key => $value) {
                $output = preg_replace('/{{'.$key.'}}/', $value, $output);
            }
            $this->email_html =  $output;
    }

    public function mail_to($to, $subject)
    {
        $headers = "MIME-Version: 1.0\r\n";
        $headers .= "Content-Type: text/html; charset=ISO-8859-1\r\n";
        if(mail($to, $subject, $this->email_html, $headers)){
            return true;
        }else{
            return false;
        }
    }

    public function get_template($template){
         return $this->db->fetch_by_field($template, 'email_templates', 'id', 1);
    }

     public function set_templates(){
         $fulfillment_template = $this->security->post('fulfillment_template');
         $query = "UPDATE email_templates SET fulfillment_template = '{$fulfillment_template}' WHERE id = 1 ";
         if($this->db->query($query)){
             return $this->notification->success('Template Saves Successfully');
         }else{
             return $this->notification->danger('Not Successfull Please Try later');
         }
     }






}///end class