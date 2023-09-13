-- call CALCULATE_PCR('2023-08-09','2023-08-09');
-- call CALCULATE_FUTURE_INFO('2023-08-09','2023-08-09');

set @target_difference = 0.05;
set @days_difference = 1;
set @days_back_range = @days_difference+1;


select
	distinct pdw2.symbol ,
	pdw2.current_date,
	pdw2.pcr_eod_nse,
	pdw.current_date,
	pdw.pcr_eod_nse,
	n50.weightage
from
	pcr_data_whole pdw,
	pcr_data_whole pdw2,
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
	and pdw2. symbol = N50. symbol
	and pdw.current_date > date_sub(curdate() , interval @days_back_range day)
	and pdw.current_date = date_add(pdw2.current_date, interval @days_difference day )
	and abs(pdw.pcr_eod_nse - pdw2.pcr_eod_nse) >= @target_difference
	-- and pdw.stock_pcr_correlation > 0.8
order by
	pdw2.current_date desc,weightage desc;



select
	distinct pdw2.symbol ,
	pdw2.current_date,
	pdw2.pcr_eod_nse,
	pdw.current_date,
	pdw.pcr_eod_nse,
	n50.weightage
from
	pcr_data_whole pdw,
	pcr_data_whole pdw2,
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
	and pdw2. symbol = N50. symbol
	and pdw.current_date > date_sub(curdate() , interval @days_back_range day)
	and pdw.current_date = date_add(pdw2.current_date, interval @days_difference day )
	and abs(pdw.pcr_eod_nse - pdw2.pcr_eod_nse) >= @target_difference
	-- and pdw.stock_pcr_correlation > 0.8
order by
	pdw2.current_date desc,weightage desc;