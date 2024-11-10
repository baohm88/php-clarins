<?php
class CollectionsModel extends BaseModel
{
    private $__conn;
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }

    public function all($obj): void
    {
        $sql = "SELECT * FROM products p 
        JOIN product_main_categories pmc ON pmc.main_category_id = p.main_category
        JOIN product_sub_categories psc ON psc.sub_category_id = p.sub_category
         WHERE";
        $suffix = $this->create_sql_param_for_sql($obj, "GET");
        $sql .= $suffix;

        $stmt = $this->__conn->prepare($sql);
        $this->bind_instance_value($obj, $stmt);
        $stmt->execute();
        $a_value = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $a_values = $this->filter_return_value(
            $a_value,
            [
                'main_category_id',
                'sub_category_id',
                'main_category',
                'sub_category'
            ]
        );
        $this->FactoryMessage("success", "This is all product Array", $a_values);
    }
    public function getSpecificProducts($obj)
    {
        $sql = "SELECT * FROM products p 
        JOIN product_main_categories pmc ON pmc.main_category_id = p.main_category
        JOIN product_sub_categories psc ON psc.sub_category_id = p.sub_category
         WHERE";
        $suffix = $this->create_sql_param_for_sql($obj, "GET");
        $sql .= $suffix;
        // var_dump($sql);
        // die;
        $stmt = $this->__conn->prepare($sql);
        $this->bind_instance_value($obj, $stmt);
        $stmt->execute();
        $a_value = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->viewData($a_value);
    }
}
