package com.myncnc.ncnc.model;

import lombok.Data;

@Data 
public class Options {
	/* 옵션 일련번호(PK키) */
	private int opt_no;

	/* 옵션명 */
	private String opt_name;
	
	/* 구매 일련번호 */
	private int ord_no;
	
	/* 상품 일련번호 */
	private int item_no;

	/* 옵션가격 */
	private int opt_price;

	/* 등록일시*/
	private String reg_date;

	/* 최종변경일시 */
	private String edit_date;
	
}
