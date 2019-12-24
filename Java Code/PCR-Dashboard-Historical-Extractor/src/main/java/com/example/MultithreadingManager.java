package com.example;

import java.util.Calendar;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

/*@Component
@Service*/
public class MultithreadingManager {

	@Autowired
	private DerivativesFileExtractor multithreadingExtractor;

	@Value("${scrapping.debug}")
	private boolean scrappingDebug;


	private void init() {}

	public void manageExtraction() throws Exception {
		
	}




	private void sop(String text) {

		System.out.println(text);
	}

}
