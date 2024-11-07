<?php

class AdminController extends BaseController
{
    private $__conn, $__instanceBaseModel, $__instanceProductModel;

    public function __construct($conn)
    {
        $this->__conn = $conn;
        $this->__instanceBaseModel = $this->initModel("BaseModel", $this->__conn);
    }
    /**
     * Summary of Users
     * go to the adminBuyerController class
     * @return void
     */
    public function Users() {}


    /**‚
     * Summary of Coupons
     * go to the adminCouponsController
     * @return void
     */
    public function Coupons() {}


    /**
     * Summary of OrderItem
     * go to the order item class 
     * @return void
     */
    public function OrderItem() {}

    /**
     * Summary of Orders
     * go to Orders class 
     * @return void
     */
    public function Orders() {}

    /**
     * Summary of OrderStatus
     * go to the order status class
     * @return void
     */
    public function OrderStatus() {}


    /**
     * Summary of ProductImage
     * Go to the ProductImage class
     * @return void
     */
    public function ProductImage() {}


    /**
     * Summary of ProductRating
     * Go to the ProductRating Class
     * @return void
     */
    public function ProductRating() {}

    /**
     * Summary of Products
     * go to the Products class 
     * @return void
     */
    public function Products()
    {
        if ($_SERVER["REQUEST_METHOD"] === "GET") {
            include_once "./app/controllers/CollectionsController.php";
            $product = new CollectionsController($this->__conn);
            $product->all();
        } else if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $input = json_decode(file_get_contents('php://input'), true);
            if (!empty($this->__instanceBaseModel->checkSomethingExist("Products", "product_name", $input["product_name"]))) {
                $this->FactoryMessage("error", "Product has the same name already exist");
            } else {
                include_once "./app/controllers/ProductController.php";
                $o_product = new ProductController($this->__conn);
                $o_product = $this->insert_data_to_instance($o_product, $input);
                $product_images = $input["product_images"];
                $product_images = explode(",", $product_images);
                //* Create a column name for SQL statement
                // Create a Reflection class to get the instance variables name
                $reflection = new ReflectionClass($o_product);
                $properties = $reflection->getProperties();
                //*column names for the SQL
                $column = "";
                //*value for column name 
                $value = "";
                foreach ($properties as $property) {
                    $property->setAccessible(true);
                    if ($property->name == "__instance_model" || $property->name == "__conn" || $property->name == "__product_images") {
                        continue;
                    }
                    $column_name = substr($property->name, 2);
                    $get_method = "get_" . $column_name;
                    $column_value = $o_product->$get_method();
                    if ($column_value == NULL) {
                        continue;
                    }
                    $column = $column . $column_name . ", ";
                    $value = $value . $column_value . ", ";
                }
                $column = rtrim($column, ", ");
                $value = rtrim($value, ", ");
                // var_dump($column);
                // var_dump($value);

                //* Add product process
                $this->__instanceProductModel = $this->initModel("ProductModel", $this->__conn);
                $last_inserted_id = $this->__instanceProductModel->createNewProduct($column, $value);
                $last_inserted_id = $last_inserted_id[0]["id"];


                //* Add product images
                //*delete all existing product images
                $this->__instanceProductModel->deleteProductImages($last_inserted_id);
                foreach ($product_images as $product_image) {
                    $this->__instanceProductModel->insertNewProductImage($product_image, $last_inserted_id);
                }
            }
        } else if ($_SERVER["REQUEST_METHOD"] === "PUT") {
            $input = json_decode(file_get_contents('php://input'), true);
            if (empty($this->__instanceBaseModel->checkSomethingExist("Products", "product_id", $input["product_id"]))) {
                $this->FactoryMessage("error", "Product doesn't exist");
            } else {
                include_once "./app/controllers/ProductController.php";
                $o_product = new ProductController($this->__conn);
                $o_product = $this->insert_data_to_instance($o_product, $input);
                $this->__instanceProductModel = $this->initModel("ProductModel", $this->__conn);
                $this->__instanceProductModel->updateExistingProduct($o_product);
                $this->__instanceProductModel->deleteProductImages($input["product_id"]);
                $product_images = $input["product_images"];
                $product_images = explode(",", $product_images);
                foreach ($product_images as $product_image) {
                    $this->__instanceProductModel->insertNewProductImage($product_image, $input["product_id"]);
                }
            }
        }
    }
}
