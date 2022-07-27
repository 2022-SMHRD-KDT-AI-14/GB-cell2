package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class BuyApplicant {

	private BigDecimal buy_seq;
	@NonNull
	private String mem_id;
	private Timestamp buy_date;
	private String buy_p_state; //결제상태랑 연결?
	private char buy_c_state; //이거왜?
	private String buy_link;
	private int buy_pay;
	private char cat_name;
	private int board_seq;
	
}

