package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class tbl_coordinate {

  private String MEM_ID;
  private int MEM_LATITUDE;
  private int MEM_LONGITUDE;
	
	
}
