<?php
include_once "BuyerController.php";
class UserController extends BaseController
{
    private $__instanceUser, $__instanceModel, $__instanceOrderModel, $__conn;
    public function __construct($conn)
    {
        session_start();
        $this->__instanceModel = $this->initModel('UserModel', $conn);
        $this->__conn = $conn;
        $this->__instanceUser = new BuyerController();
    }


    public function register()
    {
        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $input = json_decode(file_get_contents('php://input'), true);
            $this->__instanceUser->set_username($input["username"]);
            if (!empty($this->__instanceModel->checkUserExist($this->__instanceUser))) {
                $this->FactoryMessage("error", "User name already exist");
            } else {
                $this->__instanceUser->set_password($input["password"]);
                $this->__instanceUser->set_email($input["email"]);
                $this->__instanceUser->set_first_name($input['first_name']);
                $this->__instanceUser->set_last_name($input['last_name']);
                $this->__instanceUser->set_dob($input['dob']);
                $this->__instanceUser->set_phone($input['phone']);
                $this->__instanceUser->set_address($input['address']);
                $this->__instanceUser->set_user_image($input['user_image']);
                $this->__instanceModel->createNewUser($this->__instanceUser);
                if (empty($this->__instanceModel->checkUserExist($this->__instanceUser))) {
                    $this->FactoryMessage("error", "Account Not Yet Created");
                } else {
                    $this->FactoryMessage("success", "Account Created");
                }
            }
        }
    }

    public function login()
    {
        if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $input = json_decode(file_get_contents('php://input'), true);
            $this->__instanceUser->set_username($input["username"]);
            $this->__instanceUser->set_password($input["password"]);
            $data = $this->__instanceModel->checkUserExist($this->__instanceUser);
            //* remove password field on the return value
            unset($data["password"]);
            if ($data != null && $data["user_id"] != null) {
                $_SESSION["username"] = $this->__instanceUser->get_username();
                $this->FactoryMessage("success", "Login successfully", $data);
            } else {
                $this->FactoryMessage("error", "Login Failed", $data);
            }
        }
    }
    public function logout()
    {
        if (isset($_SESSION['username'])) {
            $_SESSION['username'] = null;
            session_destroy();
            $this->FactoryMessage("success", "logout success fully");
        } else {
            $this->FactoryMessage("error", "not login yet to logout");
        }
    }

    public function profile()
    {
        if ($_SERVER["REQUEST_METHOD"] === "GET") {
            $inputs = json_decode(file_get_contents('php://input'), true);
            $this->__instanceUser->set_user_id($inputs['user_id']);
            $aUserData = $this->__instanceModel->getUserData($this->__instanceUser);
            if ($aUserData != false) {
                $this->FactoryMessage("success", "Get User Info Successfully", $aUserData);
            } else {
                $this->FactoryMessage("error", "User data not exist");
            }
        } else if ($_SERVER["REQUEST_METHOD"] === "POST") {
            $inputs = json_decode(file_get_contents('php://input'), true);
            foreach ($inputs as $key => $value) {
                $method_name = "set_" . $key;
                $this->__instanceUser->$method_name($value);
            }
            $this->__instanceModel->changeUserData($this->__instanceUser);
        }
    }

    public function change_password()
    {
        $inputs = json_decode(file_get_contents('php://input'), true);
        $old_password = $inputs["old_password"];
        $new_password = $inputs["new_password"];
        $this->__instanceUser->set_old_password($old_password);
        $this->__instanceUser->set_new_password($new_password);
        $this->__instanceUser->set_user_id($inputs["user_id"]);

        if ($old_password == $new_password) {
            $this->FactoryMessage("error", "Your new password can't be the same with your old Password");
        } else if ($this->__instanceModel->checkPasswordCorrect($this->__instanceUser)) {
            $user_id = $inputs["user_id"];
            $this->__instanceUser->reset_properties();
            $this->__instanceUser->set_password($new_password);
            $this->__instanceUser->set_user_id($user_id);
            $this->__instanceModel->changeUserData($this->__instanceUser);
        } else {
            $this->FactoryMessage("error", "Old Password Incorrect");
        }
    }

    public function orders($args = [])
    {
        if ($_SERVER["REQUEST_METHOD"] === "GET") {

            try {

                $user_id = $args["user_id"];
                if ($this->isDigit($user_id)) {
                    $user_orders = $this->__instanceModel->getUserOrders($user_id);
                    if (empty($user_orders)) {
                        throw new InvalidArgumentException("Orders empty");
                    }
                    $this->FactoryMessage("success", "This is user orders", $user_orders);
                } else {
                    throw new InvalidArgumentException("Orders empty");
                }
            } catch (Exception $e) {
                $this->FactoryMessage("error", $e->getMessage());
            }
        } else if ($_SERVER['REQUEST_METHOD'] === "POST") {
            $input = json_decode(file_get_contents('php://input'), true);
            $instanceOrderModel = $this->initModel('OrderItemModel', $this->__conn);
            $cart_items = $input["cart_items"];

            $order_id = 0;
            $loop = 0;
            $count_item = count($cart_items);

            foreach ($cart_items as $cart_item) {
                $quantity = $cart_item["quantity"];
                $product_id  = $cart_item["product_id"];
                $result = $instanceOrderModel->checkProductQuantity($product_id, $quantity);
                if ($result[0]['result'] == "false") {
                    $product_name = $instanceOrderModel->getProductName($product_id);
                    $this->FactoryMessage("error", 'The "' . $product_name[0]['product_name'] . '" has been sold out. Please delete it from your cart or choose another product.');
                    return;
                } else if ($result[0]['result'] == "true" && $loop != $count_item - 1) {
                    $loop++;
                    continue;
                } else if ($loop == $count_item - 1) {
                    $order_id =  $instanceOrderModel->createNewOrder($input['user_id'], $input['order_value']);
                }
            }


            foreach ($cart_items as $cart_item) {
                $quantity = $cart_item["quantity"];
                $product_id  = $cart_item["product_id"];
                // $instanceOrderModel->createOrderItem($order_id[0]['id'], $product_id, $cart_item['product_name'], $cart_item['product_price'], $cart_item['quantity']);
                $instanceOrderModel->removeProductQuantity($product_id, $quantity);
                $instanceOrderModel->createOrderItem($order_id[0]['id'], $product_id, $cart_item['product_name'], $cart_item['product_price'], $cart_item['quantity']);
            }
            $this->FactoryMessage("success", "Your Order has been placed Successfully ", $result);
        }
    }

    public function order_item($params = [])
    {
        // Check if 'order_id' is passed in the parameters
        if (!isset($params['order_id'])) {
            $this->FactoryMessage("error", "Order ID is required");
            return;
        }

        $orderId = $params['order_id']; // Get the order_id  from the parameters
        $order_items = $this->__instanceModel->getUserOrderById($orderId);

        // If the order_items exists, return it; otherwise, return an error message
        if ($order_items) {
            $this->FactoryMessage("success", "Order items found", $order_items);
        } else {
            $this->FactoryMessage("error", "Order items not found");
        }
    }
}
