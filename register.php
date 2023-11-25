<?php
$servername="localhost";
$username="root";
$password="";
$dbname="akhil2blue";
$conn= new mysqli($servername,$username,$password,$dbname);
if(!$conn){
    die('cloud not connect:'.mysqli_connect_error());

}
echo 'connected sucessfully <br/>';
$stmt=$conn->prepare("INSERT INTO user(name,password) VALUES(?,?)");
$stmt->bind_param("ss",$u,$p);
// set parameters and execute
$u=$_POST["user"];
$p=$_POST["pass"];
$stmt->execute();
echo "record inserted sucessfully";
$stmt->close();
$conn->close();
header("refresh:2; url=home.html");
?>