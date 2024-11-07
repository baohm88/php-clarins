<?php

class BaseController
{
    const VIEW_PATH = "./app/views/";
    const MODEL_PATH = "./app/models/";

    public function view($fileName, $data = [])
    {
        $filePath = self::VIEW_PATH . $fileName . ".php";
        if (file_exists($filePath)) {
            return require_once $filePath;
        } else {
            echo "File not exist";
        }
    }
    public function isDigit($arg)
    {
        if (ctype_digit($arg) && $arg > 0) {
            return true;
        }
        return false;
    }
    public function initModel($modelName, $conn)
    {
        try {

            $file = self::MODEL_PATH . $modelName . ".php";
            if (file_exists($file)) {

                include_once($file);
                if (class_exists($modelName)) {
                    $modelInstance = new $modelName($conn);
                    return $modelInstance;
                }
            }
            return null;
        } catch (Exception $e) {
            echo $e->getMessage();
        }
    }
    public function viewData($data)
    {
        echo "<pre>";
        var_dump($data);
        echo "</pre>";
    }

    public function FactoryMessage($type = "info", $message = "", $data = null)
    {
        $arr = [
            "type" => $type,
            "message" => $message
        ];
        if ($data != null) {
            $arr["data"] = $data;
        }
        echo json_encode($arr);
    }

    public function insert_data_to_instance($instance, $inputs)
    {
        // $this->viewData($instance);
        // die();
        foreach ($inputs as $key => $value) {
            $method_name = "set_" . $key;
            $instance->$method_name($value);
        }
        return $instance;
    }

    public function create_sql_param_for_sql($o_instance, $method)
    {
        if ($method == "PUT") {
            $reflection = new ReflectionClass($o_instance);
            $properties = $reflection->getProperties();
            $str = "";
            foreach ($properties as $property) {
                $property_name = substr($property->name, 2);
                if (in_array($property_name, ["instance_model", "conn", "product_images"])) {
                    continue;
                }

                $str .= $property_name . " = :" . $property_name . ",";
            }
            $str =  rtrim($str, ", ");
            return $str . " ";
        } else if ($method == "POST") {
            $reflection = new ReflectionClass($o_instance);
            $properties = $reflection->getProperties();
            $col = "";
            $value = "";
            foreach ($properties as $property) {
                $property_name = substr($property->name, 2);
                if (in_array($property_name, ["instance_model", "conn", "product_images"])) {
                    continue;
                }

                $col .= $property_name . ", ";
                $value .= ":" . $property_name . ", ";
            }
            $arr = [];
            $arr["col"] = rtrim($col, ", ");
            $arr["value"] = rtrim($value, ", ");
            return $arr;
        }
    }

    public function bind_instance_value($o_instance, $stmt)
    {
        $reflection = new ReflectionClass($o_instance);
        $properties = $reflection->getProperties();
        foreach ($properties as $property) {
            $property_name = substr($property->name, 2);
            if (in_array($property_name, ["instance_model", "conn", "product_images"])) {
                continue;
            }
            $get_method = "get_" . $property_name;
            if (in_array($property_name, ["stock_qty", "product_id", "rating", "user_id"])) {
                $stmt->bindValue($property_name, $o_instance->$get_method(), PDO::PARAM_INT);
            } else {
                $stmt->bindValue($property_name, $o_instance->$get_method(), PDO::PARAM_STR);
            }
        }
    }
}
