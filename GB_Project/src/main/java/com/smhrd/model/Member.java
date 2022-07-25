package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
@AllArgsConstructor
public class Member {
	@NonNull
	private String id;
	@NonNull
	private String pw;
	private String nick;
}
