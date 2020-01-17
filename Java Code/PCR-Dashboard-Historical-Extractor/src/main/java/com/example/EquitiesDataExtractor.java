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
public class EquitiesDataExtractor {
	
	
	String folderName = "";
	
	 @Autowired
	 private JdbcTemplate jdbcTemplate;
	
	public EquitiesDataExtractor() {

		try {
			setUp();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}
	
	
	private void setUp() {
		
		folderName = "E:\\\\Self\\\\Work\\\\NSE Files Info\\\\NSE_Downloads\\\\EQ_Historical\\\\csv";
	}


	
	

	
	private void loadDataToDB(String filePath, String dateOfUpload,  int retryCount) throws Exception {

//		 filePath = filePath.replace("\\\\", "\\\\");
		// filePath = filePath.replace("\\\\", "/");


		if (retryCount <= 0) {
			return;
		}



		String sql = "LOAD DATA LOCAL INFILE '" + filePath + "' " + "INTO TABLE daily_equity_data "
				+ "FIELDS TERMINATED BY ',' "
				// + "OPTIONALLY ENCLOSED BY '\"' "
				// + " LINES TERMINATED BY '\r\n' "
				 + "IGNORE 1 LINES " //+ "IGNORE 1 COLUMNS "
				+ "(SYMBOL,series,open_price,high_price,low_price,close_price,last_price,"
				+ "previous_close,traded_quantity,traded_value,@dummy,no_of_trades) " 
				+ "set curr_date = str_to_date('"+dateOfUpload+"','%d%b%Y') ";

		

		try {

			jdbcTemplate.update(sql);

		} catch (Exception e) {
			e.printStackTrace();
			loadDataToDB(filePath, dateOfUpload, --retryCount);
		} finally {
			
		}

	}

	
	private void loadNiftyDataToDB(String filePath, int retryCount) throws Exception {

//		 filePath = filePath.replace("\\\\", "\\\\");
		// filePath = filePath.replace("\\\\", "/");


		if (retryCount <= 0) {
			return;
		}



		String sql = "LOAD DATA LOCAL INFILE '" + filePath + "' " + "INTO TABLE daily_equity_data "
				+ "FIELDS TERMINATED BY ',' "
				 + "OPTIONALLY ENCLOSED BY '\"' "
				// + " LINES TERMINATED BY '\r\n' "
				 + "IGNORE 1 LINES " //+ "IGNORE 1 COLUMNS "
				+ "(@my_date,open_price,high_price,low_price,close_price,traded_quantity,traded_value) \r\n" + 
				"		set curr_date = str_to_date(@my_date,'%d-%b-%Y'),\r\n" + 
				"		last_price = close_price, symbol = 'NIFTY',series = 'EQ' ";
		
		


		

		try {

			jdbcTemplate.update(sql);

		} catch (Exception e) {
			e.printStackTrace();
			loadNiftyDataToDB(filePath, --retryCount);
		} finally {
			
		}

	}



/*	public static void main(String[] args) throws Exception {

		FuturesDataExtractor opExtractor = new FuturesDataExtractor();

		opExtractor.loadDataToDB(opExtractor.folderName+"\\\\op01032019.csv","01032019",3);
	}*/
	
	public void manageExtraction() throws Exception {
		
		// loadDataToDB(folderName+"\\\\op01032019.csv","01032019",3);
		
		//loadDataToDB(this.folderName+"\\\\fo01032019.csv","01032019",3);
		
		loadDataForDateRange();
		
		loadNiftyDataToDB("E:\\\\Self\\\\Work\\\\NSE Files Info\\\\NSE_Downloads\\\\Index_Historical\\\\csv\\\\data.csv",3);
	}
	
	private void loadDataForDateRange() throws Exception {

		Calendar cal = Calendar.getInstance();

		Date dateTo = cal.getTime();

		cal.add(Calendar.DATE, -2);

		Date dateTarget = cal.getTime();

		Date dateCounter = dateTarget;

		ThreadPoolExecutor executor = new ThreadPoolExecutor(7, 14, 0L, TimeUnit.MILLISECONDS,
				new LinkedBlockingQueue<Runnable>());

		while (dateCounter.before(dateTo)) {


			String downloadDateTarget = new SimpleDateFormat("ddMMMyyyy").format(dateTarget);

			loadDataToDB(folderName+"\\\\cm"+downloadDateTarget+ "bhav.csv",downloadDateTarget,3);

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
