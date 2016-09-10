<?php
  
  switch ($_POST['type']) {
    case 1://アカウント登録
      signup($_POST['user'], $_POST['password'], $_POST['idfa']);
      break;
      
    case 2://ログイン
      login($_POST['user'], $_POST['password']);
      break;
      
    case 3://広告画像ローダー
      $result = loadImages($_POST['idfa']);
      echo $result;
      break;
      
    case 4://全初期化
      resetAdokoreDb();
      break;
      
    default:
      break;
  }
  
  function signup($user, $password, $idfa) {
    $sql = "INSERT INTO adokore_user (adokore_user,password) values ('${user}','${password}');";
    $sql .= "INSERT INTO idfa_users (idfa,adokore_user) values ('${idfa}','${user}')";
    sendMultiQuery($sql);
  }
  
  function login() {
    
  }
  
  function loadImages($idfa) {
    $sql = "SELECT image_name,image_path FROM relay_idfa_ad r join ad a ON r.ad_id = a.ad_id WHERE idfa='${idfa}'";
    return sendQuery($sql);
  }
  
  function resetAdokoreDb() {
    $sql = "TRUNCATE TABLE adokore_user;TRUNCATE TABLE idfa_users;TRUNCATE TABLE relay_idfa_ad";
    sendMultiQuery($sql);
  }
  
  //単一クエリを送る．最後のセミコロンはいらない
  function sendQuery($sql) {
    $con=mysqli_connect("127.0.0.1","root","root","adokore_db");
    if (mysqli_connect_errno()) {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    
    if ($result = mysqli_query($con, $sql)) {
      $resultArray = array();
      $tempArray = array();
      while($row = $result->fetch_object()) {
        // temp -> result
        $tempArray = $row;
        array_push($resultArray, $tempArray);
      }
      
      mysqli_close($con);
      
      //jsonに変換して返す必要がある
      return json_encode($resultArray);
    }
  }
  
  //複数クエリを送る．最後のセミコロンはいらない
  function sendMultiQuery($sql) {
    $con=mysqli_connect("127.0.0.1","root","root","adokore_db");
    if (mysqli_connect_errno()) {
      echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }
    
    if ($result = mysqli_multi_query($con, $sql)) {
      $resultArray = array();
      $tempArray = array();
      while($row = $result->fetch_object()) {
        // temp -> result
        $tempArray = $row;
        array_push($resultArray, $tempArray);
      }
      
      mysqli_close($con);
      
      //jsonに変換して返す必要がある
      return json_encode($resultArray);
    }
  }
  ?>