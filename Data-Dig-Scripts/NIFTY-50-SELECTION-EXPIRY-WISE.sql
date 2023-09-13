-- CALL `pcr_dashboard`.`CALCULATE_PCR`('2023-07-26','2023-07-28');
set @target_expiry_date = '2023-08-31';


 	set @target_difference = 0.05;
set @days_difference = 1;
set @days_back_range = @days_difference+1;

select
	distinct pdw2.symbol ,
	pdw2.curr_date,
	pdw2.pcr_eod_nse,
	pdw.curr_date,
	pdw.pcr_eod_nse,
	n50.weightage,pdw.expiry_date 
from
	pcr_data_whole_expiry_wise pdw,
	pcr_data_whole_expiry_wise pdw2,
	nifty_50 n50
where
	1 = 1
	and pdw. symbol in (
	select
		symbol
	from
		nifty_50
	where
		weightage >= 1)
	and pdw2. symbol = pdw. symbol
	and pdw.expiry_date = @target_expiry_date
    and pdw2.expiry_date  = pdw. expiry_date
	and pdw2. symbol = N50. symbol
	and pdw.curr_date > date_sub(curdate() , interval @days_back_range day)
	and pdw.curr_date = date_add(pdw2.curr_date, interval @days_difference day )
	and abs(pdw.pcr_eod_nse - pdw2.pcr_eod_nse) >= @target_difference
	-- and pdw.stock_pcr_correlation > 0.8
order by
	pdw2.curr_date desc,weightage desc;



select
	distinct pdw2.symbol ,
	pdw2.curr_date,
	pdw2.pcr_eod_nse,
	pdw.curr_date,
	pdw.pcr_eod_nse,
	n50.weightage,pdw.expiry_date
from
	pcr_data_whole_expiry_wise pdw,
	pcr_data_whole_expiry_wise pdw2,
	nifty_50 n50
where
	1 = 1
	and pdw. symbol in (
	select
		symbol
	from
		nifty_50
	where
		weightage <1)
	and pdw2. symbol = pdw. symbol
    and pdw.expiry_date = @target_expiry_date
	and pdw2.expiry_date  = pdw. expiry_date
	and pdw2. symbol = N50. symbol
	and pdw.curr_date > date_sub(curdate() , interval @days_back_range day)
	and pdw.curr_date = date_add(pdw2.curr_date, interval @days_difference day )
	and abs(pdw.pcr_eod_nse - pdw2.pcr_eod_nse) >= @target_difference
	-- and pdw.stock_pcr_correlation > 0.8
order by
	pdw2.curr_date desc,weightage desc;