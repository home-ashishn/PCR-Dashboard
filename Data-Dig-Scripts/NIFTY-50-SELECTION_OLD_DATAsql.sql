set @target_date = '2021-09-12';
set @period = 14;

select distinct  pdw2.symbol ,pdw2.current_date, pdw2.pcr_eod_nse, 
pdw.current_date, pdw.pcr_eod_nse
 from pcr_data_whole pdw,
pcr_data_whole pdw2 
where 1=1
 and pdw. symbol in (select symbol from nifty_50 where weightage >=1)
 and pdw2. symbol = pdw. symbol 
 and pdw.current_date >= date_sub(@target_date ,interval @period day)
  and pdw.current_date < @target_date
and pdw.current_date = date_add(pdw2.current_date,interval 1 day )
and abs(pdw.pcr_eod_nse - pdw2.pcr_eod_nse) >= 0.07
-- and pdw.stock_pcr_correlation > 0.8
order by pdw2.current_date desc;



select distinct  pdw2.symbol ,pdw2.current_date, pdw2.pcr_eod_nse, 
pdw.current_date, pdw.pcr_eod_nse
 from pcr_data_whole pdw,
pcr_data_whole pdw2 
where 1=1
 and pdw. symbol in (select symbol from nifty_50 where weightage < 1)
 and pdw2. symbol = pdw. symbol 
 and pdw.current_date >= date_sub(@target_date ,interval @period day)
  and pdw.current_date < @target_date
and pdw.current_date = date_add(pdw2.current_date,interval 1 day )
and abs(pdw.pcr_eod_nse - pdw2.pcr_eod_nse) >= 0.07
-- and pdw.stock_pcr_correlation > 0.8
order by pdw2.current_date desc;