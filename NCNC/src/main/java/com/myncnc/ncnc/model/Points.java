package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class Points {

	
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
	
	
	
}
