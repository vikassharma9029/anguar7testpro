<?php

if (isset($_SERVER['HTTP_ORIGIN'])) {
    header("Access-Control-Allow-Origin: {$_SERVER['HTTP_ORIGIN']}");
    header('Access-Control-Allow-Credentials: true');
    header('Access-Control-Max-Age: 86400');    // cache for 1 day
}

// Access-Control headers are received during OPTIONS requests
if ($_SERVER['REQUEST_METHOD'] == 'OPTIONS') {

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_METHOD']))
        header("Access-Control-Allow-Methods: GET, POST, OPTIONS");

    if (isset($_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']))
        header("Access-Control-Allow-Headers: {$_SERVER['HTTP_ACCESS_CONTROL_REQUEST_HEADERS']}");

}

$DB_HOST = "localhost"; 
$DB_NAME = "test";
$DB_USER = "root";  
$DB_PASS = "root123"; 

$conn = mysql_connect($DB_HOST, $DB_USER, $DB_PASS);
mysql_select_db($DB_NAME) or die("Database not connected");

$postdata = file_get_contents("php://input");
$reqData = json_decode($postdata, true);

//echo '<pre>';print_r($reqData);die;

if (isset($reqData) && $reqData['flagCheck'] == 'listing') {
    if(array_key_exists('userId',$reqData)){ 
        $sql1 = "SELECT * FROM record where id=".$reqData['userId'];
    } else{ 
        $sql1 = "SELECT * FROM record";    
    }
    
    $result_file = select_query($sql1);
    echo json_encode($result_file);
    die(0);
} 
    else if (isset($reqData) && $reqData['flagCheck'] == 'delete') {
    $sql1 = "DELETE FROM record WHERE id = ".$reqData['userId'];
    $result = mysql_query($sql1);
    echo $result;
    die(0);
} 
    else if(isset($reqData) && $reqData['flagCheck'] == 'save'){
    $sql = "INSERT INTO record SET name = '". $reqData['data']['first_name']. "',last_name= '".$reqData['data']['last_name']."',email='".$reqData['data']['email']. "',role='".$reqData['data']['role']. "', dept='". $reqData['data']['dept']."'";
    $result = mysql_query($sql);
    echo $result;
    die(0);
} 
    else if(isset($reqData) && $reqData['flagCheck'] == 'update'){
    $sql = "UPDATE record SET name = '". $reqData['data']['first_name']. "',last_name= '".$reqData['data']['last_name']."',email='".$reqData['data']['email']. "',role='".$reqData['data']['role']. "', dept='". $reqData['data']['dept']."' WHERE id =".$reqData['data']['user_id'];
    $result = mysql_query($sql);
    echo $result;
    die(0);
}

/**
 * @desc Fetch result query.
 * @param type $query
 * @return type
 */
function select_query($query) {
    $arr = array();
    $qry = mysql_query($query) or die($query);
    $num = mysql_num_rows($qry);
    $num_field = mysql_num_fields($qry);
    for ($i = 0; $i < $num_field; $i++) {
        $fname[] = @mysql_field_name($qry, $i);
    }
    for ($i = 0; $i < $num; $i++) {
        $result = mysql_fetch_array($qry);
        foreach ($fname as $key => $value) {
            $arr[$i][$value] = $result[$value];
        }
    }
    return $arr;
}

?>
