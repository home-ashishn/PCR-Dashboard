package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.PCRDataWhole;
import com.example.model.PCRDataWholeId;
import com.example.repository.PCRDataWholeRepository;

@Service("employeeService")
public class PCRDashboardServiceImpl implements PCRDashboardService {

	@Autowired
	private PCRDataWholeRepository pcrDataWholeRepository;

	@Override
	public List<PCRDataWhole> getAllPCRData() {
		return pcrDataWholeRepository.findAll();
	}

	@Override
	public PCRDataWhole getPCRDataBySymbol(PCRDataWholeId symbol) {
		return pcrDataWholeRepository.findOne(symbol);
	}

}
