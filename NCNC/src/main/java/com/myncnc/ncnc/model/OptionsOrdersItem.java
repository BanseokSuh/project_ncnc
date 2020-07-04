package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class OptionsOrdersItem {
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

	/* 등록일시 */
	private String reg_date;

	/* 최종변경일시 */
	private String edit_date;
	
	
	

	/* 오더 테이블 */

	/* 배송메모 */
	private String ord_memo;
	/* 구매수량 */
	private int ord_qty;
	/* 입금은행 */
	private int ord_bank;
	/* 입금자명 */
	private String ord_payer;
	/* 주문상태(A=입금확인중,B=상품준비중,C=배송준비중,D=배송중,E=구매확정,F=반품요청,G=반품중,H=환불완료) */
	private String ord_status;
	/* 배송비 */
	private int ord_delivery;
	/* 회원 일련번호 */
	private int mem_no;
	
	
	/* 아이템 테이블 */
	
	/* 제조사 */
	private String item_brand;
	/* 상품명 */

	private String item_name;
	/* CPU종류 */

	private String item_cpu;
	/* 화면크기 */

	private String item_inch;
	/* 메모리용량 */

	private int item_ram;
	/* 운영체제 */

	private String item_os;
	/* 무게 */
	private int item_weight;
	/* 그래픽 */
	private String item_graphic;
	/* SSD용량 */
	private int item_ssd;
	/* HDD용량 */
	private int item_hdd;
	/* 상품가격 */
	private int item_price;
	/* 할인율(%) */
	private int item_discount;

	/* 상품 출시일 */
	private String item_rel;
	/* 상품 조회수 */
	private int item_hit;
	/* 재고수량 */
	private int item_cnt;
}
