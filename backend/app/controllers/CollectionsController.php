<?php
class CollectionsController extends BaseController
{
    private $__collectionName, $__instanceCollectionsModel, $__min, $__max, $__product_name, $__product_price, $__limit = 8,  $__offset, $__main_category, $__sub_category;
    private $__a_allow_var = [
        '__offset',
        '__min',
        '__max',
        '__product_name',
        '__limit',
        '__product_price',
        '__main_category',
        '__sub_category'
    ];
    public function __construct($conn)
    {
        $this->__instanceCollectionsModel = $this->initModel("CollectionsModel", $conn);
    }

    protected function set_min($min)
    {
        $this->__min = $min;
    }

    public function get_min(): string
    {
        return $this->__min;
    }
    protected function set_sub_category($sub_category)
    {
        $this->__sub_category = $sub_category;
    }

    public function get_sub_category(): string
    {
        return $this->__sub_category;
    }

    protected function set_main_category($main_category)
    {
        $this->__main_category = $main_category;
    }

    public function get_main_category(): string
    {
        return $this->__main_category;
    }


    protected function set_max($max)
    {
        $this->__max = $max;
    }

    public function get_max(): string
    {
        return $this->__max;
    }

    protected function set_product_name($name)
    {
        $this->__product_name = $name;
    }

    public function get_product_name(): string
    {
        return $this->__product_name;
    }

    protected function set_product_price($price)
    {
        $this->__product_price = $price;
    }

    public function get_product_price(): string
    {
        return $this->__product_price;
    }

    protected function set_offset($offset)
    {
        $this->__offset = $offset;
    }

    public function get_offset(): string
    {
        return $this->__offset;
    }
    public function all($params): void
    {
        $this->insert_data_to_instance($this, $params);
        $obj = $this->unset_instance_vars($this, $this->__a_allow_var);
        $this->__instanceCollectionsModel->all($obj);
    }

    public function products($params): void
    {
        $this->insert_data_to_instance($this, $params);
        $obj = $this->unset_instance_vars($this, $this->__a_allow_var);
        $this->__instanceCollectionsModel->getSpecificProducts($obj);
    }
}
