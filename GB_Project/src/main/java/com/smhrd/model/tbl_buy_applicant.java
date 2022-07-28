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
	
	private int BUY_PAY;
	
	private String CAT_NAME;

	public tbl_buy_applicant(String mEM_ID, String bUY_P_STATE, String bUY_C_STATE, String bUY_LINK, int bUY_PAY,
			String CAT_NAME) {
		super();
		MEM_ID = mEM_ID;
		BUY_P_STATE = bUY_P_STATE;
		BUY_C_STATE = bUY_C_STATE;
		BUY_LINK = bUY_LINK;
		BUY_PAY = bUY_PAY;
		CAT_NAME = CAT_NAME;
	}
	
}
