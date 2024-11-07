<?php
class ProductsController extends BaseController
{

    private $__instanceModel, $__conn;
    public function __construct($conn)
    {
        $this->__instanceModel         = $this->initModel("ProductModel", $conn);
        $this->__conn                  = $conn;
    }

    public function product($params)
    {
        try {
            if (ctype_digit($params["product_id"]) && $params["product_id"] > 0) {
                $params["product_id"]  = (int)$params["product_id"];
                $data                  = $this->__instanceModel->getProductData($params["product_id"]);
                if (empty($data)) {
                    throw new InvalidArgumentException("There are none of our products that matched your requirement");
                }
                $data["image"]         = $this->__instanceModel->getProductImage($params["product_id"]);
                $data["ratings"]       = $this->__instanceModel->getProductRating($params["product_id"]);
                $this->FactoryMessage("success", "This is product data", $data);
            } else {
                throw new InvalidArgumentException("There are none of our products that matched your requirement");
            }
        } catch (Exception $e) {
            $this->FactoryMessage("error", $e->getMessage());
        }
    }
    
    public function rating()
    {
        // $instanceBaseModel          = $this->initModel("BaseModel", $this->__conn);
        if ($_SERVER["REQUEST_METHOD"] == "POST") {
            $input                     = json_decode(file_get_contents('php://input'), true);
            include_once("./app/controllers/RatingController.php");
            $instance_rating           = new RatingController($this->__conn);
            $instance_rating           = $this->insert_data_to_instance($instance_rating, $input);
            $arr                       = $this->create_sql_param_for_sql($instance_rating, "POST");
            $instanceRatingModel       = $this->initModel("RatingModel", $this->__conn);
            $data = $instanceRatingModel->checkUserHaveBoughtProduct($input["product_id"], $input["user_id"]);
            $rated = $instanceRatingModel->checkUserHaveLeaveAReviewOrNot($input["product_id"], $input["user_id"]);
            if (!empty($data) && empty($rated)) {
                $instanceRatingModel->addNewRating($arr["col"], $arr["value"], $instance_rating);
                $this->FactoryMessage("success", "Your rating has been posted successfully");
            } else if (!empty($rated)) {
                $this->FactoryMessage("error", "You have already leave a rating for this product");
            } else {
                $this->FactoryMessage("error", "You need to buy this product before leave a rating for this product");
            }
        } else if ($_SERVER["REQUEST_METHOD"] == "PUT") {
            $input                     = json_decode(file_get_contents('php://input'), true);
            $instance_rating_model     = $this->initModel("RatingModel", $this->__conn);
            $is_exist = $instance_rating_model->check_rating_exist($input["product_id"], $input["user_id"]);
            if (!empty($is_exist)) {
                include_once("./app/controllers/RatingController.php");
                $instance_rating           = new RatingController($this->__conn);
                $instance_rating           = $this->insert_data_to_instance($instance_rating, $input);
                $str                       = $this->create_sql_param_for_sql($instance_rating, "PUT");
                $instance_rating_model->edit_rating($instance_rating, $str);
                $this->FactoryMessage("success", "Your rating has been updated successfully");
            } else {
                $this->FactoryMessage("error", "The rating you trying to edit is not exist");
            }
        }
    }
}
