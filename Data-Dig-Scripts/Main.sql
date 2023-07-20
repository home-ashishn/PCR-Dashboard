-- call CALCULATE_PCR('2023-06-19','2023-06-26');

set @SYMBOL = 'TCS';

select pcr_eod_nse,pcr_data_whole.current_date from pcr_data_whole
where symbol = @SYMBOL;

/*select pcr_eod_nse,pcr_data_whole.current_date from pcr_data_whole
where symbol = @SYMBOL;*/

select min(pcr_eod_nse),max(pcr_eod_nse),month(pcr_data_whole.current_date) from pcr_data_whole
where symbol = @SYMBOL
group by month(pcr_data_whole.current_date);

select distinct exp_date  from daily_option_data_archive 
where symbol not in ('NIFTY','BANKNIFTY','FINNIFTY','MIDCPNIFTY');

/*select distinct symbol   from daily_option_data dod 
where exp_date  in ('2022-07-05');*/