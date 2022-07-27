package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_chatroom {
	private BigDecimal CR_SEQ;

	private String CR_TITLE;
	
	private int CR_LIMIT;	
	
	private Timestamp CR_DATE;
	

}
