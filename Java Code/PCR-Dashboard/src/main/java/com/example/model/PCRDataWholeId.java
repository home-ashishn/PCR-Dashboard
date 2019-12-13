package com.example.model;

import java.io.Serializable;
import java.sql.Date;

public class PCRDataWholeId implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private String symbol;
	
	
	private Date currentDate;


	public String getSymbol() {
		return symbol;
	}


	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}


	public Date getCurrentDate() {
		return currentDate;
	}


	public void setCurrentDate(Date currentDate) {
		this.currentDate = currentDate;
	}




	


}
