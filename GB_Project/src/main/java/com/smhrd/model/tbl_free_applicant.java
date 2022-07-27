package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_free_applicant {
	private BigDecimal FREE_SEQ;

	private Timestamp FREE_DATE;
	
	private String MEM_ID ;

	private String FREE_P_STATE;
	
	private String FREE_C_STATE ;

	private String CAT_NAME;
	

}
