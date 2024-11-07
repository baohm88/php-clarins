<?php

class BuyerController extends ValidateController
{
    private $__id, $__email, $__first_name = null, $__old_password = null, $__new_password = null, $__is_active, $__password = null, $__userName, $__last_name = null, $__dob = null, $__phone = null, $__address = null, $__user_image = null;

    public function __construct()
    {
        // echo "vao r nhe";
    }

    public function set_user_id($id)
    {
        $validatedId = $this->validate('id', $id);
        if ($validatedId != null) {
            $this->__id = $id;
            return $this->get_user_id();
        }
        return null;
    }

    public function get_user_id()
    {
        if (!empty($this->__id)) {
            return $this->__id;
        }
        return null;
    }
    public function set_email($email)
    {
        if ($email != null) {
            $this->__email = $email;
            return $this->get_username();
        } else {
            return null;
        }
    }

    public function get_email()
    {
        return $this->__email;
    }


    public function set_is_active($active)
    {
        if ($active != null) {
            $this->__is_active = $active;
            return $this->get_username();
        } else {
            return null;
        }
    }

    public function get_is_active()
    {
        return $this->__is_active;
    }



    public function set_username($name)
    {
        $validatedUserName = $this->validate("username", $name);
        if ($validatedUserName != null) {
            $this->__userName = $name;
            return $this->get_username();
        } else {
            return null;
        }
    }

    public function get_username()
    {
        return $this->__userName;
    }

    public function set_password($password)
    {
        $this->__password = $password;
        return $this->get_password();
    }

    public function get_password()
    {
        return $this->__password;
    }

    public function set_first_name($name)
    {
        $validatedName = $this->validate("name", $name);
        if ($validatedName != null) {
            $this->__first_name = $name;
            return $this->get_first_name();
        } else {
            return null;
        }
    }

    public function get_first_name()
    {
        return $this->__first_name;
    }

    public function set_last_name($name)
    {
        $validatedName = $this->validate("name", $name);
        if ($validatedName != null) {
            $this->__last_name = $name;
            return $this->get_last_name();
        }
        return null;
    }

    public function get_last_name()
    {
        return $this->__last_name;
    }

    public function set_dob($dob)
    {
        $this->__dob = $dob;
        // var_dump($this->__dob);
        return $this->get_dob();
    }

    public function get_dob()
    {
        return $this->__dob;
    }

    public function set_phone($phone)
    {
        $validatedPhone = $this->validate("phone", $phone);
        if ($validatedPhone != null) {
            $this->__phone = $phone;
            return $this->get_phone();
        } else {
            return null;
        }
    }
    public function get_phone()
    {
        return $this->__phone;
    }
    public function set_address($address)
    {
        $validatedAddress = $this->validate("address", $address);
        if ($validatedAddress != null) {
            $this->__address = $address;
            return $this->get_address();
        } else {
            return null;
        }
    }
    public function get_address()
    {
        return $this->__address;
    }
    public function set_user_image($picture)
    {

        $this->__user_image = $picture;
        return $this->get_user_image();
    }
    public function get_user_image()
    {
        return $this->__user_image;
    }


    public function set_old_password($password)
    {
        $this->__old_password = $password;
        return $this->get_old_password();
    }

    public function get_old_password()
    {
        return $this->__old_password;
    }


    public function set_new_password($password)
    {
        $this->__new_password = $password;
        return $this->get_new_password();
    }

    public function get_new_password()
    {
        return $this->__new_password;
    }

    public function reset_properties()
    {
        $properties = get_object_vars($this);
        foreach ($properties as $key => $value) {
            $this->$key = null;
        }
    }
}
