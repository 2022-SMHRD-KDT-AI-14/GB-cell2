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
	@NonNull
	private String buy_p_state; //결제상태랑 
	@NonNull
	private String buy_c_state; // 계좌이체
	@NonNull
	private String buy_link;
	@NonNull
	private int buy_pay;
	@NonNull
	private String cat_name;
	@NonNull
	private int board_seq;
	
}

