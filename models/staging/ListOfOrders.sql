
with ListOfOrders as (

    select
        orderid,
        cast(orderdate as date) as orderdate,
        customername,
        city,
        country,
        region,
        segment,
        cast(shipdate as date) as orderdate,
        shipmode,
        state
    from
    AmazingMartSales.ListOfOrders
)
select *
from ListOfOrders

