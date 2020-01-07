package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PCRDashBoardController {
	
	@RequestMapping(path="/", method=RequestMethod.GET)
	public String goHome(){
		return "index";
	}
	
	@RequestMapping(path="/pcr-otm", method=RequestMethod.GET)
	public String goToPCROTMPage(){
		return "pcr-otm-page";
	}
	
	@RequestMapping(path="/futures-info", method=RequestMethod.GET)
	public String goToFuturesInfoPage(){
		return "futures-info-page";
	}

}
