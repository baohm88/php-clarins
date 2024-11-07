<?php
class ProductCategories extends ValidateController
{
    private $__conn, $__categoryName = null;
    public function __construct($conn = null)
    {
        $this->__conn = $conn;
    }

    public function setCategory($category)
    {
        if ($this->validate('categoryName', $category) != null) {
            $this->__categoryName = $category;
            return $this->getCategoryName();
        }
        return null;
    }

    public function getCategoryName()
    {
        return $this->__categoryName;
    }
}
