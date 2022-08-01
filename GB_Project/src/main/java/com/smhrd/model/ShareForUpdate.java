package com.smhrd.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public class ShareForUpdate {
	
	private BigDecimal board_seq;
	private String article_state;
	private String cat_name;
		
	
}
