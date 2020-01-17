package com.example.model;

import java.io.Serializable;
import java.sql.Date;

public class FuturesInfoId implements Serializable{
	
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private String symbol;
	
	
	private Date currentDate;
	
	private Date expiryDate;



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


	public Date getExpiryDate() {
		return expiryDate;
	}


	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}




	


}
