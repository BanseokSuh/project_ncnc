package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class DeliveryMember {
	// 1) 기본 컬럼
	/** 배송지 일련번호 (PK) */
	private int del_no;
	/** 주소 별칭 */
	private String del_nick;
	/** 우편번호 */
	private String del_postcode;
	/** item 제조사 */
	private String item_brand;
	/** 배송 기본주소 */
	private String del_addr1;
	/** 배송 상세주소 */
	private String del_addr2;
	/** 받는사람 */
	private String del_receiver;
	/** 받는사람 연락처 */
	private String del_tel;
	/** 배송지 등록일시 */
	private String reg_date;
	/** 배송지 최종변경일시 */
	private String edit_date;
	/** 회원 일련번호(MUL) */
	private int mem_no;
	
	// 2) JOIN 절에 따른 추가 컬럼
	/** (Member 테이블과의 join) */
	/** 회원 아이디 */
	private String mem_id;
	/** 비밀번호 */
	private String mem_pw;
	/** 회원 이름 */
	private String mem_name;
	/** 회원 이메일 */
	private String mem_email;
	/** 회원 연락처 */
	private String mem_tel;
	/** 회원 생년월일 */
	private String mem_birth;
	/** 회원 성별 */
	private String mem_gender;
	/** 회원 기본주소 */
	private String mem_addr1;
	/** 회원 상세주소 */
	private String mem_addr2;
	/** 회원 알림서비스 (default: 필요(Y)) */
	private Boolean mem_reply;
	/** 회원 우편번호 */
	private String mem_postcode;
	
	
	
	
    
    
}
