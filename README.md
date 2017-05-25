**Get Product Detail**
----
  Returns json data about a single product.

* **URL**

  /products/:id

* **Method:**

  `GET`

*  **URL Params**

   **Required:**

   `id=[integer]`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ id: 1, name: "Michael Bloom" }`

* **Error Response:**

  * **Code:** 500 <br />
    **Content:** `{ message : "Couldn't find Product" }`



**Get Product List**
----
  Returns json data about a list of products

* **URL**

  /products

* **Method:**

  `GET`

*  **URL Params**

   **Optional:**

   `category=[string]`

   `limit=[int] (default 20)`

   `page=[int] (default 1)`

   `order=[string] (value: asc, desc)`


* **Success Response:**

  * **Code:** 200 <br />
    **Content:** `{ total: 10, products: [{ id: 1, name: "Michael Bloom" }] }`

* **Error Response:**

  * **Code:** 500 <br />
    **Content:** `{ message : "Error message" }`

