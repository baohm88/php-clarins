<?php
class BaseModel extends BaseController
{

    private $__conn;
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }

    public function checkSomethingExist($table_name, $column_name, $value)
    {
        $sql = "SELECT * FROM $table_name WHERE $column_name = :value";
        $stmt = $this->__conn->prepare($sql);
        $stmt->bindValue(":value", $value, PDO::PARAM_STR);
        $stmt->execute();
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }

    public function SQL($object, $sql)
    {
        $reflect = new ReflectionClass($object);
        $properties = $reflect->getProperties();
        $set_value = [];
        $bind_params = [];

        // Iterate over properties to build the SET clause and bind parameters
        foreach ($properties as $property) {
            // Make private/protected properties accessible
            $property->setAccessible(true);
            $name = $property->getName();
            $value = $property->getValue($object);

            // Skip null values and ID
            if ($value == null || $name == "__id") {
                continue;
            }

            // Clean property name and prepare the binding
            $clean_name = str_replace("__", "", $name);
            $set_value[] = "$clean_name = :$clean_name";  // Store the SET clause
            $bind_params[$clean_name] = $value; // Store the value to bind
        }
        $set_value_str = implode(", ", $set_value); // Join the SET clause

        if ($object->get_user_id() != null) {
            $sql = "UPDATE Users SET $set_value_str WHERE buyerId = :user_id"; // No trailing comma
            $stmt = $this->__conn->prepare($sql);


            $pdo_param_type = PDO::PARAM_STR;


            // Bind parameters
            foreach ($bind_params as $key => $val) {
                switch ($key) {
                    case "user_image":
                        $pdo_param_type = PDO::PARAM_LOB;
                        break;
                    case "is_active":
                        $pdo_param_type = PDO::PARAM_INT;
                        break;
                    case "password":
                        $val = password_hash($val, PASSWORD_DEFAULT);
                        $pdo_param_type = PDO::PARAM_STR;
                        break;
                    case "is_active":
                        break;
                    default:
                        $pdo_param_type = PDO::PARAM_STR;
                }
                // Bind the parameters
                // echo $key . ", " . $val . ", " . $pdo_param_type . "<br>";
                $stmt->bindValue(":$key", $val, $pdo_param_type);
            }

            // Bind the user ID separately
            $user_id = $object->get_user_id();
            $stmt->bindValue(":user_id", $user_id, PDO::PARAM_INT);

            // $stmt->debugDumpParams();
            // Execute the statement
            $stmt->execute();
            $this->FactoryMessage("success", "User data changed successfully");
        } else {
            $this->FactoryMessage("error", "User ID Not Found");
        }
    }
}
