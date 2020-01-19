package com.example.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name="pcr_data_whole")
@IdClass(PCRDataWholeId.class)
public class PCRDataWhole {
	

	@Column(name = "symbol")
	@Id
	@JsonProperty
	private String symbol;
	@Column(name = "curr_date")
	@Id
	@JsonProperty
	private Date currentDate;

	@Column(name = "pcr_eod_nse")
	@JsonProperty
	private Float pcrEODNSE;
	
	
	@Column(name = "eq_close_price")
	@JsonProperty
	private Float eqClosePrice;
	
	
	@Column(name = "pcr_oi_whole")
	@JsonProperty
	private Double pcrOIWhole;
	
	
	
	public PCRDataWhole() {
		super();
	}



	public PCRDataWhole(String symbol, Date currentDate, Float pcrEODNSE, Float eqClosePrice, Double pcrOIWhole) {
		super();
		this.symbol = symbol;
		this.currentDate = currentDate;
		this.pcrEODNSE = pcrEODNSE;
		this.eqClosePrice = eqClosePrice;
		this.pcrOIWhole = pcrOIWhole;
	}








	

	

}
