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
	
	private BigDecimal ID_PAY;
	
	private String CAT_NAME;
	
	private BigDecimal BOARD_SEQ;

	public tbl_account_applicant(String mEM_ID, String aCCOUNT_P_STATE, String aCCOUNT_C_STATE, String iD_LINK,
			String iD_TIME, BigDecimal iD_PAY, String cAT_NAME, BigDecimal bOARD_SEQ) {
		super();
		MEM_ID = mEM_ID;
		ACCOUNT_P_STATE = aCCOUNT_P_STATE;
		ACCOUNT_C_STATE = aCCOUNT_C_STATE;
		ID_LINK = iD_LINK;
		ID_TIME = iD_TIME;
		ID_PAY = iD_PAY;
		CAT_NAME = cAT_NAME;
		BOARD_SEQ = bOARD_SEQ;
	}

	
}
