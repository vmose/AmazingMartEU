with OrdersWithProducts as (
    select
        lo.orderid,
        lo.orderdate,
        lo.customername,
        lo.city,
        lo.country,
        lo.region,
        lo.segment,
        lo.shipdate,
        lo.shipmode,
        lo.state,
        ob.productname,
        ob.discount,
        ob.sales,
        ob.profit,
        ob.quantity,
        ob.category,
        ob.subcategory
    from {{ ref('ListOfOrders') }} lo
    right join {{ ref('OrderBreakdown') }} ob
    on lo.orderid = ob.orderid
)
select *
from OrdersWithProducts
