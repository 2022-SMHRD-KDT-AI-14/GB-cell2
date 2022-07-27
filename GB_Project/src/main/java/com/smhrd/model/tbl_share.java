package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_share {
	private BigDecimal BOARD_SEQ;

	private String ARTICLE_TITLE;
	
	private String ARTICLE_CONTENT;
	
	private String MEM_ID ;
	
	private Timestamp ARTICLE_DATE;
	
	private String ARTICLE_FILE;
	
	private String ARTICLE_LINK ;
	
	private String DEL_YN ;
	
	private String ARTICLE_STATE;
	
	private String CAT_NAME;
}
