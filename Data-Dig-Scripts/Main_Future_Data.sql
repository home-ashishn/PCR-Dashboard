-- call CALCULATE_FUTURE_INFO('2023-08-03','2023-08-03');

set @SYMBOL = 'TCS';
 
/*

select * from futures_info fi 
where symbol  = @SYMBOL
and fi.current_date between 
date_sub(@target_date, interval 30 day) and
date_add(@target_date, interval 0 day)
and exp_date = @near_exp;

select * from futures_info fi 
where symbol  = @SYMBOL
and fi.current_date between 
date_sub(@target_date, interval 30 day) and
date_add(@target_date, interval 0 day)
and exp_date = @next_exp;

*/

/*
select symbol , fi.current_date , sum(total_oi)
-- ,sum(oi_change) 
from futures_info fi 
where symbol  = @SYMBOL
and fi.current_date between 
date_sub(@target_date, interval 30 day) and
date_add(@target_date, interval 0 day)
group by symbol, fi.current_date ;
*/

select *
-- ,sum(oi_change) 
from futures_info fi 
where symbol  = @SYMBOL
order by fi.current_date desc;;

select symbol , fi.current_date , sum(total_oi)
-- ,sum(oi_change) 
from futures_info fi 
where symbol  = @SYMBOL
group by symbol, fi.current_date
order by fi.current_date desc;