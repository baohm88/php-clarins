<?php
class OrderItemModel
{

    private $__conn;
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }

    public function checkProductQuantity($product_id, $quantity)
    {
        $sql = "SELECT 
        CASE WHEN stock_qty > :quantity
            THEN 'true'
            ELSE 'false'
        END
        AS result
        FROM Products
        WHERE product_id = :product_id
";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":quantity", $quantity, PDO::PARAM_INT);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->execute();

        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductName($product_id)
    {
        $sql = "SELECT product_name 
                FROM Products
                WHERE product_id = :product_id
        ";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function createNewOrder($user_id, $order_value)
    {
        $sql = "INSERT INTO 
            Orders
            (user_id, order_value, order_date, status)
            VALUES
            (:user_id, :order_value, :order_date, 'pending');
            ";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":user_id", $user_id, PDO::PARAM_INT);
        $stmt->bindValue(":order_value", $order_value, PDO::PARAM_STR);
        $stmt->bindValue(":order_date", date("Y-m-d"), PDO::PARAM_STR);

        // Execute the statement once
        $stmt->execute();

        // Get the last inserted ID
        $sql_get_last_id = "SELECT LAST_INSERT_ID() as id;";
        $stmt_sql_get_last_id = $this->__conn->prepare($sql_get_last_id);
        $stmt_sql_get_last_id->execute();

        return $stmt_sql_get_last_id->fetchAll(PDO::FETCH_ASSOC);
    }
    public function createOrderItem($order_id, $product_id, $product_name, $product_price, $quantity)
    {
        $sql = "
        INSERT INTO 
        OrderItems
        (order_id, product_id,product_name, product_price, product_qty)
        VALUES
        (:order_id, :product_id, :product_name, :product_price, :quantity);
        ";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":order_id", $order_id, PDO::PARAM_STR);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_STR);
        $stmt->bindValue(":product_name", $product_name, PDO::PARAM_STR);
        $stmt->bindValue(":product_price", $product_price, PDO::PARAM_STR);
        $stmt->bindValue(":quantity", $quantity, PDO::PARAM_STR);
        $stmt->execute();
    }
    public function removeProductQuantity($product_id, $quantity)
    {
        $sql1 = "UPDATE Products
        SET stock_qty  = stock_qty - :quantity
        WHERE product_id = :product_id
        ";
        $stmt1 = $this->__conn->prepare($sql1);
        $stmt1->bindValue(":quantity", $quantity, PDO::PARAM_INT);
        $stmt1->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt1->execute();
    }
}
