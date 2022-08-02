package com.smhrd.model;




import java.math.BigDecimal;
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
public class Share {
 private BigDecimal board_seq;
 private String  article_title;
 private String  article_content;
 @NonNull
 private String  mem_id;
 private Timestamp article_date;
 private String  article_file;
 private String  article_link; //사장화됨,, 문자열 "0"
 private String  del_YN;  //대문자로 Y/N
 private String  article_state;
 private String  cat_name;
}
