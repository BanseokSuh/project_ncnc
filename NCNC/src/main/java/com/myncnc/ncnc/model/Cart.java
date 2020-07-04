package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class Cart {
	// 1) 기본 컬럼
		/** 장바구니 일련번호 (PK) */
		private int cart_no;
		/** 상품의 수량 */
		private int cart_item_qty;
		/** 장바구니 등록일시 */
		private String reg_date;
		/** 장바구니 최종변경일시 */
		private String edit_date;
		/** 장바구니 타입(A=장바구니, B=찜) */
		private String cart_type;
		/** item 제조사 */
		private String item_brand;
		/** 상품명 */
		private String item_name;
		/** item cpu 종류 */
		private String item_cpu;
		/** item 화면 크기 */
		private float item_inch;
		/** item 메모리용량 */
		private int item_ram;
		/** item 운영체제 */
		private String item_os;
		/** item 무게 */
		private float item_weight;
		/** item 그래픽 */
		private String item_graphic;
		/** item SSD용량 */
		private int item_ssd;
		/** item HDD용량 */
		private int item_hdd;
		/** item 상품가격 */
		private int item_price;
		/** item 할인율(%) */
		private int item_discount;
		/** 회원 일련번호(MUL) */
		private int mem_no;
		/** 상품 일련번호(MUL) */
		private int item_no;
		
		    
}
