<?php
include_once(BASE_DIR.DIRECTORY_SEPARATOR.'connection.php');

class Database {
    private $_connection;
    private static $_instance; //The single instance

    /*
    Get an instance of the Database
    @return Instance
    */
    public static function getInstance() {
        if(!self::$_instance) { // If no instance then make one
            self::$_instance = new self();
        }
        return self::$_instance;
    }
    // Constructor
    private function __construct() {
        $this->_connection = mysqli_connect(DB_SERVER, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
        // Error handling

        if(!$this->_connection){
            echo "Error: Unable to connect to MySQL." . PHP_EOL;
            echo "Debugging errno: " . mysqli_connect_errno() . PHP_EOL;
            echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
            exit;
        }

        if(mysqli_connect_error()) {
            trigger_error("Failed to conencto to MySQL: " . mysqli_connect_error(),
                E_USER_ERROR);
        }
    }
    // Magic method clone is empty to prevent duplication of connection
    private function __clone() { }
    // Get mysqli connection
    public function getConnection() {
        return $this->_connection;
    }


    public function prepare_query($table, $params){
        if(is_array($params)){
            $query = "INSERT INTO '{$table}' ";
            $keys = '';
            $values = '';
            foreach ($params as $key=>$value){
                if(!empty($value)){
                    $keys.="`{$key}` ,";
                    if(is_numeric($value)){
                        $values.="{$value} ,";
                    }else{
                        $values.="'{$value}' ,";
                    }
                }
            }
            rtrim($keys,",");
            rtrim($values,",");
            return $query.'('.$keys.')VALUES('.$values.')';
        }else{
            exit('Insert function expects an array');
        }
        return false;
    }

    public function update_query($params){

    }


    public function query($query)
    {
        return mysqli_query($this->getConnection(), $query);
    }

    public function fetch($query_data)
    {
        return mysqli_fetch_assoc($query_data);
    }

    public function fetch_direct($query)
    {
        return $this->fetch($this->query($query));
    }


    public function num_rows($query)
    {
        return mysqli_num_rows($query);
    }


    function parse_for_db($value){
        mysqli_real_escape_string($this->getConnection(), $value);
    }


    public function fetch_table($table, $where=false){
        $data = array();
        if($where == false){
            $query = "SELECT * FROM {$table}";
        }else{
            $query = "SELECT * FROM {$table} $where";
        }

        $run_query = $this->query($query);

        if($this->num_rows($run_query) > 0){
            $fetch_query = $this->fetch($run_query);
            do{
                $data[] = $fetch_query;
            }while($fetch_query = $this->fetch($run_query));
        }
        return $data;
    }


    public function inserted_id()
    {
        return mysqli_insert_id($this->getConnection());
    }


    public function fetch_by_field($field, $table, $where, $print_query = false)
    {
        $query = "SELECT `{$field}` FROM `{$table}` WHERE $where";
        if($print_query){
            echo $query;
        }
        $row = $this->fetch_direct($query);
        return $row[$field];
    }




    public function update($table, $values, $where, $print_query=false){
        $fields = '';
        foreach($values as $key => $value){
            $fields.= ' '.$key.'="'.$value.'",';
        }
        $fields = rtrim($fields, ',');
        $query = "UPDATE {$table} SET ".$fields." WHERE {$where} ";

        if($print_query){
            echo $query;
        }

        if($this->query($query)){
            return true;
        }else{
            return false;
        }
    }


    public function update_bulk($table, $where_col, $where_condition,  $values){
        foreach($values as $key => $value){
            $fields = $key.'="'.$value.'",';
        }
        $fields = rtrim($fields, ',');
        $query = "UPDATE {$table} SET ".$fields." WHERE ".$where_col." IN($where_condition)";

        if($this->query($query)){
            return true;
        }else{
            return false;
        }
    }

    public function count_records($table, $field ,$where){
        $query = "SELECT COUNT(".$field.") AS total_records FROM {$table} WHERE {$where}";
        $run_query = $this->query($query);
        $fetch_query = $this->fetch($run_query);
        return $fetch_query['total_records'];
    }


    public function delete($table, $where){
        $query = "DELETE FROM `{$table}` WHERE {$where}";
        if($this->query($query)){
            return true;
        }else{
            return false;
        }
    }


}//// end class
