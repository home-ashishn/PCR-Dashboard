package com.example.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name="futures_info")
@IdClass(FuturesInfoId.class)
public class FuturesInfo {
	

	@Column(name = "symbol")
	@Id
	@JsonProperty
	private String symbol;
	@Column(name = "curr_date")
	@Id
	@JsonProperty
	private Date currentDate;
	@Column(name = "exp_date")
	@Id
	@JsonProperty
	private Date expiryDate;
	
	@Column(name = "total_oi")
	@JsonProperty
	private Float totalOI;
	
	@Column(name = "oi_change")
	@JsonProperty
	private Float oiChange;
	
	@Column(name = "futures_premium")
	@JsonProperty
	private Float futuresPremium;
	
	@Column(name = "day_premium_change")
	@JsonProperty
	private Float dayPremiumChange;
	
	@Column(name = "prev_date")
	@JsonProperty
	private Date prevDate;
	
	
	
	public FuturesInfo() {
		super();
	}



	public FuturesInfo(String symbol, Date currentDate, Date expiryDate, float totalOI, float oiChange,
			float futuresPremium, float dayPremiumChange, Date prevDate) {
		super();
		this.symbol = symbol;
		this.currentDate = currentDate;
		this.expiryDate = expiryDate;
		this.totalOI = totalOI;
		this.oiChange = oiChange;
		this.futuresPremium = futuresPremium;
		this.dayPremiumChange = dayPremiumChange;
		this.prevDate = prevDate;
	}





	

}
