<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class FileGenerator
{
    protected $db;
    private $security;
    private $image;
    private $calendar;

    public function __construct()
    {
        $this->db = new Database();
        $this->security = new Security();
        $this->image = new Image();
        $this->calendar = new Calendar();
    }

    public function order_csv(){
        // output headers so that the file is downloaded rather than displayed
        header('Content-Type: text/csv; charset=utf-8');
        header('Content-Disposition: attachment; filename=data.csv');

        // create a file pointer connected to the output stream
        $output = fopen('php://output', 'w');

        // output the column headings
        fputcsv($output, array('Column 1', 'Column 2', 'Column 3'));

        die();
        // fetch the data
        $query = "SELECT field1,field2,field3 FROM table";
        $run_query = $this->db->query($query);

        if($this->db->num_rows($run_query) > 0){
            $fetch_query = $this->db->fetch($run_query);
            do{
                fputcsv($output, $fetch_query);
            }while($fetch_query = $this->db->fetch($run_query));
        }
    }


}///end class