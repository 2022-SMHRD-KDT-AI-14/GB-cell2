package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@AllArgsConstructor
@Getter
public class tbl_payment {
	private BigDecimal PAY_SEQ;
	
	private String MEM_ID ;
	
	private BigDecimal PAY_MONEY;
	
	private Timestamp PAY_DATE;
	
	private String CAT_NAME;
	
	private String PAY_TF;
	
	private BigDecimal BOARD_SEQ;

	public tbl_payment(String mEM_ID) {
		super();
		MEM_ID = mEM_ID;
	}

	public tbl_payment(BigDecimal pAY_SEQ, String mEM_ID, BigDecimal pAY_MONEY, Timestamp pAY_DATE, String cAT_NAME,
			String pAY_TF) {
		super();
		PAY_SEQ = pAY_SEQ;
		MEM_ID = mEM_ID;
		PAY_MONEY = pAY_MONEY;
		PAY_DATE = pAY_DATE;
		CAT_NAME = cAT_NAME;
		PAY_TF = pAY_TF;
	}

	public tbl_payment(String mEM_ID, BigDecimal bOARD_SEQ) {
		super();
		MEM_ID = mEM_ID;
		BOARD_SEQ = bOARD_SEQ;
	}


	
}
