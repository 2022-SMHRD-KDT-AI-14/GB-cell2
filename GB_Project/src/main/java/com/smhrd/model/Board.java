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
	
	private int buypay;
	
	private String buylink;

	private String idlink;
	
	private String idtime;
	
	private int  idpay;
	
	private String arbeittime;

	private String arbeitsite;
	
	private int arbeitpay;

	public Board(String name, String writer, String filename,String content, int buypay, String buylink) {
		super();
		this.name = name;
		this.writer = writer;
		this.filename =filename;
		this.content = content;
		this.buypay = buypay;
		this.buylink = buylink;
	}

	public Board(String name, String writer, String filename, String content, String idlink, String idtime,
			int idpay) {
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
			int arbeitpay) {
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
