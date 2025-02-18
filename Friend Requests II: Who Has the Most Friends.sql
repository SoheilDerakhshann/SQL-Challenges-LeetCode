With cte as (
    Select requester_id as id from RequestAccepted
    Union All 
    Select accepter_id as id from RequestAccepted
)

Select id, count(id) as num from 
cte
group by id
order by num desc
Limit 1
