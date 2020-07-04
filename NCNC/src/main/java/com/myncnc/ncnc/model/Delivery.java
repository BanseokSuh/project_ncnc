package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class Delivery {
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
	
	
    
    
    
}
