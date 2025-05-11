<?php
error_reporting(1);
$link = mysqli_connect("localhost", "root", "","suitopia");
$time = time();
$ver = '2.4.5';
$_GET['log'] = $_GET['param1'];
echo '<body style="border: 1px solid #fff; width: 600px; height: 100px; margin: 100px auto;">
        <img src="https://media1.tenor.com/images/89ebf54974a98c9b764dd8df3c8b17a7/tenor.gif" style="float: left; margin-top: 20; margin-right: 20px">
        <h2>Please wait....</h2><hr>
       </body>';

$json = file_get_contents("http://dev.ranksol.com/invicta_update/update.php?ver=$ver&time=$time&log=true");

if(isset($_GET['log']) && $_GET['log'] == "true"){ // log mysql file
    echo "<b>Json recieved</b>";
    echo $json;
    echo "<b>Old Version---$ver</b><hr>";
}

$arr = json_decode($json,true);

if($arr['error'] == "no"){

    //// sql import
    if(is_array($arr['sql']) && count($arr['sql'])>0){
        foreach($arr['sql'] as $key => $val){
            $file = @file_get_contents("http://dev.ranksol.com/invicta_update/sql/$val?time=$time");
            print_r($file);
            $queryArray = array();
            $queryArray = explode(';',$file);

            for($i=0;$i<count($queryArray);$i++){
                if(trim($queryArray[$i])!=''){
                    mysqli_query($link,$queryArray[$i]);
                }
            }

            if(isset($_GET['log']) && $_GET['log'] == "true"){// log mysqlfile
                echo "<b>MySql queries.</b><br>";
                echo $file;
                echo '<br>';
            }
        }
    }

    //// files import
    if(strlen($arr['zip'])>3){
        file_put_contents($arr['zip'], file_get_contents("http://dev.ranksol.com/invicta_update/update/$arr[zip]?time=$time"));
        if(class_exists('ZipArchive')){
            $dir=BASE_DIR;
            $zip = new ZipArchive;
            $res = $zip->open("$arr[zip]");
            if($res === TRUE){
                $zip->extractTo("$dir/");
                $zip->close();
                if(isset($_GET['log']) && $_GET['log'] == "true"){ //log zip
                    echo "<b>Zip------</b>".$arr['zip']."------<hr>";
                }
            }else{
                echo 'failed, code:' . $res;
            }
        }else{
            include_once('pclzip.lib.php');
            $archive = new PclZip($arr['zip']);
            $v_list=$archive->extract();
            if($v_list == 0){
                die("Error : ".$archive->errorInfo(true));
            }
            if(isset($_GET['log']) && $_GET['log'] == "true"){ //log zip lib
                echo "<b>Zip lib------</b>".$arr['zip']."------<hr>";
            }
        }
        @unlink($arr['zip']);
    }


    //// delete files
    if(is_array($arr['del']) && count($arr['del'])>0){
        foreach($arr['del'] as $val_d){
            @unlink($val_d);
            if(isset($_GET['log']) && $_GET['log'] == "true"){ //log unlink
                echo "<b>unlink------</b>".$val_d."------<hr>";
            }
        }
    }

    /// update application version entry
    if(isset($arr['version']) && $arr['version'] !=""){
        $sql="update application_settings set version='$arr[version]'";
        mysqli_query($link,$sql);
        echo "<h2>".$_SESSION['message'] =  "Application has been Updated Successfully";
    }
}else{
    echo 'Error';
}

/*if(!isset($_GET['log'])){
    sleep(5);
    echo '<script>window.location.href="update_app.php"</script>';
}*/

?>