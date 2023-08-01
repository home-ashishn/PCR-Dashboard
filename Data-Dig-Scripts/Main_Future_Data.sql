-- call CALCULATE_FUTURE_INFO('2023-07-31','2023-07-31');

set @SYMBOL = 'HINDUNILVR';
 
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
where symbol  = @SYMBOL;

select symbol , fi.current_date , sum(total_oi)
-- ,sum(oi_change) 
from futures_info fi 
where symbol  = @SYMBOL
group by symbol, fi.current_date
order by fi.current_date desc;