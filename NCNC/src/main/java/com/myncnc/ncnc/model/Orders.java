package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class Orders {

	/** 1) 기본 컬럼 */
	//오더테이블 일련번호(PK)
	private int ord_no;
	//배송메모
	private String ord_memo;
	//구매수
	private int ord_qty;
	//입금은행(번호로 타입을 나눌것임)
	private int ord_bank;
	//입금자명
	private String ord_payer;
	//주문상태(A=입금확인중,B=상품준비중,C=배송준비중,D=배송중,E=구매확정,F=반품요청,G=반품중,H=환불완료)
	//default = 'A'
	private String ord_status;
	//배송비(default = 2500)
	private int ord_delivery;
	//구매일시
	private String reg_date;
	//최종변경일시(ex : 구매취소)
	private String edit_date;
	//제조사
	private String item_brand;
	//상품명
	private String item_name;
	//CPU 종류
	private String item_cpu;
	//화면크기
	private float item_inch;
	//메모리용량
	private int item_ram;
	//운영체제
	private String item_os;
	//무게
	private float item_weight;	
	//그래픽
	private String item_graphic;	
	//SSD용량
	private int item_ssd;	
	//HDD용량
	private int item_hdd;	
	//상품가격
	private int	item_price;	
	//할인율(%)
	private int	item_discount;
	//우편번호
	private String mem_postcode;
	//배송 기본주소
	private String mem_addr1;
	//배송 상세주소
	private String mem_addr2;
	private String mem_receiver;
	//받는사람 연락처
	private String mem_tel;
	
	
	
	/** 2) join절에 따른 추가 컬럼 */
	//제품을 구매한 회원번호(member에서 join)
	private int mem_no;
	private int opt_no;
	
	//상품에 대한 이미지의 번호(images에서 join)
	private int parent_id;
	//이미지의 타입(images에서 join)
	private String img_type;
	
	
	
	
	
}
