package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_arbeit_applicant {
	private BigDecimal ARB_SEQ;
	
	private String MEM_ID ;
	
	private Timestamp ARB_DATE;
	
	private String ARB_P_STATE;
	
	private String ARB_C_STATE ;
	
	private String ARBEIT_TIME ;
	
	private String ARBEIT_SITE;
	
	private int ARBEIT_PAY;
	
	private String CAT_NAME;
}
