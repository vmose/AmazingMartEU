with SalesByMonth as (
    select
        FORMAT_DATE('%b-%y', orderdate) AS Month,
        ob.category,
        sum(ob.sales) as TotalSales
    from {{ ref('ListOfOrders') }} lo
    join {{ ref('OrderBreakdown') }} ob
    on lo.orderid = ob.orderid
    group by 1, 2
),
Performance as (
    select
        sm.Month,
        sm.category,
        sm.TotalSales,
        st.Target,
        sm.TotalSales - st.Target as DifferenceFromTarget
    from SalesByMonth sm
    left join {{ ref('SalesTargets') }} st
    on sm.Month = st.MonthofOrderDate
    and sm.category = st.Category
)
select *
from Performance;