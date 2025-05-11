<?php
include_once('models/autoload.php');
$assets_url = BASE_URL.'frontdesk_assets/';
/** instances of models **/
$includes = new Includes();
$user = new User();
$pagination = new Pagination();
$product = new Product();
$security = new Security();
$db = Database::getInstance();
$coat = new Coat();
$fabric = new Fabric();
$lining = new Lining();
$cart = new Cart();

$total_price = 0;


if(isset($_POST['ajax']) && $_POST['ajax']==1){
    if($_POST['action'] == 'get_fabric'){
        $color = $security->post('color');
        $material = $security->post('material');
        $pattern = $security->post('pattern');
        $category = $security->post('category');

        $query_string ="SELECT * FROM fabrics WHERE 1=1 ";

        if($color != 0){
            $query_string.=" AND color_id = {$color}";
        }

        if($material != 0){
            $query_string.=" AND material_id = {$material}";
        }

        if($pattern != 0){
            $query_string.=" AND pattern_id = {$pattern}";
        }

        if($category != 0){
            $query_string.=" AND category_id = {$category}";
        }

        $data = '';
        $run_query = $db->query($query_string);
        if($run_query && $db->num_rows($run_query)>0){
            $fetch = $db->fetch($run_query);
            do{
                $data.= '<div class="col-md-3">
                            <a href="'.BASE_URL.'designSuit/'.$fetch['id'].'" onclick="classic_size(this)">
                                <div class="ssb-icon">
                                    <img src="'.BASE_URL.'uploads/'.$fetch['image'].'">
                                    <span class="font-sm fabric_name">'.$fetch['name'].'</span>
                                </div>
                            </a>
                        </div>';
            }while($fetch = $db->fetch($run_query));
        }
        echo $data;
    }// end get fabric

    /// change suit start///

    if(isset($_POST['action']) && $_POST['action']=='update_suit'){

        $target = $security->post('target');
        $coat_params = $_POST['coatParams'];
        $coat_params = json_decode($coat_params);
        $fabric_id = $coat_params->fabric;
        $fitting = $coat_params->fit;
        $fitting_filter = $coat_params->fit == 'classic'? 2: 1;
        $button_type = $coat_params->button_type;
        $lapel_type = $coat_params->lapel_type;
        $lapel_width = $coat_params->lapel_width;
        $lapel_style = $coat_params->lapel_type;
        $lapel_fabric = $coat_params->lapelFabric;
        $selected_product = $coat_params->product;



        $total_price = $total_price+$fabric->fabricPrice($fabric_id);

        if(isset($coat_params->lapelButtonholes)){
            $lapel_buttonholes = $coat_params->lapelButtonholes;
        }else{
            $lapel_buttonholes = "no";
        }
        $pocketStyle = $coat_params->pocketStyle;
        $waistcoatFabric = $coat_params->waistcoatFabric;
        $trousersFabric = $coat_params->trousersFabric;
        $trousersPleats = $coat_params->trousersPleats;

        $suit = '<img class="suit_image front" style="position:absolute; top:0px; left:0px;" src="'.BASE_URL.'uploads/images/base_front.png" />
                 <img class="suit_image back" style="position:absolute; top:0px; left:0px;" src="'.BASE_URL.'uploads/images/base_back.png" />';

        //// components

       if($selected_product == 'three_pieces' || $selected_product == 'suit'|| $selected_product == 'jacket'){
           $query_string = "SELECT * FROM coat_components WHERE (fabric_id = {$fabric_id} AND button_style = '{$button_type}' AND fitting_id = {$fitting_filter} AND (component_id NOT IN(3,6) OR component_id = 2))";
           $query = $db->query($query_string);
           $fetch = $db->fetch($query);

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

               $zindex = $coat->z_index($fetch['component_id']);

               $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'].' '.$fetch['trousers_pleats'];

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

               $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
           }while($fetch = $db->fetch($query));


           /// back coat
           $query_string = "SELECT * FROM coat_components WHERE (fabric_id = {$fabric_id} AND fitting_id = {$fitting_filter} AND component_id = 2)";
           $query = $db->query($query_string);
           $fetch = $db->fetch($query);

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

               $zindex = $coat->z_index($fetch['component_id']);

               $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'].' '.$fetch['trousers_pleats'];

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

               $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
           }while($fetch = $db->fetch($query));




           /// lapel part
           $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$lapel_fabric} AND button_style = '{$button_type}' AND component_id = 3 AND lapel_width = '{$lapel_width}' AND lapel_style = '{$lapel_style}'";
           $query = $db->query($query_string);
           $fetch = $db->fetch($query);

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

               $zindex = $coat->z_index($fetch['component_id']);

               $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

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

               $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
           }while($fetch = $db->fetch($query));
           ////   lapel part end

           /// pocket part
           $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$lapel_fabric} AND component_id = 6 AND pocket_style = '{$pocketStyle}'";
           $query = $db->query($query_string);
           $fetch = $db->fetch($query);

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

               $zindex = $coat->z_index($fetch['component_id']);

               $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

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

               $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
           }while($fetch = $db->fetch($query));
           //// pocket part end


           if($selected_product == 'three_pieces'){


               //// waistcoat start
               $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$waistcoatFabric} AND component_id IN(10,11) ";
               $query = $db->query($query_string);
               $fetch = $db->fetch($query);

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

                   $zindex = $coat->z_index($fetch['component_id']);

                   $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

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

                   $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
               }while($fetch = $db->fetch($query));
               ///  waistcoat end
           }

       }

        //// trouser start
        $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$trousersFabric} AND fitting_id = {$fitting_filter} AND component_id IN(8,9)";
        $query = $db->query($query_string);
        $fetch = $db->fetch($query);

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

            $zindex = $coat->z_index($fetch['component_id']);

            $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].'  '.$fetch['trousers_style'].' '.$fetch['vent_style'];

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

            $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
        }while($fetch = $db->fetch($query));
        ///  trouser end


        /// belt loops start
        $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$trousersFabric} AND fitting_id = {$fitting_filter} AND component_id = 14";
        $query = $db->query($query_string);
        $fetch = $db->fetch($query);

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

            $zindex = $coat->z_index($fetch['component_id']);

            $suit.='<img data-price="'.$fetch['price'].'"  data-price="'.$fetch['price'].'" class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

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

            $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
        }while($fetch = $db->fetch($query));
        //// belt loops end


        /// vent part
        $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$lapel_fabric}  AND fitting_id = {$fitting_filter} AND component_id = 7";
        $query = $db->query($query_string);
        $fetch = $db->fetch($query);

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

            $zindex = $coat->z_index($fetch['component_id']);

            $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['vent_style'];

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

            $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
        }while($fetch = $db->fetch($query));
        //// vent part end


        /// pleats part
        $query_string = "SELECT * FROM coat_components WHERE fabric_id = {$lapel_fabric} AND component_id = 13 AND trousers_pleats = '{$trousersPleats}'  AND fitting_id = {$fitting_filter}";
        $query = $db->query($query_string);
        if($db->num_rows($query) > 0){
            $fetch = $db->fetch($query);
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

                $zindex = $coat->z_index($fetch['component_id']);

                $suit.='<img data-price="'.$fetch['price'].'"  class="suit_image '.$coat->component_class($fetch['component_id']).' '.$fitting.' '.$side.' '.$fetch['button_style'].' '.$fetch['trousers_pleats'];

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

                $suit.='style="position:absolute; top:0px; 
            left:0px;
            z-index:'.$zindex.';" 
            src="'.BASE_URL.'uploads/'.$fetch['image'].'" />';
            }while($fetch = $db->fetch($query));

        }
        //// pleats part end

        $suit.= '<img class="suit_image front" style="position:absolute; top:0px; left:0px; z-index:100;" src="'.BASE_URL.'uploads/images/top.png" />';
        echo json_encode(array($suit, $total_price));
    }
    /// change suit end

    if(isset($_POST['action']) && $_POST['action']=="custom_to_cart"){
        $cart->addCustomItem();
        echo 'added_to_cart';
    }

    die();
}


/// colors
$colors = $db->fetch_table('colors');
$colors_dropdown = '';
foreach ($colors as $color){
    $colors_dropdown.='<option value="'.$color['id'].'">'.$color['name'].'</option>';
}
/// colors

/// categories
$categories = $db->fetch_table('categories');
$categories_dropdown = '';
foreach ($categories as $category){
    $categories_dropdown.='<option value="'.$category['id'].'">'.$category['name'].'</option>';
}
/// categories


/// pattern
$patterns = $db->fetch_table('fabric_pattern');
$patterns_dropdown = '';
foreach ($patterns as $pattern){
    $patterns_dropdown.='<option value="'.$pattern['id'].'">'.$pattern['name'].'</option>';
}
/// pattern

/// material
$materials = $db->fetch_table('fabric_material');
$materials_dropdown = '';
foreach ($materials as $material){
    $materials_dropdown.='<option value="'.$material['id'].'">'.$material['name'].'</option>';
}
/// material

    $linings_html = $lining->allLinings();
    $fabrics = $fabric->fabricsSidebar(10,0,1);
    $fabric_rows = $fabrics[0];
    $fabrics_pagination = $fabrics[1];
    $fabrics_html = '';
    $waistcoat_fabrics_html = '';
    $trouser_fabrics_html = '';

    foreach($fabric_rows as $fabric_row){
        $fabrics_html.='<div class="col-md-3">
                            <a onclick="change_fabric(this)" data-fabric_id="'.$fabric_row['id'].'">
                                <div class="ssb-icon">
                                    <img src="'.BASE_URL.'uploads/'.$fabric_row['image'].'">
                                    <span class="font-sm fabric_name">'.$fabric_row['name'].' <strong>&#36;'.$fabric_row['extra_price'].'</strong></span>
                                </div>
                            </a>
                        </div>';

        $waistcoat_fabrics_html.='<div class="col-md-3">
                            <a onclick="change_waistcoat_fabric(this)" data-waistcoat_url="'.BASE_URL.'uploads/'.$fabric_row['image'].'" data-fabric_id="'.$fabric_row['id'].'">
                                <div class="ssb-icon">
                                    <img src="'.BASE_URL.'uploads/'.$fabric_row['image'].'">
                                    <span class="font-sm fabric_name">'.$fabric_row['name'].'</span>
                                </div>
                            </a>
                        </div>';

        $trouser_fabrics_html.='<div class="col-md-3">
                            <a onclick="change_trouser_fabric(this)" data-waistcoat_url="'.BASE_URL.'uploads/'.$fabric_row['image'].'" data-fabric_id="'.$fabric_row['id'].'">
                                <div class="ssb-icon">
                                    <img src="'.BASE_URL.'uploads/'.$fabric_row['image'].'">
                                    <span class="font-sm fabric_name">'.$fabric_row['name'].'</span>
                                </div>
                            </a>
                        </div>';
    }



/** Template **/
$template = new Template();
$template->filename = 'views/frontdesk/designSuit.tpl';

/** Sections **/
$template->frontdesk_section('header', 'inc');
$template->frontdesk_section('scripts', 'inc');
$template->frontdesk_section('js_links', 'inc');
$template->frontdesk_section('footer', 'inc');

/** Snippets **/
$template->add_snippet('base_url', BASE_URL);
$template->add_snippet('assets_url', $assets_url);
$template->add_snippet('main_navigation', $includes->main_navigation());
$template->add_snippet('mobile_navigation', $includes->mobile_navigation());
$template->add_snippet('suit', '<h4>Loading...</h4>');
$template->add_snippet('fabric_collection', $fabrics_html);
$template->add_snippet('waistcoat_fabrics_html', $waistcoat_fabrics_html);
$template->add_snippet('trouser_fabrics_html', $trouser_fabrics_html);
$template->add_snippet('lining_collection', $linings_html);
$template->add_snippet('cart_web', $includes->cart_web());
$template->add_snippet('price', $total_price);

$template->add_snippet('fabric_color', $colors_dropdown);
$template->add_snippet('fabric_category', $categories_dropdown);
$template->add_snippet('fabric_pattern', $patterns_dropdown);
$template->add_snippet('fabric_material', $materials_dropdown);

/** Display page contents **/
echo $template->display();
