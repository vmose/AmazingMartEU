
with OrderBreakdown as (

    select
        orderid,
        productname,
        discount,
        sales,
        profit,
        quantity,
        category,
        subcategory
    from
    AmazingMartSales.OrderBreakdown
)
select *
from OrderBreakdown

