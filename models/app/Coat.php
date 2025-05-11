<?php
/**
 * Created by PhpStorm.
 * User: Yasir
 * Date: 17/07/2018
 * Time: 3:07 PM
 */

class Coat
{

    private $db;
    private $pagination;
    private $security;
    private $fabric;

    public function __construct()
    {
        $this->db = Database::getInstance();
        ///$this->pagination = new Pagination();
        $this->security = new Security();
        $this->fabric = new Fabric();

    }


    public function coatComponents($component_id, $fabric_id){
        $query = "SELECT * FROM coat_components WHERE component_id = {$component_id} AND fabric_id = {$fabric_id} ";
        $run_query = $this->db->query($query);
        $components = array();
        if($this->db->num_rows($run_query) > 0){
            $fetch_query = $this->db->fetch($run_query);
           do {
                $components[] = $fetch_query;
            }while( $fetch_query = $this->db->fetch($run_query));
        }
        return $components;
    }



    public function component_class($component){
        switch($component){

            case 1:
                return 'base_front';
            break;

            case 2:
                return 'base_back';
            break;

            case 3:
                return 'lapel';
            break;

            case 4:
                return 'coller_back';
            break;

            case 5:
                return 'button';
            break;

            case 6:
                return 'pocket';
            break;

            case 7:
                return 'vent';
            break;

            case 8:
                return 'trouser_front';
            break;

            case 9:
                return 'trouser_back';
            break;

            case 10:
                return 'waist_coat';
            break;

            case 11:
                return 'lining';
            break;

            case 12:
                return 'lapel_buttonholes';
            break;

            case 13:
                return 'trousers_pleats';
            break;

            case 14:
                return 'belt_loops';
            break;

        }
    }

    public function z_index($component_id){
        $query = "SELECT z_index FROM components WHERE id = {$component_id}";
        $row = $this->db->fetch_direct($query);
        return $row['z_index'];
    }


    public function fitting_title($id){
        switch($id){
            case 1:
                return 'slim';
            case 2:
                return 'classic';
        }
    }

    public function previewCoat($coat_params){

        /// change suit start///
            $total_price = 0 ;

            $coat_params = (object) $coat_params;
            $fabric_id = $coat_params->fabric;
            $fitting = $coat_params->fit;
            $fitting_filter = $coat_params->fit == 'classic'? 2: 1;
            $button_type = $coat_params->button_type;
            $lapel_type = $coat_params->lapel_type;
            $lapel_width = $coat_params->lapel_width;
            $lapel_style = $coat_params->lapel_type;
            $lapel_fabric = $coat_params->lapelFabric;
            $selected_product = $coat_params->product;
            $total_price = $total_price+$this->fabric->fabricPrice($fabric_id);


            if(isset($coat_params->lapelButtonholes)){
                $lapel_buttonholes = $coat_params->lapelButtonholes;
            }else{
                $lapel_buttonholes = "no";
            }
            $pocketStyle = $coat_params->pocketStyle;
            $waistcoatFabric = $coat_params->waistcoatFabric;
            $trousersFabric = $coat_params->trousersFabric;
            $trousersPleats = $coat_params->trousersPleats;

            $suit = '<img class="suit_image front" style="position:absolute;" src="'.BASE_URL.'uploads/images/base_front.png" />';

            //// components

            if($selected_product == 'three_pieces' || $selected_product == 'suit'|| $selected_product == 'jacket'){
             $query_string = "SELECT * FROM coat_components 
                              WHERE (fabric_id = {$fabric_id} 
                              AND button_style = '{$button_type}' 
                              AND side = 'front' 
                              AND fitting_id = {$fitting_filter} 
                              AND (component_id NOT IN(3,6) OR component_id = 2))";


                $query = $this->db->query($query_string);
                $fetch = $this->db->fetch($query);

                do{
                    $total_price+=$fetch['price'];
                    $fitting = 'slim';
                    $side = 'front';
                    if($fetch['fitting_id'] == 2){
                        $fitting = 'classic';
                    }

                    if($fetch['side'] == 'back'){
                        $side = 'back';
                    }

                    $zindex = $this->z_index($fetch['component_id']);

                    $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$this->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'].' '.$fetch['trousers_pleats'];

                    if($fetch['lapel_style'] != 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_style'];
                    }else{
                        $suit.= ' lapel_style';
                    }

                    if($fetch['lapel_width']!= 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_width'];
                    }else{
                        $suit.= ' lapel_width';
                    }

                    if($fetch['pocket_style']!= 'empty'){
                        $suit.= ' pocket pocket_'.$fetch['pocket_style'];
                    }

                    $suit.='"';

                    $suit.='style="position:absolute; 
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
                }while($fetch = $this->db->fetch($query));




                /// lapel part
                $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$lapel_fabric} AND side = 'front'  AND button_style = '{$button_type}' AND component_id = 3 AND lapel_width = '{$lapel_width}' AND lapel_style = '{$lapel_style}'";
                $query = $this->db->query($query_string);
                $fetch = $this->db->fetch($query);

                do{
                    $total_price+=$fetch['price'];
                    $fitting = 'slim';
                    $side = 'front';
                    if($fetch['fitting_id'] == 2){
                        $fitting = 'classic';
                    }

                    if($fetch['side'] == 'back'){
                        $side = 'back';
                    }

                    $zindex = $this->z_index($fetch['component_id']);

                    $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$this->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

                    if($fetch['lapel_style'] != 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_style'];
                    }else{
                        $suit.= ' lapel_style';
                    }

                    if($fetch['lapel_width']!= 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_width'];
                    }else{
                        $suit.= ' lapel_width';
                    }

                    if($fetch['pocket_style']!= 'empty'){
                        $suit.= ' pocket pocket_'.$fetch['pocket_style'];
                    }

                    $suit.='"';

                    $suit.='style="position:absolute; 
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
                }while($fetch = $this->db->fetch($query));
                ////   lapel part end

                /// pocket part
                $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$lapel_fabric} AND side = 'front'  AND component_id = 6 AND pocket_style = '{$pocketStyle}'";
                $query = $this->db->query($query_string);
                $fetch = $this->db->fetch($query);

                do{
                    $total_price+=$fetch['price'];
                    $fitting = 'slim';
                    $side = 'front';
                    if($fetch['fitting_id'] == 2){
                        $fitting = 'classic';
                    }

                    if($fetch['side'] == 'back'){
                        $side = 'back';
                    }

                    $zindex = $this->z_index($fetch['component_id']);

                    $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$this->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

                    if($fetch['lapel_style'] != 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_style'];
                    }else{
                        $suit.= ' lapel_style';
                    }

                    if($fetch['lapel_width']!= 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_width'];
                    }else{
                        $suit.= ' lapel_width';
                    }

                    if($fetch['pocket_style']!= 'empty'){
                        $suit.= ' pocket pocket_'.$fetch['pocket_style'];
                    }

                    $suit.='"';

                    $suit.='style="position:absolute; 
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
                }while($fetch = $this->db->fetch($query));
                //// pocket part end


                if($selected_product == 'three_pieces'){


                    //// waistcoat start
                    $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$waistcoatFabric} AND side = 'front'  AND component_id IN(10,11) ";
                    $query = $this->db->query($query_string);
                    $fetch = $this->db->fetch($query);

                    do{
                        $total_price+=$fetch['price'];
                        $fitting = 'slim';
                        $side = 'front';
                        if($fetch['fitting_id'] == 2){
                            $fitting = 'classic';
                        }

                        if($fetch['side'] == 'back'){
                            $side = 'back';
                        }

                        $zindex = $this->z_index($fetch['component_id']);

                        $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$this->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

                        if($fetch['lapel_style'] != 'empty'){
                            $suit.= ' lapel_'.$fetch['lapel_style'];
                        }else{
                            $suit.= ' lapel_style';
                        }

                        if($fetch['lapel_width']!= 'empty'){
                            $suit.= ' lapel_'.$fetch['lapel_width'];
                        }else{
                            $suit.= ' lapel_width';
                        }

                        if($fetch['pocket_style']!= 'empty'){
                            $suit.= ' pocket pocket_'.$fetch['pocket_style'];
                        }

                        $suit.='"';

                        $suit.='style="position:absolute; 
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
                    }while($fetch = $this->db->fetch($query));
                    ///  waistcoat end
                }

            }

            //// trouser start
            $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$trousersFabric}  AND side = 'front' AND fitting_id = {$fitting_filter} AND component_id IN(8,9)";
            $query = $this->db->query($query_string);
            $fetch = $this->db->fetch($query);

            do{

                if($selected_product != 'jacket'){
                    $total_price+=$fetch['price'];
                }

                $fitting = 'slim';
                $side = 'front';
                if($fetch['fitting_id'] == 2){
                    $fitting = 'classic';
                }

                if($fetch['side'] == 'back'){
                    $side = 'back';
                }

                $zindex = $this->z_index($fetch['component_id']);

                $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$this->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].'  '.$fetch['trousers_style'].' '.$fetch['vent_style'];

                if($fetch['lapel_style'] != 'empty'){
                    $suit.= ' lapel_'.$fetch['lapel_style'];
                }else{
                    $suit.= ' lapel_style';
                }

                if($fetch['lapel_width']!= 'empty'){
                    $suit.= ' lapel_'.$fetch['lapel_width'];
                }else{
                    $suit.= ' lapel_width';
                }

                if($fetch['pocket_style']!= 'empty'){
                    $suit.= ' pocket pocket_'.$fetch['pocket_style'];
                }

                $suit.='"';

                $suit.='style="position:absolute; 
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
            }while($fetch = $this->db->fetch($query));
            ///  trouser end


            /// belt loops start
            $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$trousersFabric}  AND side = 'front' AND fitting_id = {$fitting_filter} AND component_id = 14";
            $query = $this->db->query($query_string);
            $fetch = $this->db->fetch($query);

            do{


                if($selected_product != 'jacket'){
                    $total_price+=$fetch['price'];
                }

                $fitting = 'slim';
                $side = 'front';
                if($fetch['fitting_id'] == 2){
                    $fitting = 'classic';
                }

                if($fetch['side'] == 'back'){
                    $side = 'back';
                }

                $zindex = $this->z_index($fetch['component_id']);

                $suit.='<img data-price="'.$fetch['price'].'"  data-price="'.$fetch['price'].'" class="suit_image '.$this->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

                if($fetch['lapel_style'] != 'empty'){
                    $suit.= ' lapel_'.$fetch['lapel_style'];
                }else{
                    $suit.= ' lapel_style';
                }

                if($fetch['lapel_width']!= 'empty'){
                    $suit.= ' lapel_'.$fetch['lapel_width'];
                }else{
                    $suit.= ' lapel_width';
                }

                if($fetch['pocket_style']!= 'empty'){
                    $suit.= ' pocket pocket_'.$fetch['pocket_style'];
                }

                $suit.='"';

                $suit.='style="position:absolute; 
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
            }while($fetch = $this->db->fetch($query));
            //// belt loops end


            /// pleats part
            $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$lapel_fabric}  AND side = 'front' AND component_id = 13 AND trousers_pleats = '{$trousersPleats}'  AND fitting_id = {$fitting_filter}";
            $query = $this->db->query($query_string);
            if($this->db->num_rows($query) > 0){
                $fetch = $this->db->fetch($query);
                do{

                    if($selected_product != 'jacket'){
                        $total_price+=$fetch['price'];
                    }

                    $fitting = 'slim';
                    $side = 'front';
                    if($fetch['fitting_id'] == 2){
                        $fitting = 'classic';
                    }

                    if($fetch['side'] == 'back'){
                        $side = 'back';
                    }

                    $zindex = $this->z_index($fetch['component_id']);

                    $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$this->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['trousers_pleats'];

                    if($fetch['lapel_style'] != 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_style'];
                    }else{
                        $suit.= ' lapel_style';
                    }

                    if($fetch['lapel_width']!= 'empty'){
                        $suit.= ' lapel_'.$fetch['lapel_width'];
                    }else{
                        $suit.= ' lapel_width';
                    }

                    if($fetch['pocket_style']!= 'empty'){
                        $suit.= ' pocket pocket_'.$fetch['pocket_style'];
                    }

                    $suit.='"';

                    $suit.='style="position:absolute; 
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
                }while($fetch = $this->db->fetch($query));

            }
            //// pleats part end

            $suit.= '<img class="suit_image front" style="position:absolute; z-index:100;" src="'.BASE_URL.'uploads/images/top.png" />';
            return $suit;
        }
        /// change suit end

}