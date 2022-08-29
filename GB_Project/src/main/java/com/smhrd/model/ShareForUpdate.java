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
	public ShareForUpdate(BigDecimal board_seq, String article_state) {
		super();
		this.board_seq = board_seq;
		this.article_state = article_state;
	}
		
	
}
