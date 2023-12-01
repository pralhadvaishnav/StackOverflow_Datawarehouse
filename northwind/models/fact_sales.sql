WITH stg_orders AS 
(
    SELECT
        OrderID,
        {{ dbt_utils.generate_surrogate_key(['employeeid']) }} AS employeekey,
        {{ dbt_utils.generate_surrogate_key(['customerid']) }} AS customerkey,
        replace(to_date(orderdate)::varchar, '-', '')::int AS orderdatekey,
        replace(to_date(shippeddate)::varchar, '-', '')::int AS shippeddatekey,
        replace(to_date(requireddate)::varchar, '-', '')::int AS requireddatekey,
        shipname,
        shipaddress,
        shipcity,
        shipregion,
        shippostalcode,
        shipcountry,
        freight,
        shipvia
    FROM {{ source('northwind', 'Orders') }}
),
stg_order_details AS
(
    SELECT
        orderid,
        SUM(Quantity) AS quantityonorder,
        SUM(Quantity * UnitPrice * (1 - Discount)) AS totalorderamount
    FROM {{ source('northwind', 'Order_Details') }}
    GROUP BY orderid
)
SELECT
    o.*
FROM stg_orders o
    JOIN stg_order_details od ON o.orderid = od.orderid
