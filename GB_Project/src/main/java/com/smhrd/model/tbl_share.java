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

	public tbl_share( String aRTICLE_TITLE, String aRTICLE_CONTENT, String mEM_ID,
			String aRTICLE_FILE, String aRTICLE_LINK, String dEL_YN, String aRTICLE_STATE, String cAT_NAME) {
		super();
		
		ARTICLE_TITLE = aRTICLE_TITLE;
		ARTICLE_CONTENT = aRTICLE_CONTENT;
		MEM_ID = mEM_ID;
		ARTICLE_FILE = aRTICLE_FILE;
		ARTICLE_LINK = aRTICLE_LINK;
		DEL_YN = dEL_YN;
		ARTICLE_STATE = aRTICLE_STATE;
		CAT_NAME = cAT_NAME;
	}
	
}
