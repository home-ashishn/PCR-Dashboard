delete from daily_option_data
where CAST(exp_date as CHAR(50)) = '0000-00-00';

delete from daily_future_data
where CAST(exp_date as CHAR(50)) = '0000-00-00';

replace into daily_option_data_archive 
select * from daily_option_data dod ;

delete from daily_option_data;