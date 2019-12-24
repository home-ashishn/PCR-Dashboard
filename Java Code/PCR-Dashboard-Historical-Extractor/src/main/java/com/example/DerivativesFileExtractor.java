package com.example;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

//@Component
public class DerivativesFileExtractor {

	private WebDriver driver;
	private String baseUrl;

	String foldername = "";

	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	public DerivativesFileExtractor() {

		try {
			setUp();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	@SuppressWarnings("deprecation")
	private void setUp() throws Exception {
		baseUrl = "https://www.nseindia.com/products/content/derivatives/equities/archieve_fo.htm";

		FirefoxProfile profile = new FirefoxProfile();

		/*
		 * DesiredCapabilities capabilities = DesiredCapabilities.htmlUnit();
		 * 
		 * capabilities.setCapability("browser.download.dir",
		 * "D:\\NSE_Downloads\\Equity_Historical" );
		 */
		if ("Mac OS X".equals(System.getProperty("os.name"))) {
			foldername = "/Users/ashishnarang/nse-product-artifacts/NSE_Downloads/FO_Historical";
		} else {
			foldername = "E:\\Self\\\\Work\\NSE Files Info\\NSE_Downloads\\FO_Historical";
		}
		profile.setPreference("browser.download.dir", foldername);
		profile.setPreference("pref.downloads.disable_button.edit_actions", false);
		profile.setPreference("browser.download.folderList", 2);
		profile.setPreference("browser.download.lastDir", foldername);
		profile.setPreference("browser.download.manager.closeWhenDone", true);
		profile.setPreference("browser.helperApps.neverAsk.saveToDisk",
				"application/csv, text/csv application/zip application/msexcell application/vnd.ms-excel text/plain");

		// WebDriver driver;
		// if(driver == null){

		/*
		 * System.setProperty("webdriver.gecko.driver",
		 * "D:\\Software\\geckodriver-v0.16.1-win64\\geckodriver.exe");
		 */
		driver = new FirefoxDriver(profile);

		// driver = new HtmlUnitDriver(capabilities);

		//
		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

		driver.get(baseUrl /* + "/products/content/equities/equities/eq_security.htm" */);

	}

	/*
	 * private void downloadDataForDateRange() throws Exception {
	 * 
	 * Calendar cal = Calendar.getInstance();
	 * 
	 * Date dateTo = cal.getTime();
	 * 
	 * cal.add(Calendar.DATE, -90);
	 * 
	 * Date dateTarget = cal.getTime();
	 * 
	 * Date dateCounter = dateTarget;
	 * 
	 * ThreadPoolExecutor executor = new ThreadPoolExecutor(7, 14, 0L,
	 * TimeUnit.MILLISECONDS, new LinkedBlockingQueue<Runnable>());
	 * 
	 * while (dateCounter.before(dateTo)) {
	 * 
	 * 
	 * String calculatedDateTarget = new
	 * SimpleDateFormat("dd-MM-yyyy").format(dateTarget);
	 * 
	 * String downloadDateTarget = new
	 * SimpleDateFormat("ddMMyyyy").format(dateTarget);
	 * 
	 * 
	 * 
	 * Callable<?> callable = new Callable<Object>() { public String call() throws
	 * Exception {
	 * 
	 * downloadFileByDateRange(calculatedDateTarget,downloadDateTarget);
	 * 
	 * 
	 * return "";
	 * 
	 * } };
	 * 
	 * 
	 * if (executor.getQueue().size() > 3) { continue; }
	 * 
	 * else { executor.submit(callable);
	 * 
	 * Calendar calNew = Calendar.getInstance();
	 * 
	 * calNew.setTime(dateTarget);
	 * 
	 * calNew.add(Calendar.DATE, 1);
	 * 
	 * dateTarget = calNew.getTime();
	 * 
	 * }
	 * 
	 * }
	 * 
	 * }
	 */

	private void downloadDataForDateRange() throws Exception {

		Calendar cal = Calendar.getInstance();

		Date dateTo = cal.getTime();

		cal.add(Calendar.DATE, -235);

		Date dateTarget = cal.getTime();

		Date dateCounter = dateTarget;

		ThreadPoolExecutor executor = new ThreadPoolExecutor(7, 14, 0L, TimeUnit.MILLISECONDS,
				new LinkedBlockingQueue<Runnable>());

		while (dateCounter.before(dateTo)) {

			String calculatedDateTarget = new SimpleDateFormat("dd-MM-yyyy").format(dateTarget);

			String downloadDateTarget = new SimpleDateFormat("ddMMyyyy").format(dateTarget);

			downloadFileByDateRange(calculatedDateTarget, downloadDateTarget);

			Calendar calNew = Calendar.getInstance();

			calNew.setTime(dateTarget);

			calNew.add(Calendar.DATE, 1);

			dateTarget = calNew.getTime();
			
			dateCounter = dateTarget;

		}

	}

	private void downloadFileByDateRange(String dateTarget, String downloadDateTarget) throws Exception {

		// driver.get(baseUrl /*+
		// "/products/content/equities/equities/eq_security.htm"*/);
		Thread.sleep(500);

		driver.findElement(By.id("date")).click();
		driver.findElement(By.id("date")).clear();
		driver.findElement(By.id("date")).sendKeys(dateTarget);

		driver.findElement(By.id("h_filetype")).click();
		// driver.findElement(By.id("h_filetype")).clear();
		driver.findElement(By.id("h_filetype")).sendKeys("Market Activity Report");

		// driver.findElement(By.id("date")).click();

		try {
			driver.findElement(By.xpath(
					"id('wrapper_btm')/div[@class='main_content']/div[@class='content']/div[@class='archives']/div[@class='archive_search']/div[@class='view-data']/div[@class='viewdata-content']/input[@class='getdata-button']"))
					.click();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}

		try {
			driver.findElement(By.linkText("fo" + downloadDateTarget + ".zip")).click();
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}

		Thread.sleep(2000);

	}

	public static void main(String[] args) throws Exception {

		DerivativesFileExtractor opExtractor = new DerivativesFileExtractor();

		opExtractor.downloadDataForDateRange();
	}

/*	
 	private void sop(String text) {

		// System.out.println(text);
	}
*/
}
