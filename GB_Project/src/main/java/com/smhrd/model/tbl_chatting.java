package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_chatting {
	private BigDecimal CT_SEQ;
	
	private BigDecimal CR_SEQ;

	private String MEM_ID ;
	
	private String CT_CONTNET;
	
	private Timestamp CT_DATE;
	
	
}
