with OrderDelays as (
    select
        lo.orderid,
        lo.customername,
        cast(lo.orderdate as date) as OrderDate,
        cast(lo.shipdate as date) as ShipDate,
        date_diff(cast(lo.shipdate as date), cast(lo.orderdate as date), DAY) as ShippingDelay,
        case 
            when date_diff(cast(lo.shipdate as date), cast(lo.orderdate as date), DAY) > 5 then 'Delayed'
            else 'On Time'
        end as ShippingStatus
    from {{ ref('ListOfOrders') }} lo
)
select *
from OrderDelays
