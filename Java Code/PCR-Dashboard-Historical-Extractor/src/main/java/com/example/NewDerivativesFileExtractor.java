package com.example;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.firefox.FirefoxProfile;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

//@Component
public class NewDerivativesFileExtractor {

	private WebDriver driver;
	private Map<String, Object> vars;

	String foldername = "";

	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	public NewDerivativesFileExtractor() {

		try {
			setUp();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	@SuppressWarnings("deprecation")
	private void setUp() throws Exception {

		System.setProperty("webdriver.chrome.driver",
				"D:\\self\\work\\projects\\PCR-Dashboard\\chromedriver_win32\\chromedriver.exe");
		ChromeOptions chrome_options = new ChromeOptions();

		driver = new ChromeDriver();
		// js = (JavascriptExecutor) driver;
		// vars = new HashMap<String, Object>();

		if ("Mac OS X".equals(System.getProperty("os.name"))) {
			foldername = "/Users/ashishnarang/nse-product-artifacts/NSE_Downloads/FO_Historical";
		} else {
			foldername = "D:\\Self\\\\Work\\NSE Files Info\\NSE_Downloads\\FO_Historical";
		}
		/*
		 * chrome_options.add add_experimental_option("download.prompt_for_download",
		 * "false") chrome_options.add_experimental_option("download.default_directory",
		 * "/tmp")
		 */

		/*
		 * profile.set("browser.download.dir", foldername);
		 * profile.setPreference("pref.downloads.disable_button.edit_actions", false);
		 * profile.setPreference("browser.download.folderList", 2);
		 * profile.setPreference("browser.download.lastDir", foldername);
		 * profile.setPreference("browser.download.manager.closeWhenDone", true);
		 * profile.setPreference("browser.helperApps.neverAsk.saveToDisk",
		 * "application/csv, text/csv application/zip application/msexcell application/vnd.ms-excel text/plain"
		 * );
		 */

		driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);

		driver.get("https://www.nseindia.com/all-reports-derivatives");

		Thread.sleep(500);

		driver.findElement(By.linkText("Archives")).click();
	}

	private void downloadDataForDateRange(String dateFromString, String dateToString) throws Exception {

		Calendar cal = Calendar.getInstance();

		Date dateTo = null;

		if (dateToString == null || "".equals(dateToString)) {
			dateTo = cal.getTime();
		}

		Date dateFrom = null;
		cal.add(Calendar.DATE, -90);

		dateFrom = cal.getTime();

		Date dateCounter = dateFrom;

		/*
		 * ThreadPoolExecutor executor = new ThreadPoolExecutor(7, 14, 0L,
		 * TimeUnit.MILLISECONDS, new LinkedBlockingQueue<Runnable>());
		 */

		while (dateCounter.before(dateTo)) {

			String calculatedDateTarget = new SimpleDateFormat("dd-MM-yyyy").format(dateFrom);

			String downloadDateTarget = new SimpleDateFormat("ddMMyyyy").format(dateFrom);

			downloadFileByDateRange(calculatedDateTarget, downloadDateTarget);

			Calendar calNew = Calendar.getInstance();

			calNew.setTime(dateFrom);

			calNew.add(Calendar.DATE, 1);

			dateFrom = calNew.getTime();

			dateCounter = dateFrom;

		}

	}

	private void downloadFileByDateRange(String dateTarget, String downloadDateTarget) throws Exception {

		// driver.get(baseUrl /*+
		// "/products/content/equities/equities/eq_security.htm"*/);
		/*
		 * driver.get("https://www.nseindia.com/all-reports-derivatives");
		 * 
		 * Thread.sleep(500);
		 * 
		 * driver.findElement(By.linkText("Archives")).click();
		 */

		// driver.findElement(By.id("cr_deriv_equity_archives_date")).click();
		// driver.findElement(By.id("cr_deriv_equity_archives_date")).clear();
		driver.findElement(By.id("cr_deriv_equity_archives_date")).sendKeys(dateTarget);

		try {
			driver.findElement(By.cssSelector("#cr_deriv_equity_archives .col-lg-4:nth-child(9) .pdf-download-link"))
					.click();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		/*
		 * try { driver.findElement(By.linkText("fo" + downloadDateTarget +
		 * ".zip")).click(); } catch (Exception e) { // TODO Auto-generated catch block
		 * }
		 */

		Thread.sleep(2000);

	}

	public static void main(String[] args) throws Exception {

		NewDerivativesFileExtractor opExtractor = new NewDerivativesFileExtractor();

		opExtractor.downloadDataForDateRange("", "");
	}

	/*
	 * private void sop(String text) {
	 * 
	 * // System.out.println(text); }
	 */

	boolean extractDerivativesFiles(String fromDate, String toDate) {

		return true;
	}
}
