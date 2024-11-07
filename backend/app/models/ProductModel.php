<?php
class ProductModel extends BaseController
{
    private $__conn;
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }

    public function checkProductExist($name)
    {
        $sql = "SELECT * FROM Products WHERE productName = :name";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":name", $name, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductData($arg)
    {
        $sql = "SELECT 
                    p.product_name,
                    p.product_price,
                    p.product_description,
                    p.quantity_in_stock,
                    p.main_category,
                    p.sub_category
                FROM Products p
                WHERE p.product_id = :product_id";

        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":product_id", $arg, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductImage($product_id)
    {
        $sql = "SELECT 
                product_image
            FROM ProductImages
            WHERE product_id = :product_id
        ";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function getProductRating($product_id)
    {
        $sql = "SELECT 
                    u.username,
                    pr.rating_date,
                    pr.rating,
                    pr.rating_comment
                FROM 
                    ProductRatings pr
                JOIN 
                    Users u ON pr.user_id = u.user_id
                WHERE 
                    pr.product_id = :product_id;
        ";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function createNewProduct($columns, $values)
    {
        // Convert the column and value strings into arrays
        $a_columns = explode(", ", $columns);
        $a_values = explode(", ", $values);

        // Prepare the placeholders for the SQL statement
        $placeholders = [];
        foreach ($a_columns as $column_name) {
            $placeholders[] = ":value_" . trim($column_name);
        }

        // Create the SQL statement

        $sql = "INSERT INTO Products (" . implode(", ", $a_columns) . ") VALUES (" . implode(", ", $placeholders) . ")";

        // Prepare the SQL statement
        $stmt = $this->__conn->prepare($sql);

        // Bind the values to the placeholders
        foreach ($a_columns as $index => $column_name) {
            $placeholder = ":value_" . trim($column_name);
            $value = trim($a_values[$index]); // Get the corresponding value and trim whitespace

            // Determine the appropriate data type for binding
            if ($column_name === 'quantity_in_stock') {
                $stmt->bindValue($placeholder, (int)$value, PDO::PARAM_INT); // Bind as integer
            } else {
                $stmt->bindValue($placeholder, $value, PDO::PARAM_STR); // Bind as string
            }
        }

        // Execute the prepared statement
        $stmt->execute();

        $sql1 = "SELECT MAX(product_id) as id FROM Products";
        $stmt1 = $this->__conn->prepare($sql1);
        $stmt1->execute();
        return $stmt1->fetchAll(PDO::FETCH_ASSOC);
    }

    public function deleteProductImages($product_id)
    {
        $sql = "DELETE FROM ProductImages WHERE product_id = :product_id";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":product_id", $product_id, PDO::PARAM_INT);
        $stmt->execute();
    }

    public function insertNewProductImage($image_link, $product_id)
    {
        $sql = "INSERT INTO ProductImages (image_url, product_id) VALUES (:image_link, :product_id)";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":image_link", $image_link);
        $stmt->bindValue(":product_id", $product_id);
        $stmt->execute();
    }

    public function updateExistingProduct($o_product)
    {
        $sql_params = rtrim($this->create_sql_param_for_sql($o_product, "PUT"), ", ");
        $sql = "UPDATE Products
                SET " . $sql_params . "
                WHERE product_id = :product_id";
        $stmt = $this->__conn->prepare($sql);
        $this->bind_instance_value($o_product, $stmt);
        $stmt->execute();
    }
}
