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

	private BigDecimal BOARD_SEQ;

	public tbl_free_applicant(String mEM_ID, String fREE_P_STATE, String fREE_C_STATE, String cAT_NAME,
			BigDecimal bOARD_SEQ) {
		super();
		MEM_ID = mEM_ID;
		FREE_P_STATE = fREE_P_STATE;
		FREE_C_STATE = fREE_C_STATE;
		CAT_NAME = cAT_NAME;
		BOARD_SEQ = bOARD_SEQ;
	}

	

}
