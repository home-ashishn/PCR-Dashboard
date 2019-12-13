package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.model.PCRDataWhole;
import com.example.service.PCRDashboardService;

@RestController
public class PCRDashBoardRestController {
	
	@Autowired
	private PCRDashboardService pcrDashboardService;
	
	@RequestMapping(path="/pcrdata", method=RequestMethod.GET,produces="application/json")
	public @ResponseBody List<PCRDataWhole> getAllEmployees(){
		

		
		
		List<PCRDataWhole> allPCRData = pcrDashboardService.getAllPCRData();
		return allPCRData;
	}


}
