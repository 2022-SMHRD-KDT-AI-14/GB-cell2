package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_account_applicant {
	private BigDecimal ACCOUNT_SEQ;
	
	private String MEM_ID ;
	
	private Timestamp ACCOUNT_DATE;
	
	private String ACCOUNT_P_STATE;
	
	private String ACCOUNT_C_STATE ;
	
	private String ID_LINK ;
	
	private String ID_TIME;
	
	private int ID_PAY;
	
	private String CAT_NAME;
}
