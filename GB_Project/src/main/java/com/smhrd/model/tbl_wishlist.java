package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_wishlist {
	private BigDecimal WISH_SEQ;

	private int BOARD_SEQ;
	
	private String MEM_ID ;
	
	private Timestamp WISH_DATE;

}
