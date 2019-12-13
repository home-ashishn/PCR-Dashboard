package com.example;

import org.springframework.beans.BeansException;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class PCRDashboardHistoricalExtractor {
	
	public static void main(String[] args) {
		SpringApplication.run(PCRDashboardHistoricalExtractor.class, args);
	}
	
	@Bean
	public String startApp(ApplicationContext ctx) throws BeansException, Exception {
		
		ctx.getBean(DataExtractor.class).manageExtraction();
		
		return "";
	}
}
