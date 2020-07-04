package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class Item {

	// 상품 일련번호 
	private int item_no;
	// 제조사 
	private String item_brand;
	// 상품명  
	private String item_name;
	// CPU종류  
	private String item_cpu;
	// 화면크기 
	private int item_inch;
	// 메모리용량 
	private int item_ram;
	// 운영체제 
	private String item_os;
	// 무게 
	private int item_weight;
	// 그래픽 
	private String item_graphic;
	// SSD 용량 
	private int item_ssd;
	// HDD 용량 
	private int item_hdd;
	// 상품가격 
	private int item_price;
	// 상품 출시일 
	private String item_rel;
	// 상품 조회수 
	private int item_hit;
	// 할인율(%)
	private int item_discount;
	// 재고수량
	private int item_cnt;
	// 등록일시
	private String reg_date;
	// 최종변경일시
	private String edit_date;
}
