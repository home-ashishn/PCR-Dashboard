set @target_date = '2023-09-13';
call CALCULATE_PCR(@target_date,@target_date);
call CALCULATE_FUTURE_INFO(@target_date,@target_date);