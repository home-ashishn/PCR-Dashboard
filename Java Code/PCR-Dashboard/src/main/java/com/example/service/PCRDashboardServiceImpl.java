package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.model.FuturesInfo;
import com.example.model.PCRDataOTM;
import com.example.model.PCRDataWhole;
import com.example.model.PCRDataWholeId;
import com.example.repository.FuturesInfoRepository;
import com.example.repository.PCRDataOTMRepository;
import com.example.repository.PCRDataWholeRepository;

@Service("employeeService")
public class PCRDashboardServiceImpl implements PCRDashboardService {

	@Autowired
	private PCRDataWholeRepository pcrDataWholeRepository;

	@Autowired
	private PCRDataOTMRepository pcrDataOTMRepository;

	
	@Autowired
	private FuturesInfoRepository futuresInfoRepository;

	@Override
	public List<PCRDataWhole> getAllPCRData() {
		return pcrDataWholeRepository.findAll();
	}

	@Override
	public PCRDataWhole getPCRDataBySymbol(PCRDataWholeId symbol) {
		return pcrDataWholeRepository.findOne(symbol);
	}

	@Override
	public List<PCRDataOTM> getPCRDataOTM() {
		return pcrDataOTMRepository.findAll();
	}

	@Override
	public List<FuturesInfo> getFuturesData() {
		// TODO Auto-generated method stub
		return futuresInfoRepository.findAll();
	}

}
