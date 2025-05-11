<?php
//////pagination implementation/////
/*$pagination = new pagination();
$table = 'tickets'; /// table from which data is to be retrieve
$page_url = 'all_tickets.php'; //// current page url for reloading
$per_page = 2;  ////per page records
$page = $_GET['page'];  //// current_page
if(!isset($_GET['page'])){ /// if not set current page set to 0 as default
    $page = 0;
}

if ($page == '' || $page == 1) { /// setting for 1st page
    $page_from = 0;
} else {
    $page_from = ($page * $per_page) - $per_page; /// algorithem of pagination
}*/
//////pagination/////


/**
 * Created by PhpStorm.
 * User: yasir
 * Date: 12/10/2015
 * Time: 1:21 AM
 */
class Pagination
{
    protected $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }

    public function paginate_table($table, $per_page, $offset, $url, $where = '')
    {
        ///// pagination links start from here /////
        $query = "SELECT COUNT(*) as total_records FROM " . $table . " " . $where;
        $total_query = $this->db->query($query);
        $total_run = $this->db->fetch($total_query);
        $total_btn = $total_run['total_records']; /// return total records in table
        $pagination = ceil($total_btn / $per_page); ///ciel the number to next whole number
        $page_series = ''; //// make index of controllers at bottom


        if (isset($_GET['param1'])) {
            $page = $_GET['param1'];
        } else {
            $page = 1;
        }


        if ($page <= 3) {
            $i = 1;
        } else {
            $i = $page - 2;
        }

        if ($pagination > $page + 2) {
            $pagination = $page + 2;
        }

        while ($i <= $pagination) {
            if ($i == $page) {
                $active_page = 'active';
            } else {
                $active_page = '';
            }
            $page_series .= '<li class="' . $active_page . '"><a href="' . $url . $i . '">' . $i . '</a></li>';
            $i++;
        }


        $pre = $page - 1;
        if ($pre <= 1) {
            $pre = 1;
        }

        $next = $page + 1;
        if ($next >= $pagination) {
            $next = $pagination;
        }

        $pagination_ready = '<li><a href="' . $url . $pre . '" aria-label="Previous"><span aria-hidden="true"><i class="fa fa-long-arrow-left"></i> Previous Page</span></a></li>';
        $pagination_ready .= $page_series;
        $pagination_ready .= '<li><a href="' . $url . $next . '" aria-label="Previous"><span aria-hidden="true">Next Page <i class="fa fa-long-arrow-right"></i></span></a></li>';
        ///return $pagination_ready;
        ///// pagination links ends here /////

        $qry_string = "SELECT * FROM " . $table . " " . $where ." ". "ORDER BY `id` DESC LIMIT {$per_page} OFFSET {$offset} ";
        $query_rows = $this->db->query($qry_string);
        $rows_data = array();
        if($this->db->num_rows($query_rows) > 0){
            $fetch_rows = $this->db->fetch($query_rows);
            do{
                $rows_data[]= $fetch_rows;
            }while($fetch_rows = $this->db->fetch($query_rows));

        }

        return array($rows_data, $pagination_ready);
    }


    public function paginate_table_frontdesk($table, $page, $per_page, $url, $params, $where = '')
    {
        ///// pagination links start from here /////
        $query = "SELECT COUNT(*) as total_records FROM " . $table . " " . $where;
        $total_query = $this->db->query($query);
        $total_run = $this->db->fetch($total_query);
        $total_btn = $total_run['total_records']; /// return total records in table
        $pagination = ceil($total_btn / $per_page); ///ciel the number to next whole number
        $page_series = ''; //// make index of controllers at bottom

        if ($page <= 3) {
            $i = 1;
        } else {
            $i = $page - 2;
        }

        if ($pagination > $page + 2) {
            $pagination = $page + 2;
        }

        while ($i <= $pagination) {
            if ($i == $page) {
                $active_page = 'active';
            } else {
                $active_page = '';
            }
            $page_series .= '<li class="' . $active_page . '">';
            if($i == $page){
                $page_series .=  $i ;
            }else{
                $page_series .= '<a href="' . $url .$params['category'].'/'. $i . '">' . $i . '</a>';
            }
            $page_series .= '</li>';
            $i++;
        }


        $pre = $page - 1;
        if ($pre <= 1) {
            $pre = 1;
        }

        $next = $page + 1;
        if ($next >= $pagination) {
            $next = $pagination;
        }

        $pagination_ready = '<li><a href="' . $url .$params['category'].'/'. $pre . '" ><i class="fa fa-chevron-left"></i></a></li>';
        $pagination_ready .= $page_series;
        $pagination_ready .= '<li><a href="' . $url .$params['category'].'/'. $next . '" ><i class="fa fa-chevron-right"></i></a></li>';
        ///return $pagination_ready;
        ///// pagination links ends here /////


        $offset = ($page*$per_page)-$per_page;
        $qry_string = "SELECT * FROM " . $table . " " . $where ." ". "ORDER BY `id` DESC LIMIT {$per_page} OFFSET {$offset} ";
        $query_rows = $this->db->query($qry_string);
        $rows_data = array();
        if($this->db->num_rows($query_rows) > 0){
            $fetch_rows = $this->db->fetch($query_rows);
            do{
                $rows_data[]= $fetch_rows;
            }while($fetch_rows = $this->db->fetch($query_rows));

        }

        return array($rows_data, $pagination_ready);
    }

    public function get_pagination($table, $per_page, $url, $where = '')
    {
        $query = "SELECT COUNT(*) as total_records FROM " . $table . " " . $where;
        $total_query = $this->db->query($query);
        $total_run = $this->db->fetch($total_query);
        $total_btn = $total_run['total_records']; /// return total records in table
        $pagination = ceil($total_btn / $per_page); ///ciel the number to next whole number
        $page_series = ''; //// make index of controllers at bottom


        if (isset($_GET['page'])) {
            $page = $_GET['page'];
        } else {
            $page = 1;
        }


        if ($page <= 3) {
            $i = 1;
        } else {
            $i = $page - 2;
        }

        if ($pagination > $page + 2) {
            $pagination = $page + 2;
        }

        while ($i <= $pagination) {
            if ($i == $page) {
                $active_page = 'active';
            } else {
                $active_page = '';
            }
            $page_series .= '<li class="' . $active_page . '"><a href="' . $url . 'page=' . $i . '">' . $i . '</a></li>';
            $i++;
        }


        $pre = $page - 1;
        if ($pre <= 1) {
            $pre = 1;
        }

        $next = $page + 1;
        if ($next >= $pagination) {
            $next = $pagination;
        }

        $pagination_ready = '<li><a href="' . $url . 'page=' . $pre . '" aria-label="Previous"><span aria-hidden="true"><i class="fa fa-long-arrow-left"></i> Previous Page</span></a></li>';
        $pagination_ready .= $page_series;
        $pagination_ready .= '<li><a href="' . $url . 'page=' . $next . '" aria-label="Previous"><span aria-hidden="true">Next Page <i class="fa fa-long-arrow-right"></i></span></a></li>';
        return $pagination_ready;
    }

    public function get_pagination_ajax($table, $per_page, $url, $where = '')
    {
        $query = "SELECT COUNT(*) as total_records FROM " . $table . " " . $where;
        $total_query = $this->db->query($query);
        $total_run = $this->db->fetch($total_query);
        $total_btn = $total_run['total_records']; /// return total records in table
        $pagination = ceil($total_btn / $per_page); ///ciel the number to next whole number
        $page_series = ''; //// make index of controllers at bottom

        if(isset($_POST['search_filter'])){
            $search_filter = $_POST['search_filter'];
        }else{
            $search_filter = '';
        }



        if (isset($_REQUEST['page'])) {
            $page = $_REQUEST['page'];
        } else {
            $page = 1;
        }


        if ($page <= 3) {
            $i = 1;
        } else {
            $i = $page - 2;
        }

        if ($pagination > $page + 2) {
            $pagination = $page + 2;
        }

        while ($i <= $pagination) {
            if ($i == $page) {
                $active_page = 'active';
            } else {
                $active_page = '';
            }

            if($search_filter == 'all'){
                $page_series .= '<li class="' . $active_page . '"><a onclick="view_orders(' . $i . ',\''.$search_filter.'\')">' . $i . '</a></li>';
            }else{
                $page_series .= '<li class="' . $active_page . '"><a onclick="view_orders(' . $i . ','.$search_filter.')">' . $i . '</a></li>';
            }

            $i++;
        }


        $pre = $page - 1;
        if ($pre <= 1) {
            $pre = 1;
        }

        $next = $page + 1;
        if ($next >= $pagination) {
            $next = $pagination;
        }
        if($search_filter == 'all'){
            $pagination_ready = '<li><a javascript:void(0); onclick="view_orders(' . $pre . ',\''.$search_filter.'\')" aria-label="Previous"><span aria-hidden="true"><i class="fa fa-long-arrow-left"></i> Previous Page</span></a></li>';
        }else{
            $pagination_ready = '<li><a javascript:void(0); onclick="view_orders(' . $pre . ','.$search_filter.')" aria-label="Previous"><span aria-hidden="true"><i class="fa fa-long-arrow-left"></i> Previous Page</span></a></li>';
        }
        $pagination_ready .= $page_series;
        if($search_filter == 'all'){
            $pagination_ready .= '<li><a javascript:void(0); onclick="view_orders(' . $next . ',\''.$search_filter.'\')" aria-label="Previous"><span aria-hidden="true">Next Page <i class="fa fa-long-arrow-right"></i></span></a></li>';
        }else{
            $pagination_ready .= '<li><a javascript:void(0); onclick="view_orders(' . $next . ','.$search_filter.')" aria-label="Previous"><span aria-hidden="true">Next Page <i class="fa fa-long-arrow-right"></i></span></a></li>';
        }
        return $pagination_ready;
    }


}///end class