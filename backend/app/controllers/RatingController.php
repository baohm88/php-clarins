<?php

class RatingController
{
    private $__product_id = null;
    private $__rating = null;
    private $__rating_comment = null;
    private $__user_id = null;

    private $__conn;

    // Constructor to initialize the properties (optional)
    public function __construct($conn)
    {
        $this->__conn = $conn;
    }

    // Getter and setter for __product_id
    public function get_product_id()
    {
        return $this->__product_id;
    }

    public function set_product_id($__product_id)
    {
        $this->__product_id = $__product_id;
    }

    // Getter and setter for __rating
    public function get_rating()
    {
        return $this->__rating;
    }

    public function set_rating($__rating)
    {
        $this->__rating = $__rating;
    }

    // Getter and setter for __rating_comment
    public function get_rating_comment()
    {
        return $this->__rating_comment;
    }

    public function set_rating_comment($__rating_comment)
    {
        $this->__rating_comment = $__rating_comment;
    }

    // Getter and setter for __user_id
    public function get_user_id()
    {
        return $this->__user_id;
    }

    public function set_user_id($__user_id)
    {
        $this->__user_id = $__user_id;
    }
}
