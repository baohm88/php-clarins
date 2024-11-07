<?php

include_once("./app/controllers/ProductController.php");
include_once("./app/controllers/CouponController.php");
class TestController extends ProductController
{
    private $__instanceModel, $__conn;
    public function __construct($conn = null)
    {
        $this->__conn = $conn;
        // $this->__instanceModel = $this->initModel("BaseModel", $conn);
    }

    public function test()
    {
        $controller = new CouponController($this->__conn);
        var_dump($controller->setSalePercentage("100.0"));
    }
}
