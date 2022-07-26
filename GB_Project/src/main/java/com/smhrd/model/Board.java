package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;




@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class Board {
	
	private BigDecimal num;

	private String name;
	
	private String writer;

	private String filename;
	
	private String del;
	
	private String state;
	
	private BigDecimal views;
	
	private Timestamp uploadday;
	
	private String content;
	
	private String catgory;
	
	private String buypay;
	
	private String buylink;

	private String idlink;
	
	private String idtime;
	
	private String idpay;
	
	private String arbeittime;

	private String arbeitsite;
	
	private String arbeitpay;

	public Board(String name, String writer, String filename,String content, String buypay, String buylink) {
		super();
		this.name = name;
		this.writer = writer;
		this.filename =filename;
		this.content = content;
		this.buypay = buypay;
		this.buylink = buylink;
	}

	public Board(String name, String writer, String filename, String content, String idlink, String idtime,
			String idpay) {
		super();
		this.name = name;
		this.writer = writer;
		this.filename = filename;
		this.content = content;
		this.idlink = idlink;
		this.idtime = idtime;
		this.idpay = idpay;
	}

	public Board(String name, String writer, String filename,String content, String del, String arbeittime, String arbeitsite,
			String arbeitpay) {
		super();
		this.name = name;
		this.writer = writer;
		this.filename = filename;
		this.content = content;
		this.del = del;
		this.arbeittime = arbeittime;
		this.arbeitsite = arbeitsite;
		this.arbeitpay = arbeitpay;
	}

	public Board(String name, String writer, String filename, String content) {
		super();
		this.name = name;
		this.writer = writer;
		this.filename = filename;
		this.content = content;
	}

	
	
	
	
	
	
	
}
