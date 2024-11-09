<?php
class CollectionsModel extends BaseModel
{
    private $__conn;
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }

    public function all($instance = 0)
    {
        $sql = "SELECT * FROM products WHERE";
        $suffix = $this->create_sql_param_for_sql($instance, "GET");
        $sql .= $suffix;

        $stmt = $this->__conn->prepare($sql);
        $this->bind_instance_value($instance, $stmt);
        $stmt->execute();
        $a_value = $stmt->fetchAll(PDO::FETCH_ASSOC);
        $this->FactoryMessage("success", "This is all product Array", $a_value);
    }
}
