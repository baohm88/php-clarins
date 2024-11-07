<?php
class CollectionsController extends BaseController
{
    private $__instanceModel;
    public function __construct($conn)
    {
        $this->__instanceModel = $this->initModel("CollectionsModel", $conn);
    }

    public function all()
    {
        $products = $this->__instanceModel->getAllProducts();
        $this->FactoryMessage("success", "This is products obj", $products);
    }

    public function skincare($params = [])
    {
        $inputs = json_decode(file_get_contents('php://input'), true);
        $allowed_keys = ['max_price', 'min_price', 'order_by', 'offset'];
        foreach ($allowed_keys as $key) {
            if (!empty($inputs[$key])) {
                ${$key} = $inputs[$key];
            }
        }
        $data = $this->__instanceModel->getCollectionProducts(
            "Skincare",
            order_by: $params["order_by"] ?? null,
            min_price: $params["min_price"] ?? null,
            max_price: $params["max_price"] ?? null,
            desc: $params["desc"] ?? true
        );
        $this->FactoryMessage("success", "This is products array", $data);
    }


    public function makeup($params = [])
    {
        $inputs = json_decode(file_get_contents('php://input'), true);
        $allowed_keys = ['max_price', 'min_price', 'order_by', 'offset'];
        foreach ($allowed_keys as $key) {
            if (!empty($inputs[$key])) {
                ${$key} = $inputs[$key];
            }
        }
        $data = $this->__instanceModel->getCollectionProducts(
            "Makeup",
            order_by: $params["order_by"] ?? null,
            min_price: $params["min_price"] ?? null,
            max_price: $params["max_price"] ?? null,
            desc: $params["desc"] ?? true
        );
        if (!empty($data)) {
            $this->FactoryMessage("success", "This is products array", $data);
        }
    }

    public function product($params = [])
    {
        // Check if 'id' is passed in the parameters
        if (!isset($params['id'])) {
            $this->FactoryMessage("error", "Product ID is required");
            return;
        }

        $productId = $params['id']; // Get the product ID from the parameters
        $product = $this->__instanceModel->getProductById($productId);

        // If the product exists, return it; otherwise, return an error message
        if ($product) {
            $product_ratings = $this->__instanceModel->getProductRatingsById($productId);
            $product['product_ratings'] = $product_ratings; // Corrected syntax here
            $this->FactoryMessage("success", "Product found", $product);
        } else {
            $this->FactoryMessage("error", "Product not found");
        }
    }
}
