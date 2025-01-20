select
    lo.region,
    lo.segment,
    sum(ob.sales) as TotalSales,
    sum(ob.profit) as TotalProfit
from {{ ref('ListOfOrders') }} lo
join {{ ref('OrderBreakdown') }} ob
on lo.orderid = ob.orderid
group by lo.region, lo.segment
order by TotalSales desc
