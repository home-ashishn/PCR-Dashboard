package com.example;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class OptionsDataExtractor {
	
	
	String folderName = "";
	
	 @Autowired
	 private JdbcTemplate jdbcTemplate;
	
	public OptionsDataExtractor() {

		try {
			setUp();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	
	private void setUp() {
		
		folderName = "E:\\\\Self\\\\Work\\\\NSE Files Info\\\\NSE_Downloads\\\\FO_Historical\\\\csv";
	}


	
	

	
	private void loadDataToDB(String filePath, String dateOfUpload,  int retryCount) throws Exception {

//		 filePath = filePath.replace("\\\\", "\\\\");
		// filePath = filePath.replace("\\\\", "/");


		if (retryCount <= 0) {
			return;
		}



		String sql = "LOAD DATA LOCAL INFILE '" + filePath + "' " + "INTO TABLE daily_option_data "
				+ "FIELDS TERMINATED BY ',' "
				// + "OPTIONALLY ENCLOSED BY '\"' "
				// + " LINES TERMINATED BY '\r\n' "
				 + "IGNORE 1 LINES " //+ "IGNORE 1 COLUMNS "
				+ "(@dummy,SYMBOL,@my_date,strike_price,option_type,open_price,high_price,low_price,close_price,"
				+ "open_interest,traded_quantity,no_of_contracts,no_of_trades,notional_value,"
				+ "premium_value) " + "set exp_date = str_to_date(@my_date,'%d/%m/%Y'),"
						+ " curr_date = str_to_date('"+dateOfUpload+"','%d%m%Y') ";

		

		try {

			jdbcTemplate.update(sql);

		} catch (Exception e) {
			e.printStackTrace();
			loadDataToDB(filePath, dateOfUpload, --retryCount);
		} finally {
			
		}

	}


	public static void main(String[] args) throws Exception {

		OptionsDataExtractor opExtractor = new OptionsDataExtractor();

		opExtractor.loadDataToDB(opExtractor.folderName+"\\\\op01032019.csv","01032019",3);
	}
	
	public void manageExtraction() throws Exception {
		
		// loadDataToDB(folderName+"\\\\op01032019.csv","01032019",3);
		
		loadDataForDateRange();
	}
	
	private void loadDataForDateRange() throws Exception {

		Calendar cal = Calendar.getInstance();

		Date dateTo = cal.getTime();

		cal.add(Calendar.DATE, -365);

		Date dateTarget = cal.getTime();

		Date dateCounter = dateTarget;

		ThreadPoolExecutor executor = new ThreadPoolExecutor(7, 14, 0L, TimeUnit.MILLISECONDS,
				new LinkedBlockingQueue<Runnable>());

		while (dateCounter.before(dateTo)) {


			String downloadDateTarget = new SimpleDateFormat("ddMMyyyy").format(dateTarget);

			loadDataToDB(folderName+"\\\\op"+downloadDateTarget+".csv",downloadDateTarget,3);

			Calendar calNew = Calendar.getInstance();

			calNew.setTime(dateTarget);

			calNew.add(Calendar.DATE, 1);

			dateTarget = calNew.getTime();
			
			dateCounter = dateTarget;

		}

	}


	
/*	private void unzipFiles() {
		
		
	}*/

}
