<?php
class OrdersController extends BaseController
{
    private $__instanceModel;
    public function __construct($conn)
    {
        $this->__instanceModel = $this->initModel("OrdersModel", $conn);
    }
}
