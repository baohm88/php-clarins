# API Documentation

## Quản lý User

- [ ] **[GET] admin/user/**
  - **Description**: Get user info
  - **Request Example**:
    ```json
    {
      "user_id": 123
    }
    ```

- [ ] **[PUT] admin/user/**
  - **Description**: Change user info
  - **Request Example**:
    ```json
    {
      "user_id": 123,
      "password": "hashed_password_string",
      "is_active": 1,
      "first_name": "John",
      "last_name": "Doe",
      "dob": "1990-01-01",
      "phone": "+1234567890",
      "address": "1234 Elm Street, Springfield, USA",
      "user_image": "base64_encoded_image_string"
    }
    ```

## Quản lý Product

- [x] **[GET] /admin/products/?product_id=123**
    - **Description**: get all product in admin
    - **Payload Example**:
    ```json
    {
      [
        "product_id": 1,
        "product_name": "abc",
        "description": "asdasdas",
        "product_price": 99.99,
        "stock_qty": 1,
        "main_category": "skincare",
        "sub_category": "abc"
        "product_images" : "link1,link2,link3,link4"
      ]
    }
    
    ```
- [x] **[POST] /admin/products/**
  - **Description**: Add new product
  - **Request Example**:
    ```json
    {
      "product_name": "Sample Product",
      "price": 99.999999999,
      "stock_qty": 50,
      "main_category": "Makeup" || "Skincare",
      "sub_category": "Makeup" || "Skincare",
      "date_listed": "2024-10-05",
      "product_images" : "link1,link2,link3,link4"
    }
    ```

- [x] **[PUT] /admin/products/**
  - **Description**: Update existing product
  - **Request Example**:
    ```json
    {
      "product_id": 123,
      "product_name": "Sample Product",
      "price": 99.999999999,
      "stock_qty": 50,
      "main_category": "Makeup" || "Skincare",
      "sub_category": "Makeup" || "Skincare",
      "date_listed": "2024-10-05",
      "product_images" : "link1,link2,link3,link4"
    }
    ```

# Endpoint của User

## User

- [x] **[POST] /user/login**
  - **Description**: User login
  - **Request Example**:
    ```json
    {
      "username": "user1",
      "password": "pass1"
    }
    ```

- [x] **[POST] /user/register/**
  - **Description**: User register
  - **Request Example**:
    ```json
    {
      "username": "john_doe",
      "password": "hashed_password_string",
      "first_name": "John",
      "last_name": "Doe",
      "dob": "1990-01-01",
      "phone": "+1234567890",
      "address": "1234 Elm Street, Springfield, USA",
      "buyer_image": "base64_encoded_image_string"
    }
    ```

- [x] **[GET] /user/profile/**
  - **Description**: Get current user info
  - **Request Example**:
    ```json
    {
      "user_id": 123
    }
    ```

- [x] **[PUT] /user/profile/**
  - **Description**: Change user info
  - **Request Example**:
    ```json
    {
      "user_id": 123,
      "password": "hashed_password_string",
      "is_active": 1,
      "first_name": "John",
      "last_name": "Doe",
      "dob": "1990-01-01",
      "phone": "+1234567890",
      "address": "1234 Elm Street, Springfield, USA",
      "buyer_image": "base64_encoded_image_string"
    }
    ```

## Products

- [x] **[GET] /collections/skincare/**
  - **Request Example**:
    ```json
    [

      "products": [
        [
          "product_id": 1,
          "product_name": "abc",
          "description": "asdasdas",
          "product_price": 99.99,
          "quantity": 1,
          "main_category": "skincare",
          "sub_category": "abc"
      ],
        [
          "product_id": 2,
          "product_name": "abc",
          "description": "asdasdas",
          "product_price": 99.99,
          "quantity": 1,
          "main_category": "skincare",
          "sub_category": "abc"
        
         ]
      ] ,
      "max_price": 1,
      "min_price": 0,
      "order_by": "name||price",
      "desc": true||false,
      "offset": 1 // int
    }
    ```

- [x] **[GET] products/product/?product_id=123**
  - **Request Example**:
    ```json
    {
    "type": "success",
    "message": "This is product data",
    "data": {
        "0": {
            "product_name": "Cum deleniti quidem.",
            "price": "446995714.903180000",
            "product_description": "",
            "quantity_in_stock": 22471,
            "main_category": "Skincare",
            "sub_category": "Body"
        },
        "images": [
            {
                "product_image": "/35a7e41f5038e8207ce35808d0b098b4.jpg"
            },
            {
                "product_image": "/60d75cb3888891e15259e1d466edca33.jpg"
            }
        ],
        "ratings": [
            {
                "username": "john_doe",
                "rating_date": "1976-07-09",
                "rating": 1,
                "rating_comment": "Quia libero nihil eum perferendis eaque similique non ipsa. Asperiores dolor autem nulla rerum possimus error. Consequatur tempora dolorem officiis est laudantium eos. Sint voluptas facilis qui similique ea quidem quibusdam. Mollitia harum id ea facere. E"
            },
            {
                "username": "john_doe",
                "rating_date": "1977-04-29",
                "rating": 0,
                "rating_comment": "Ut dolores cumque possimus praesentium. In reprehenderit voluptatem temporibus voluptatem quasi unde. Consequuntur a dolorem a sit. Quam et velit omnis. Aut in modi ex doloremque. Esse modi autem officiis quia."
            },
            {
                "username": "john_doe",
                "rating_date": "2015-01-29",
                "rating": 2,
                "rating_comment": "Quia consectetur rerum sed suscipit. Molestiae sequi sint dolor laborum. Et laborum non omnis. Ipsa ratione quis adipisci ut fugit. Aut fuga sint id placeat. Qui voluptas explicabo expedita temporibus velit libero quae."
            }
        ]
    }
}
    ```

## Orders

- [x] **[GET] /user/orders/?user_id=123**
  - **Return Payload Example**:
    ```json
    {
      "orders": [
        {
          "order_id": 1,
          "order_value": 99.99,
          "order_date": "2020-10-10",
          "status": "pending"
        },
        {
          "order_id": 2,
          "order_value": 99.99,
          "order_date": "2020-10-10",
          "status": "pending"
        }
      ]
    }
    ```

- [ ] **[POST] /user/orders**
  - **Request Example**:
    ```json
    {
      "user_id": 123,
      "order_value": 90.99,
      "cart_items": [
        {
          "product_id": 1,
          "product_name": "abc",
          "product_price": 99.99,
          "quantity": 1
        },
        {
          "product_id": 2,
          "product_name": "abc",
          "product_price": 99.99,
          "quantity": 1
        },
        {
          "product_id": 3,
          "product_name": "abc",
          "product_price": 99.99,
          "quantity": 1
        }
      ]
    }
    ```


## Order Item

- [ ] **[GET] user/order_item/?order_id=123**
  - **Request Example**:
    ```json
    {
      "order_items": [
        {
          "product_name": "abc",
          "product_price": 99.99,
          "quantity": 90
        },
        {
          "product_name": "assc",
          "product_price": 99.99,
          "quantity": 90
        }
      ]
    }
    ```

## Product rating

- [ ] **[GET] product/rating/?product_id=123**
  - **Respond Example**:
    ```json
    {
      "ratings": [
        {
          "product_id": 123,
          "rating": 5,
          "rating_comment": "This is product rating comment",
          "user_id" : 123
        },
        {
          "product_id": 123,
          "rating": 1,
          "rating_comment": "This is product rating comment",
          "user_id" : 234
        }, {
          "product_id": 123,
          "rating": 3,
          "rating_comment": "This is product rating comment",
          "user_id" : 345
        }
      ]
    }
    ```

- [ ] **[POST] product/rating/**
  - **Respond Example**:
    ```json
    {
      "product_id": 123,
      "rating": 5,
      "rating_comment": "This is product rating comment",
      "user_id" : 123
    }
    ```
- [ ] **[PUT] product/rating/**
  - **Respond Example**:
    ```json
    {
      "product_id": 123,
      "rating": 5,
      "rating_comment": "This is product rating comment",
      "user_id" : 123
    }
    ```