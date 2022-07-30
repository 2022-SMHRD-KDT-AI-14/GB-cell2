package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class MyPage {
	private String MEM_ID;
	
	private String MEM_PW;
	
	private String MEM_NICK ;
	private String MEM_NAME ;
	private String MEM_PHONE ;
	private String MEM_BANK_NUM ;
	private String MEM_JUMIN ;	
	private Timestamp MEM_JOINDATE;
	private String MEM_TYPE ;
	private String MEM_TEMPER ;
	private String MEM_AREA ;
	
}
