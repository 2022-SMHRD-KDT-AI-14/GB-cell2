package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_payment {
	private BigDecimal PAY_SEQ;

	private String MEM_ID ;
	
	private int PAY_MONEY;
	
	private Timestamp PAY_DATE;
	
	private String CAT_NAME;
	
}
