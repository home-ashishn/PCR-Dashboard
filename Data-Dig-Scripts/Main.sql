-- call CALCULATE_PCR('2023-07-31','2023-07-31');

set @SYMBOL = 'M&M';
set @target_expiry_date = '2023-08-31';


select pcr_eod_nse,pcr_data_whole.current_date from pcr_data_whole
where symbol = @SYMBOL 
order by pcr_data_whole.current_date desc;

select pcr_eod_nse,pdwew.curr_date,expiry_date  from pcr_data_whole_expiry_wise pdwew 
where symbol = @SYMBOL
and expiry_date = @target_expiry_date
order by curr_date desc;

/*select pcr_eod_nse,pcr_data_whole.current_date from pcr_data_whole
where symbol = @SYMBOL;*/

select min(pcr_eod_nse),max(pcr_eod_nse),month(pcr_data_whole.current_date),
year(pcr_data_whole.current_date) from pcr_data_whole
where symbol = @SYMBOL
group by month(pcr_data_whole.current_date),
year(pcr_data_whole.current_date)
order by year(pcr_data_whole.current_date) desc,
month(pcr_data_whole.current_date) desc;;

select distinct exp_date  from daily_option_data_archive 
where symbol not in ('NIFTY','BANKNIFTY','FINNIFTY','MIDCPNIFTY');

/*select distinct symbol   from daily_option_data dod 
where exp_date  in ('2022-07-05');*/