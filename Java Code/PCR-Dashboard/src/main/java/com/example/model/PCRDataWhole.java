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
	@Column(name = "pcr_sod_bloomberg")
	@JsonProperty
	private float pcrSODBloomberg;
	@Column(name = "pcr_eod_bloomberg", nullable=true)
	@JsonProperty
	private float pcrEODBloomberg;
	@Column(name = "pcr_sod_nse")
	@JsonProperty
	private float pcrSODNSE;
	@Column(name = "pcr_eod_nse")
	@JsonProperty
	private float pcrEODNSE;
	
	
	
	public PCRDataWhole() {
		super();
	}



	public PCRDataWhole(String symbol, Date currentDate, float pcrSODBloomberg, float pcrEODBloomberg, float pcrSODNSE,
			float pcrEODNSE) {
		super();
		this.symbol = symbol;
		this.currentDate = currentDate;
		this.pcrSODBloomberg = pcrSODBloomberg;
		this.pcrEODBloomberg = pcrEODBloomberg;
		this.pcrSODNSE = pcrSODNSE;
		this.pcrEODNSE = pcrEODNSE;
	}
	

	

}
