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
	private float pcrOTMWhole;
	
	@Column(name = "pcr_otm_current_month")
	@JsonProperty
	private float pcrOTMCurrentMonth;
	
	@Column(name = "pcr_otm_next_month")
	@JsonProperty
	private float pcrOTMNextMonth;
	
	@Column(name = "pcr_otm_current_week")
	@JsonProperty
	private float pcrOTMCurrentWeek;
	
	@Column(name = "pcr_otm_next_week")
	@JsonProperty
	private float pcrOTMNextWeek;
	
	
	
	public PCRDataOTM() {
		super();
	}







	public PCRDataOTM(String symbol, Date currentDate, float pcrOTMWhole, float pcrOTMCurrentMonth,
			float pcrOTMNextMonth, float pcrOTMCurrentWeek, float pcrOTMNextWeek) {
		super();
		this.symbol = symbol;
		this.currentDate = currentDate;
		this.pcrOTMWhole = pcrOTMWhole;
		this.pcrOTMCurrentMonth = pcrOTMCurrentMonth;
		this.pcrOTMNextMonth = pcrOTMNextMonth;
		this.pcrOTMCurrentWeek = pcrOTMCurrentWeek;
		this.pcrOTMNextWeek = pcrOTMNextWeek;
	}












	

}
