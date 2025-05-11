<?php

/**
 * Created by PhpStorm.
 * User: M Yasir
 * Date: 6/22/2016
 * Time: 9:46 PM
 */
class Image
{

    protected $db;

    public function __construct()
    {
        $this->db = Database::getInstance();
    }


    public function upload_image($src, $destination, $width = -1, $height = -1)
    {
        $time_stamp = strtotime('now');
        $field_name = pathinfo($_FILES[$src]["name"], PATHINFO_BASENAME);
        $ext = pathinfo($field_name, PATHINFO_EXTENSION);
        $file_name = rand(10,10000000).$time_stamp . '.' . $ext;
        $target_folder = $destination .'/'. $file_name;
        $thumb = $destination .'/thumbnail/'. $file_name;
        $ext_array = array('JPEG', 'png', 'PNG', 'jpg', 'JPG', 'jpg');
        if (!in_array($ext, $ext_array)) {
            return 'type_error';
        } else {
            list($img_width, $img_height) = getimagesize($_FILES[$src]['tmp_name']);

            if ($width == -1 && $height == -1) {
                $upload_status = move_uploaded_file($_FILES[$src]['tmp_name'], 'uploads/' . $target_folder);
                $this->generate_image_thumbnail('uploads/' . $target_folder, 'uploads/' . $thumb);
                return array($thumb, $target_folder);
            } else {
                if ($img_width == $width && $img_height == $height) {
                    $upload_status = move_uploaded_file($_FILES[$src]['tmp_name'], 'uploads/' . $target_folder);
                    $this->generate_image_thumbnail('uploads/' . $target_folder, 'uploads/' . $thumb);
                    return array($thumb, $target_folder);
                } else {
                    return 'dimention_error';
                }
            }
        }
    }



    public function get_file_upload_error($error_num){
        $phpFileUploadErrors = array(
            0 => 'There is no error, the file uploaded with success',
            1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
            2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
            3 => 'The uploaded file was only partially uploaded',
            4 => 'No file was uploaded',
            6 => 'Missing a temporary folder',
            7 => 'Failed to write file to disk.',
            8 => 'A PHP extension stopped the file upload.',
        );

        foreach($phpFileUploadErrors as $key=>$error){
            if($key == $error_num){
                return $error;
            }
        }
    }




    /*
     * imagealphamask(); comments
     * Load source and mask
     * $source = imagecreatefromjpeg( 'men-left.jpg' );
     * $mask = imagecreatefrompng( 'print_area_small.png' );
     * Apply mask to source
     * imagealphamask( $source, $mask ); // Output
     *
     * */
    public function imagealphamask( $picture, $mask ) {
        header( "Content-type: image/png");
        // Get sizes and set up new picture
        $xSize = imagesx( $picture );
        $ySize = imagesy( $picture );
        $newPicture = imagecreatetruecolor( $xSize, $ySize );
        imagesavealpha( $newPicture, true );
        imagefill( $newPicture, 0, 0, imagecolorallocatealpha( $newPicture, 0, 0, 0, 127 ) );

        // Resize mask if necessary
        if( $xSize != imagesx( $mask ) || $ySize != imagesy( $mask ) ) {
            $tempPic = imagecreatetruecolor( $xSize, $ySize );
            imagecopyresampled( $tempPic, $mask, 0, 0, 0, 0, $xSize, $ySize, imagesx( $mask ), imagesy( $mask ) );
            imagedestroy( $mask );
            $mask = $tempPic;
        }

        // Perform pixel-based alpha map application
        for( $x = 0; $x < $xSize; $x++ ) {
            for( $y = 0; $y < $ySize; $y++ ) {
                $alpha = imagecolorsforindex( $mask, imagecolorat( $mask, $x, $y ) );
                $alpha = 127 - floor( $alpha[ 'red' ] / 2 );
                $color = imagecolorsforindex( $picture, imagecolorat( $picture, $x, $y ) );
                imagesetpixel( $newPicture, $x, $y, imagecolorallocatealpha( $newPicture, $color[ 'red' ], $color[ 'green' ], $color[ 'blue' ], $alpha ) );
            }
        }

        // Copy back to original picture
        imagedestroy( $picture );

        imagepng( $newPicture );
    }


    function generate_image_thumbnail($source_image_path, $thumbnail_image_path)
    {

        if(!defined('THUMBNAIL_IMAGE_MAX_WIDTH')){
            define('THUMBNAIL_IMAGE_MAX_WIDTH', 150);
        }

        if(!defined('THUMBNAIL_IMAGE_MAX_HEIGHT')){
            define('THUMBNAIL_IMAGE_MAX_HEIGHT', 150);
        }


        list($source_image_width, $source_image_height, $source_image_type) = getimagesize($source_image_path);
        switch ($source_image_type) {
            case IMAGETYPE_GIF:
                $source_gd_image = imagecreatefromgif($source_image_path);
                break;
            case IMAGETYPE_JPEG:
                $source_gd_image = imagecreatefromjpeg($source_image_path);
                break;
            case IMAGETYPE_PNG:
                $source_gd_image = imagecreatefrompng($source_image_path);
                break;
        }
        if ($source_gd_image === false) {
            return false;
        }
        $source_aspect_ratio = $source_image_width / $source_image_height;
        $thumbnail_aspect_ratio = THUMBNAIL_IMAGE_MAX_WIDTH / THUMBNAIL_IMAGE_MAX_HEIGHT;
        if ($source_image_width <= THUMBNAIL_IMAGE_MAX_WIDTH && $source_image_height <= THUMBNAIL_IMAGE_MAX_HEIGHT) {
            $thumbnail_image_width = $source_image_width;
            $thumbnail_image_height = $source_image_height;
        } elseif ($thumbnail_aspect_ratio > $source_aspect_ratio) {
            $thumbnail_image_width = (int) (THUMBNAIL_IMAGE_MAX_HEIGHT * $source_aspect_ratio);
            $thumbnail_image_height = THUMBNAIL_IMAGE_MAX_HEIGHT;
        } else {
            $thumbnail_image_width = THUMBNAIL_IMAGE_MAX_WIDTH;
            $thumbnail_image_height = (int) (THUMBNAIL_IMAGE_MAX_WIDTH / $source_aspect_ratio);
        }
        $thumbnail_gd_image = imagecreate($thumbnail_image_width, $thumbnail_image_height);
        imagecopyresampled($thumbnail_gd_image, $source_gd_image, 0, 0, 0, 0, $thumbnail_image_width, $thumbnail_image_height, $source_image_width, $source_image_height);
        imagepng($thumbnail_gd_image, $thumbnail_image_path);
        imagedestroy($source_gd_image);
        imagedestroy($thumbnail_gd_image);
        return true;
    }

    public function thumbnail_path($path){
        $file_name = pathinfo($path, PATHINFO_FILENAME);
        $directory = pathinfo($path, PATHINFO_DIRNAME);
        $ext = pathinfo($path, PATHINFO_EXTENSION);
        return $directory.'/thumb-'.$file_name.".".$ext;
    }


    public function upload_status($status){
        switch($status){
            case 1:
                return 'The uploaded file exceeds';
                break;

            case 2:
                return 'The uploaded file exceeds the MAX_FILE_SIZE';
                break;

            case 3:
                return 'The uploaded file was only partially uploaded';
                break;

            case 4:
                return 'No file was uploaded';
                break;

            case 6:
                return 'Missing a temporary folder';
                break;

            case 7:
                return 'Failed to write file to disk.';
                break;

            default:
                return 'successfull';
        }
    }



}///end class