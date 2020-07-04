package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class PointsMember {

	
	/* 포인트 일련번호(PK키) */
	private int po_no;

	/* 적립/사용 내역 */
	private String po_subject;

	/* 포인트(적립시 + 값, 사용시 - 값) */
	private int po_value;

	/* 포인트 유효일시 */
	private String po_limit_date;

	/* 등록일시*/
	private String reg_date;

	/* 최종변경일시 */
	private String edit_date;

	/* 회원일련번호 (멤버 참조) */
	private int mem_no;
	
	/* 멤버 테이블 */
	
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
