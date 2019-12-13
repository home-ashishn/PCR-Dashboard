package com.example.service;

import java.util.List;

import com.example.model.Employee;
import com.example.model.PCRDataWhole;
import com.example.model.PCRDataWholeId;

public interface PCRDashboardService {
	
	public List<PCRDataWhole> getAllPCRData();
	PCRDataWhole getPCRDataBySymbol(PCRDataWholeId symbol);
	
}
