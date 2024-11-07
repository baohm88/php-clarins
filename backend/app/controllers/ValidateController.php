<?php

class ValidateController
{
    public function validate($type, $value, $conn = null)
    {
        $type = strtolower($type);
        switch ($type) {
            case "id":
                $regex =  '/^[0-9]{1,11}$/';
                break;
            case "name":
                $regex = "/^[A-Za-z]+(?: [A-Za-z]+)*$/";
                break;
            case "username":
                $regex = "/^[a-z0-9_]{1,30}$/";
                break;
            case "price":
                $regex =  '/(?<!\w)([€$£]|VND)?\s?\d{1,3}(?:[.,]\d{3})*(?:[.,]\d{2})?(?!\w)/';
                break;
            case 'qty':
                $regex = '/^[1-9]\d{0,6}$/';
                break;
            case "productname":
                $regex = "([A-Za-z]+(?:\s[A-Za-z0-9-]+)+)";
                break;
            case "email":
                $regex = "/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/";
                break;
            case "timestamp":
                $dateTimestamp = strtotime($value);
                $todayTimestamp = time();
                if ($dateTimestamp > $todayTimestamp) {
                    return null;
                }
                $regex = "/^(19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/";
                break;
            case "percentage":
                $regex = "/^(100(\.0{1,})?|[0-9]{1,2}(\.\d+)?|0)$/";
                break;
            case "age":
                // $dateTimestamp = strtotime($value . "+18 year");
                // $todayTimestamp = time();
                // if ($dateTimestamp > $todayTimestamp) {
                //     return null;
                // }
                $regex = "/^(19|20)\d{2}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/";
                break;
            case "phone":
                $regex = "/^(\+?\d{1,3}[-. ]?)?(\(?\d{1,3}\)?[-. ]?)?\d{1,4}[-. ]?\d{1,4}[-. ]?\d{1,9}$/";
                break;
            case "address":
                $regex = "/.*/";
                break;
            case "productid":
                /**
                 * TODO: Create a validate function that call database to check if the product id exist or not 
                 */
                $regex = "/^[1-9]\d{0,10}$/";
                break;

            case "categoryname":
                /** 
                 * TODO: Create a validate function that call to db and check if the category name already exist or not
                 */
                $regex = "/^.{1,255}$/";
                break;
            default:
                $regex = "/a^/";
        }
        if (preg_match($regex, $value)) {
            return $value;
        } else {
            return null;
        }
    }
}
