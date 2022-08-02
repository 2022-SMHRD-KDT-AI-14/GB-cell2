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
	
	private BigDecimal ARBEIT_PAY;
//	private int ARBEIT_PAY;
	
	private String CAT_NAME;

	private BigDecimal  BOARD_SEQ;

	public tbl_arbeit_applicant(String mEM_ID, String aRB_P_STATE, String aRB_C_STATE, String aRBEIT_TIME,
			String aRBEIT_SITE, BigDecimal aRBEIT_PAY, String cAT_NAME, BigDecimal bOARD_SEQ) {
		super();
		MEM_ID = mEM_ID;
		ARB_P_STATE = aRB_P_STATE;
		ARB_C_STATE = aRB_C_STATE;
		ARBEIT_TIME = aRBEIT_TIME;
		ARBEIT_SITE = aRBEIT_SITE;
		ARBEIT_PAY = aRBEIT_PAY;
		CAT_NAME = cAT_NAME;
		BOARD_SEQ = bOARD_SEQ;
	}

	public tbl_arbeit_applicant(String mEM_ID, String aRB_P_STATE, String aRB_C_STATE, String aRBEIT_TIME,
			String aRBEIT_SITE, BigDecimal aRBEIT_PAY, String cAT_NAME) {
		super();
		MEM_ID = mEM_ID;
		ARB_P_STATE = aRB_P_STATE;
		ARB_C_STATE = aRB_C_STATE;
		ARBEIT_TIME = aRBEIT_TIME;
		ARBEIT_SITE = aRBEIT_SITE;
		ARBEIT_PAY = aRBEIT_PAY;
		CAT_NAME = cAT_NAME;
	}

	public tbl_arbeit_applicant(String mEM_ID, BigDecimal bOARD_SEQ) {
		super();
		MEM_ID = mEM_ID;
		BOARD_SEQ = bOARD_SEQ;
	}

	
	
	
}
