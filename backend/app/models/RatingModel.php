<?php
class RatingModel extends BaseController
{
    private $__conn;
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }

    public function addNewRating($col, $value, $o_rating)
    {
        $sql = "INSERT INTO ProductRating
            (" . $col . ")
            VALUES
            (" . $value . ")
            ";
        $stmt = $this->__conn->prepare($sql);
        $this->bind_instance_value($o_rating, $stmt);
        $stmt->execute();
    }

    public function checkUserHaveBoughtProduct($product_id, $user_id)
    {
        $sql = "SELECT * FROM Orders o
        JOIN OrderItems oi
        ON o.order_id = oi.order_id
        WHERE o.user_id = :user_id
        AND oi.product_id = :product_id";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":user_id", $user_id, PDO::PARAM_INT);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function checkUserHaveLeaveAReviewOrNot($product_id, $user_id)
    {
        $sql = "SELECT * FROM ProductRating
            WHERE product_id = :product_id AND user_id = :user_id";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->bindValue(":user_id", $user_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
    public function check_rating_exist($product_id, $user_id)
    {
        $sql = "SELECT * FROM ProductRating
        WHERE product_id = :product_id
        AND user_id = :user_id";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->bindValue(":user_id", $user_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function edit_rating($o_rating, $str)
    {
        $sql = "UPDATE ProductRating
        SET " . $str .
            "WHERE product_id = :product_id AND user_id = :user_id";
        // echo $sql;
        // die;
        $stmt = $this->__conn->prepare($sql);
        $this->bind_instance_value($o_rating, $stmt);
        $stmt->execute();
    }
}
