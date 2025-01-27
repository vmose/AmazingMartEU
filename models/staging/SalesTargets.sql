
with SalesTargets as (
    select
        MonthofOrderDate,
        Category,
        Target
    from
    AmazingMartSales.SalesTargets
)
select *
from SalesTargets

