SELECT CASE WHEN id % 2 = 0 Then id-1 
            WHEN id % 2 =1 AND id+1<= (select max(id) FROM seat) THEN id+1
            ELSE id
            ENd  as id 
, student
FROM  Seat 
Group by id
order by id asc 
