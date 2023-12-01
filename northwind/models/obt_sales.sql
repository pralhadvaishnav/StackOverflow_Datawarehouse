with f_sales as (
    select * from {{ ref('fact_sales') }}
),
d_customer as (
    select * from {{ ref('dim_customer') }}
),
d_employee as (
    select * from {{ ref('dim_employee') }}
),
d_date as (
    select * from {{ ref('dim_date') }}
)
select 
    d_customer.*, 
    d_employee.*, 
    d_date.*,
    f.orderid, f.customerkey, f.employeekey, f.orderdatekey, f.shippeddatekey, f.Quantity, f.UnitPrice, f.Discount, f.freight     
    from f_sales as f
    left join d_customer on f.customerkey = d_customer.customerkey
