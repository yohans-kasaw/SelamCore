# SelamCore

# Factory Management System Schema

## Tables Overview

- [User](#user-table)
- [Roles](#roles-table)
- [Inventory](#inventory-table)
- [Categories](#categories-table)
- [InventoryType Enum](#inventorytype-enum)
- [InventoryPriceHistory](#inventorypricehistory-table)
- [Transaction](#transaction-table)
- [PaymentMethod Enum](#paymentmethod-enum)

---

## User Table

Stores information about users in the system.

| Field            | Data Type     | Constraints                                                         |
|------------------|---------------|---------------------------------------------------------------------|
| **id**           | INT           | Primary Key, Auto-increment                                         |
| **first_name**   | VARCHAR(50)   | Not Null                                                            |
| **last_name**    | VARCHAR(50)   | Not Null                                                            |
| **email**        | VARCHAR(100)  | Not Null, Unique                                                    |
| **phone**        | VARCHAR(20)   | Not Null, Unique                                                    |
| **address**      | VARCHAR(255)  |                                                                     |
| **role_id**      | INT           | Foreign Key to [Roles](#roles-table)(id), Not Null                 |
| **password_hash**| VARCHAR(255)  | Not Null                                                            |
| **created_at**   | TIMESTAMP     | Default: CURRENT_TIMESTAMP                                          |
| **updated_at**   | TIMESTAMP     | Default: CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP              |

---

## Roles Table

Defines the roles that a user can have in the system.

| Field          | Data Type     | Constraints                                                         |
|----------------|---------------|---------------------------------------------------------------------|
| **id**         | INT           | Primary Key, Auto-increment                                         |
| **name**       | VARCHAR(50)   | Not Null, Unique                                                    |
| **description**| TEXT          |                                                                     |

**Sample Data:**

| id | name              | description                   |
|----|-------------------|-------------------------------|
| 1  | Admin             | System administrator          |
| 2  | Manager           | General manager               |
| 3  | Sales             | Sales department              |
| 4  | ProductionManager | Oversees production           |
| 5  | Customer          | External customer             |
| 6  | Employee          | General employee              |

---

## Inventory Table

Stores information about inventory items.

| Field             | Data Type     | Constraints                                                         |
|-------------------|---------------|---------------------------------------------------------------------|
| **id**            | INT           | Primary Key, Auto-increment                                         |
| **name**          | VARCHAR(100)  | Not Null                                                            |
| **category_id**   | INT           | Foreign Key to [Categories](#categories-table)(id), Not Null        |
| **description**   | TEXT          |                                                                     |
| **quantity**      | INT           | Not Null, Default: 0, CHECK (quantity >= 0)                         |
| **unit_price**    | DECIMAL(10,2) | Not Null, CHECK (unit_price >= 0)                                   |
| **is_for_sale**   | BOOLEAN       | Not Null, Default: TRUE                                             |
| **is_low_quality**| BOOLEAN       | Not Null, Default: FALSE                                            |
| **added_by**      | INT           | Foreign Key to [User](#user-table)(id), Not Null                    |
| **type**          | ENUM          | Not Null, Values: see [InventoryType Enum](#inventorytype-enum)     |
| **created_at**    | TIMESTAMP     | Default: CURRENT_TIMESTAMP                                          |
| **updated_at**    | TIMESTAMP     | Default: CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP              |

---

## Categories Table

Stores product categories for inventory items.

| Field    | Data Type    | Constraints                       |
|----------|--------------|-----------------------------------|
| **id**   | INT          | Primary Key, Auto-increment       |
| **name** | VARCHAR(100) | Not Null, Unique                  |

---

## InventoryType Enum

Defines the type of inventory items.

| Value          |
|----------------|
| **EndProduct** |
| **RawMaterial**|

*Implemented as an `ENUM` data type.*

---

## InventoryPriceHistory Table

Tracks changes in the unit price of inventory items.

| Field            | Data Type     | Constraints                                                         |
|------------------|---------------|---------------------------------------------------------------------|
| **id**           | INT           | Primary Key, Auto-increment                                         |
| **inventory_id** | INT           | Foreign Key to [Inventory](#inventory-table)(id), Not Null          |
| **old_price**    | DECIMAL(10,2) | Not Null, CHECK (old_price >= 0)                                    |
| **new_price**    | DECIMAL(10,2) | Not Null, CHECK (new_price >= 0)                                    |
| **changed_at**   | TIMESTAMP     | Default: CURRENT_TIMESTAMP                                          |

---

## Transaction Table

Records transactions involving inventory items.

| Field            | Data Type     | Constraints                                                         |
|------------------|---------------|---------------------------------------------------------------------|
| **id**           | INT           | Primary Key, Auto-increment                                         |
| **invoice_number** | VARCHAR(50) | Not Null, Unique                                                    |
| **inventory_id** | INT           | Foreign Key to [Inventory](#inventory-table)(id), Not Null          |
| **quantity**     | INT           | Not Null, CHECK (quantity > 0)                                      |
| **unit_price**   | DECIMAL(10,2) | Not Null, CHECK (unit_price >= 0)                                   |
| **unit_price_history_id** | INT        | Foreign Key to [InventoryPriceHistory](#inventorypricehistory-table)(id), Not Null |
| **total_price**  | DECIMAL(10,2) | Not Null, Calculated as (quantity * unit_price)                     |
| **buyer_id**     | INT           | Foreign Key to [User](#user-table)(id), Not Null                    |
| **seller_id**    | INT           | Foreign Key to [User](#user-table)(id), Not Null                    |
| **payment_method** | ENUM        | Not Null, Values: see [PaymentMethod Enum](#paymentmethod-enum)     |
| **description**  | TEXT          |                                                                     |
| **created_at**   | TIMESTAMP     | Default: CURRENT_TIMESTAMP                                          |

---

## InventoryPriceHistory Table

Tracks changes in the unit price of inventory items.

| Field            | Data Type     | Constraints                                                         |
|------------------|---------------|---------------------------------------------------------------------|
| **id**           | INT           | Primary Key, Auto-increment                                         |
| **inventory_id** | INT           | Foreign Key to [Inventory](#inventory-table)(id), Not Null          |
| **old_price**    | DECIMAL(10,2) | Not Null, CHECK (old_price >= 0)                                    |
| **new_price**    | DECIMAL(10,2) | Not Null, CHECK (new_price >= 0)                                    |
| **changed_by**   | INT           | Foreign Key to [User](#user-table)(id), Not Null                    |
| **changed_at**   | TIMESTAMP     | Default: CURRENT_TIMESTAMP                                          |

## PaymentMethod Enum

Defines the payment methods available for transactions.

| Value    |
|----------|
| **Cash** |
| **Bank** |


## ER Diagram (Simplified)

```plaintext
[Roles] <--- role_id --- [User] --< added_by >-- [Inventory] --< inventory_id >-- [InventoryPriceHistory]
                             ^
                             |
                          buyer_id
                             |
                          [Transaction] -- inventory_id --> [Inventory]
                             |
                          seller_id
                             |
                           [User]
