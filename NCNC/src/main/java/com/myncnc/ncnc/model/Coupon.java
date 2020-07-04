package com.myncnc.ncnc.model;

import lombok.Data;

/*
 * 쿠폰 데이터를 저장하기 위한 클래스
 */
@Data
public class Coupon {
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
	
	// Join시 사용할 회원 일련번호
	private int mem_no;
}
