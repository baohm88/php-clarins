<?php
// global $conn;
// header('Access-Control-Allow-Origin: http://localhost:3000');
// header('Access-Control-Allow-Methods: *');
// header('Access-Control-Allow-Headers: Content-Type, Authorization');

// include_once "./app/configs/database.php";
// include_once "./app/controllers/BaseController.php";
// include_once "./app/controllers/ValidateController.php";
// include_once "./app/App.php";
// $app = new App($conn);



global $conn;
header("Access-Control-Allow-Origin: http://localhost:3000");
header("Access-Control-Allow-Methods: *");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Access-Control-Allow-Credentials: true");

include_once "./app/configs/database.php";
include_once "./app/controllers/BaseController.php";
include_once "./app/models/BaseModel.php";
include_once "./app/App.php";


$app = new App($conn);
