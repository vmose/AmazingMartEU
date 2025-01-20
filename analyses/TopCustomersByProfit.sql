with CustomerProfit as (
    select
        lo.customername,
        sum(ob.profit) as TotalProfit,
        rank() over (order by sum(ob.profit) desc) as ProfitRank
    from {{ ref('ListOfOrders') }} lo
    join {{ ref('OrderBreakdown') }} ob
    on lo.orderid = ob.orderid
    group by lo.customername
)
select *
from CustomerProfit
order by TotalProfit desc

