<?php
class CouponController extends ValidateController
{
    private $__productID, $__salePercentage, $__conn = null;
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }
    public function setProductID($id)
    {
        if ($this->validate("productID", $id, $this->__conn) != null) {
            $this->__productID = $id;
            return $this->getProductID();
        }
        return null;
    }

    public function getProductID()
    {
        return $this->__productID;
    }

    public function setSalePercentage($percentage)
    {
        if ($this->validate('percentage', $percentage) != null) {
            $this->__salePercentage = $percentage;
            return $this->getSalePercentage();
        }
        return null;
    }
    public function getSalePercentage()
    {
        return $this->__salePercentage;
    }
}
