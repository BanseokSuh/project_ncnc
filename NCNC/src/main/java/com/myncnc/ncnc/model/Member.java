package com.myncnc.ncnc.model;

import lombok.Data;

/*
 * 멤버 정보를 저장하기 위한 클래스
 */
@Data
public class Member {
	// 회원 일련번호
	private int mem_no;
	
	// 회원 아이디
	private String mem_id;
	
	// 회원 비밀번호
	private String mem_pw;
	
	// 회원이름
	private String mem_name;
	
	// 회원 이메일
	private String mem_email;
	
	// 회원 연락처
	private String mem_tel;
	
	// 회원 생년월일
	private String mem_birth;
	
	// 회원 성별
	private String mem_gender;
	
	// 회원 기본주소
	private String mem_addr1;
	
	// 회원 상세주소
	private String mem_addr2;
	
	// 회원 알림서비스
	private boolean mem_reply;
	
	// 회원 우편번호
	private String mem_postcode;
	
	// 가입일시
	private String reg_date;
	
	// 최종 변경일시
	private String edit_date;
}
