<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */

class C_ImageProcessing
{

    protected $db;

    public function __construct()
    {
        $this->db = new Database();
    }

    public function make_heels($artwork, $left_shoe, $left_clip,$heel_clip_left, $right_clip, $right_shoe, $heel_clip_right,$box){
        $artwork_path = $artwork;
        $artwork = new Imagick($artwork);
        $artwork->setImageFormat("png");


        /*** left shoe making ***/

        //// making left shoe/////
        $left_raw_artwork = clone $artwork;
        $left_clip = new Imagick($left_clip);
        $left_clip->rotateImage('none', -55.5);
        $left_raw_artwork->compositeImage($left_clip,Imagick::COMPOSITE_COPYOPACITY,42,562,Imagick::CHANNEL_ALPHA);
        $left_clip->clear();
        $left_raw_artwork->cropImage(832,1696,668,762);
        $left_raw_artwork->rotateImage('none',55.5);
        $left_raw_artwork->resizeImage('1516',1342,Imagick::FILTER_LANCZOS,1);
        //// making left shoe/////

        ////Making Heel left////
        $heel_clip_left = new Imagick($heel_clip_left);
        $heel_clip_left->rotateImage('none',-10.7);
        $left_heal_raw_artwork = clone $artwork;
        $left_heal_raw_artwork->compositeImage($heel_clip_left, Imagick::COMPOSITE_COPYOPACITY,500,53);
        $left_heal_raw_artwork->cropImage(340,684,500,53);
        $left_heal_raw_artwork->rotateImage('none',10.7);

        $left_raw_artwork->compositeImage($left_heal_raw_artwork, Imagick::COMPOSITE_DEFAULT,894,320);
        $left_heal_raw_artwork->clear();
        $left_shoe = new Imagick($left_shoe);
        $left_raw_artwork->compositeImage($left_shoe, Imagick::COMPOSITE_DEFAULT,151.5,37);
        $left_shoe->clear();
        /*** left shoe making ***/



        /*** right shoe making ***/

        //// making right shoe/////
        $right_raw_artwork = clone $artwork;
        $right_clip = new Imagick($right_clip);
        $right_clip->rotateImage('none', 55.5);
        $right_raw_artwork->compositeImage($right_clip,Imagick::COMPOSITE_COPYOPACITY,-550,550,Imagick::CHANNEL_ALPHA);
        $right_clip->clear();
        $right_raw_artwork->cropImage(832,1696,0,700);
        $right_raw_artwork->rotateImage('none',-55.5);
        $right_raw_artwork->resizeImage('1536',1360,Imagick::FILTER_LANCZOS,1);
        //// making right shoe/////

        ////Making Heel right////
        $heel_clip_right = new Imagick($heel_clip_right);
        $heel_clip_right->rotateImage('none',10.7);
        $right_heal_raw_artwork = clone $artwork;
        $right_heal_raw_artwork->compositeImage($heel_clip_right, Imagick::COMPOSITE_COPYOPACITY,546,53);
        $right_heal_raw_artwork->cropImage(390,684,566,53);
        $right_heal_raw_artwork->rotateImage('none',-10.7);

        $right_raw_artwork->compositeImage($right_heal_raw_artwork, Imagick::COMPOSITE_DEFAULT,86,350);
        $right_heal_raw_artwork->clear();
        $right_shoe = new Imagick($right_shoe);
        $right_raw_artwork->compositeImage($right_shoe, Imagick::COMPOSITE_DEFAULT,187,54);
        $right_shoe->clear();
        /*** right shoe making ***/

        $box = new Imagick($box);
        $right_raw_artwork->resizeImage(900,793,Imagick::FILTER_LANCZOS,1);
        $box->compositeImage($right_raw_artwork, Imagick::COMPOSITE_DEFAULT,100,-10);
        $right_raw_artwork->clear();

        $left_raw_artwork->resizeImage(900,793,Imagick::FILTER_LANCZOS,1);
        $box->compositeImage($left_raw_artwork, Imagick::COMPOSITE_DEFAULT,300,400);
        $left_raw_artwork->clear();



        $heels = 'uploads/ready_products/heels'.rand(1000,9999).time().'.png';
        $box->writeImage($heels);
        echo json_encode(array($artwork_path ,$heels));
    }

    public function make_backpack($artwork, $clip_front, $clip_top,$clip_left,$clip_right,$texture){

        $artwork_path = $artwork;

        $artwork = new Imagick($artwork);
        $artwork->setImageFormat("png");
        $artwork->transformimagecolorspace(13);
        $artwork->resizeImage(1160,931,Imagick::FILTER_LANCZOS,1);

/// front clip ///

        $clip_front = new Imagick($clip_front);
        $clip_front_width = $clip_front->getImageWidth();
        $clip_front_height = $clip_front->getImageHeight();
        $raw_front_artwork = clone $artwork;
        $raw_front_artwork->compositeImage($clip_front, Imagick::COMPOSITE_COPYOPACITY,348,264);
        $raw_front_artwork->cropImage($clip_front_width,$clip_front_height,348,264);

/// clip top ///

        $clip_top = new Imagick($clip_top);
        $clip_top_initial_width = $clip_top->getImageWidth();
        $clip_top_initial_height = $clip_top->getImageHeight();
        $clip_top->resizeImage(791,737, Imagick::FILTER_LANCZOS, 1);
        $raw_top_artwork = clone $artwork;
        $raw_top_artwork->compositeImage($clip_top, Imagick::COMPOSITE_COPYOPACITY,185,28);
        $raw_top_artwork->cropImage(791,737,185,28);
        $raw_top_artwork->resizeImage($clip_top_initial_width,$clip_top_initial_height, Imagick::FILTER_LANCZOS, 1);


//// clip left ////


        $clip_left = new Imagick($clip_left);
        $clip_left_initial_width = $clip_left->getImageWidth();
        $clip_left_initial_height = $clip_left->getImageHeight();
        $raw_left_artwork = clone $artwork;
        $raw_left_artwork->compositeImage($clip_left, Imagick::COMPOSITE_COPYOPACITY,898,605);
        $raw_left_artwork->cropImage($clip_left_initial_width,$clip_left_initial_height,898,605);

//// clip right ////


        $clip_right = new Imagick($clip_right);
        $clip_right_initial_width = $clip_right->getImageWidth();
        $clip_right_initial_height = $clip_right->getImageHeight();
        $raw_right_artwork = clone $artwork;
        $raw_right_artwork->compositeImage($clip_right, Imagick::COMPOSITE_COPYOPACITY,232,605);
        $raw_right_artwork->cropImage($clip_right_initial_width,$clip_right_initial_height,232,605);


/// adding texture ///

        $texture = new Imagick($texture);
        $texture_width = $texture->getImageWidth();
        $texture_height = $texture->getImageHeight();

//// final out put ////
        $output = new Imagick();
        $output->newimage($texture_width, $texture_height, "#ffffff");
        $output->setImageFormat("jpg");

//// attach top part ////
        $output->compositeImage($raw_top_artwork,Imagick::COMPOSITE_DEFAULT, 245,187);
//// attach front part ////
        $output->compositeImage($raw_front_artwork,Imagick::COMPOSITE_DEFAULT, 274,293);

//// attach right part ////
        $output->compositeImage($raw_right_artwork,Imagick::COMPOSITE_DEFAULT, 260,654);

//// attach left part ////
        $output->compositeImage($raw_left_artwork,Imagick::COMPOSITE_DEFAULT, 714,640);

//// add texture ////
        $output->compositeImage($texture,Imagick::COMPOSITE_DEFAULT, 0,0);
       // header('Content-type:image/png');
       // echo $output;

        $backpack = 'uploads/ready_products/ready'.rand(1000,9999).time().'.png';
        $output->writeImage($backpack);
        $response = array($artwork_path, $backpack);
        print_r(json_encode($response));
    }



    public function make_apron($artwork, $apron_background, $multiply, $screen){
        $artwork_path = $artwork;

        //$apron_background = "apron-background.png";
        $apron_background = new Imagick($apron_background);

        //$artwork = "artwork.jpg";
        $artwork = new Imagick($artwork);
        $artwork->resizeImage(388, 452, Imagick::FILTER_LANCZOS, 1);

        //$multiply = "multiply.png";
        $multiply = new Imagick($multiply);

       // $screen = "screen.png";
        $screen = new Imagick($screen);

        $apron_background->compositeImage($artwork, imagick::COMPOSITE_DEFAULT, 406, 390);
        $apron_background->compositeImage($multiply, imagick::COMPOSITE_MULTIPLY, 0, 0);
        $apron_background->compositeImage($screen, imagick::COMPOSITE_SCREEN, 0, 0);

        //header('Content-type:image/png');
        //echo $apron_background;

        $apron = 'uploads/ready_products/heels'.rand(1000,9999).time().'.png';
        $apron_background->writeImage($apron);
        echo json_encode(array($artwork_path ,$apron));
    }


}/////class end

