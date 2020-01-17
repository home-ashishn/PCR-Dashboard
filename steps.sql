call CLEAN_DATA();

select max(curr_date) from daily_future_data;

select max(curr_date) from daily_option_data;

select max(curr_date) from daily_equity_data;


call CALCULATE_PCR('2020-01-16','2020-01-16'); 

call CALCULATE_FUTURE_INFO('2020-01-16','2020-01-16');

call CLEAN_DATA();

select max(curr_date) from futures_info;

select max(curr_date) from pcr_data_otm;

select max(curr_date) from pcr_data_whole;


select * from futures_info;

select * from pcr_data_whole;



