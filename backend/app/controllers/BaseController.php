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

    public function unset_instance_vars($instance, $allow_vars)
    {
        $obj = new ReflectionClass($instance);
        $properties = $obj->getProperties();
        $return_obj = new stdClass();
        foreach ($properties as $property) {
            $name = $property->getName();
            $value = $property->getValue($instance);
            if (in_array($name, $allow_vars) && $value != "") {

                $return_obj->$name = $value;
            }
        }
        return $return_obj;
    }
}
