package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_buy_applicant {

	private BigDecimal BUY_SEQ;
	
	private String MEM_ID ;
	
	private Timestamp BUY_DATE;
	
	private String BUY_P_STATE;
	
	private String BUY_C_STATE ;
	
	private String BUY_LINK ;
	
	private String BUY_PAY;
	
	private String CAT_NAME;
	
}
