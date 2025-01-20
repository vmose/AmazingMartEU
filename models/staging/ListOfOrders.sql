
with ListOfOrders as (

    select
        orderid,
        orderdate,
        customername,
        city,
        country,
        region,
        segment,
        shipdate,
        shipmode,
        state
    from
    AmazingMartSales.ListOfOrders
)
select *
from ListOfOrders

