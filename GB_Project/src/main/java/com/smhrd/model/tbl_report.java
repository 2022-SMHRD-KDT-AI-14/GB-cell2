package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_report {
	private BigDecimal R_SEQ;

	private String R_TITLE;
	
	private String R_CONTENT;
	
	private Timestamp R_DATE;
	
	private String MEM_ID ;
	
}
