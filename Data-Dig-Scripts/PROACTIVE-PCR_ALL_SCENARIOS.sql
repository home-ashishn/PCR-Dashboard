-- call CALCULATE_PCR('2023-07-28','2023-07-28');

set @SYMBOL = 'WIPRO';

select distinct  pdw2.current_date, pdw2.pcr_eod_nse, 
pdw.current_date, pdw.pcr_eod_nse
 from pcr_data_whole pdw,
pcr_data_whole pdw2, 
pcr_data_whole pdw3 
where 1=1
 and pdw. symbol = @SYMBOL 
 and pdw2. symbol = pdw. symbol 
 and pdw3. symbol = pdw. symbol 
 -- and pdw.current_date > date_sub(curtime() ,interval 10 minute)
 and pdw.current_date = date_add(pdw2.current_date,interval 1 day )
and pdw2.current_date = date_add(pdw3.current_date,interval 7 day )
and abs(pdw.pcr_eod_nse - pdw2.pcr_eod_nse) >= 0.02
and abs(pdw2.pcr_eod_nse - pdw3.pcr_eod_nse) >= 0.1
and (pdw.pcr_eod_nse - pdw2.pcr_eod_nse) * (pdw2.pcr_eod_nse - pdw3.pcr_eod_nse) < 0
-- and pdw.stock_pcr_correlation > 0.8
order by pdw2.current_date desc;


select pcr_eod_nse,pcr_data_whole.current_date from pcr_data_whole
where symbol = @SYMBOL order by pcr_data_whole.current_date desc;

/*select pcr_eod_nse,pcr_data_whole.current_date from pcr_data_whole
where symbol = @SYMBOL;*/

select min(pcr_eod_nse),max(pcr_eod_nse),
month(pcr_data_whole.current_date),year(pcr_data_whole.current_date)
from pcr_data_whole
where symbol = @SYMBOL
group by month(pcr_data_whole.current_date),year(pcr_data_whole.current_date);

select distinct exp_date  from daily_option_data_archive 
where symbol not in ('NIFTY','BANKNIFTY','FINNIFTY','MIDCPNIFTY');




/*select distinct symbol   from daily_option_data dod 
where exp_date  in ('2022-07-05');*/