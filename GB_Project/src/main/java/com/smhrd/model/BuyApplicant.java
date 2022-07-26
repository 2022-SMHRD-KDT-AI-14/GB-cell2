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
	private String buy_p_state;
	private String buy_c_state;
//	private BigDecimal cat_seq;
	private String buy_link;
	private int buy_pay;
	private char cat_name;
}

