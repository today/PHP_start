<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title></title>

</head>
<body>

<?php
  function validUsername($name){
    // TODO
    return true;
  }

  function validpassword($pwd, $pwd2 ){
    // TODO
    if ( $pwd == $pwd2 ) {
      return true;
    }else{
      return false;
    }

  }



  $msg = "";
  $msg2 = "";

  //$username = $_GET['username'];
  $username = $_POST['username'];
  $password = $_POST['password'];
  $password2 = $_POST['password2'];
  $email = $_POST['email'];
  $telephone = $_POST['telephone'];
  $userage = $_POST['age'];
  // echo $userage;
  // echo $email;
  // echo $telephone;

  // TODO 校验数据
  $flag = true;
  if( validUsername($username) ){
    //
    $msg = $username . " is valid Username";
  }else{
    $flag = false;
  }

  if( validpassword($password, $password2 ) ){
    //
    $msg2 = "Password is valid.";
  }else{
    $flag = false;
  }

  if( $flag ){
    // echo $msg;
    // echo $msg2;
  }else{
    echo "请求数据出错，请返回重新注册。";
  }

  if( $flag ){
    // TODO 存入数据库
    define('DB_HOST','127.0.0.1');
    define('DB_USER','root');
    define('DB_PWD','');//密码
    define('DB_NAME','test');//在phpmyadmin创建一个名为trigkit的数据库

    //连接数据库
    $connect = mysql_connect(DB_HOST,DB_USER,DB_PWD) or die('数据库连接失败，错误信息：'.mysql_error());
    //选择指定数据库
    mysql_select_db(DB_NAME,$connect) or die('数据库连接错误，错误信息：'.mysql_error());//将表名字故意写错，提示的错误信息：数据库连接错误，错误信息：Unknown database 'trigkt'

    $query = "INSERT INTO user( username, passwd, age, phone )
                       VALUES ( '" . $username . "', '" . $password
                              . "', '" . $userage . "','" . $telephone . "' )";

    @mysql_query($query) or die('新增错误：'.mysql_error());

    // TODO 反馈处理结果给前端
    echo "<h1>注册成功</h1>";
  }
?>

</body>
</html>
