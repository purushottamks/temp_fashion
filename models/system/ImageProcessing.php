<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */

class ImageProcessing
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



}/////class end

