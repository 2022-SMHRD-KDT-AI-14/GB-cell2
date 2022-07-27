package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_invoice {
	private BigDecimal INV_SEQ;

	private String INV_NO;
	
	private String INV_DL_COMPANY;
	
	private String MEM_ID ;
	
}
