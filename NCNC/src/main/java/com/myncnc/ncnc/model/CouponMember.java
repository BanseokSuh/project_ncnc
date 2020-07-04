package com.myncnc.ncnc.model;

import lombok.Data;

/*
 * 쿠폰과 멤버가 조인한 데이터를 저장하기 위한 클래스
 */
@Data
public class CouponMember {
	// 쿠폰 일련번호
	private int cou_no;

	// 쿠폰 이름
	private String cou_name;

	// 쿠폰 유효기간
	private String cou_exp;

	// 쿠폰 할인율
	private int cou_price;

	// 쿠폰 조건
	private int cou_condition;

	// 쿠폰 최대 할인 가격
	private int cou_max_price;

	// 등록일시
	private String reg_date;

	// 최종변경일시
	private String edit_date;

	// Member 테이블
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

}
