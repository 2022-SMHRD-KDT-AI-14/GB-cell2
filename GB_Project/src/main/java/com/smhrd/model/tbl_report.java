package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_report {
	private int R_SEQ;

	private String R_TITLE;
	
	private String R_CONTENT;
	
	private String MEM_ID ;
	
	private String R_STATE;
	
	private int BOARD_SEQ;
	
}
