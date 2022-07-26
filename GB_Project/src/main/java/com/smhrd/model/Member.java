package com.smhrd.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@NoArgsConstructor //기본생성자
@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class Member {
	
	@NonNull
	private String id;
	@NonNull
	private String pw;
	private String nick;
	private String name;
	private int age;//불필요
	private String job;//불필요
	private String phone;
	private String bank_num;
	private String jumin;
	private Timestamp  joindate;
	private char type; 
	private double tempter;
	private int trade_cnt;//불필요
	private int suc_cnt;//불필요
	private String area; 
	

//	@NonNull
//	private String id;
//	@NonNull
//	private String pw;
//	@NonNull
//	private String name;
//	@NonNull
//	private String nick;
//	@NonNull
//	private String jumin;
//	private String phone;
//	private String bank_num;
//	private Timestamp  joindate;
//	private String type; //회원등급
//	private float tempter;
//	private int trade_cnt;
//	private int suc_cnt;
//	private String area;
	
	
}
