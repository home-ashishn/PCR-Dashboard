package com.example.model;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonProperty;

@Entity
@Table(name="pcr_data_otm")
@IdClass(PCRDataOTMId.class)
public class PCRDataOTM {
	

	@Column(name = "symbol")
	@Id
	@JsonProperty
	private String symbol;
	@Column(name = "curr_date")
	@Id
	@JsonProperty
	private Date currentDate;
	
	@Column(name = "pcr_otm_whole")
	@JsonProperty
	private Float pcrOTMWhole;
	
	@Column(name = "pcr_otm_current_month")
	@JsonProperty
	private Float pcrOTMCurrentMonth;
	
	@Column(name = "pcr_otm_next_month")
	@JsonProperty
	private Float pcrOTMNextMonth;
	
	@Column(name = "pcr_otm_current_week")
	@JsonProperty
	private Float pcrOTMCurrentWeek;
	
	@Column(name = "pcr_otm_next_week")
	@JsonProperty
	private Float pcrOTMNextWeek;
	
	
	@Column(name = "eq_close_price")
	@JsonProperty
	private Float eqClosePrice;
	
	@Column(name = "pcr_oi_otm")
	@JsonProperty
	private Double pcrOIOTM;
	
	
	
	
	
	
	
	public PCRDataOTM() {
		super();
	}







	public PCRDataOTM(String symbol, Date currentDate, Float pcrOTMWhole, Float pcrOTMCurrentMonth,
			Float pcrOTMNextMonth, Float pcrOTMCurrentWeek, Float pcrOTMNextWeek, Float eqClosePrice, Double pcrOIOTM) {
		super();
		this.symbol = symbol;
		this.currentDate = currentDate;
		this.pcrOTMWhole = pcrOTMWhole;
		this.pcrOTMCurrentMonth = pcrOTMCurrentMonth;
		this.pcrOTMNextMonth = pcrOTMNextMonth;
		this.pcrOTMCurrentWeek = pcrOTMCurrentWeek;
		this.pcrOTMNextWeek = pcrOTMNextWeek;
		this.eqClosePrice = eqClosePrice;
		this.pcrOIOTM = pcrOIOTM;
	}


























	

}
