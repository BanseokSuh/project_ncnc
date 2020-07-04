package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class CartMemberItemOptionsImages {
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
			
		/** (Item 테이블과의 join) */
		/** 상품 출시일 */
		private String item_rel;
		/** 상품 조회수 */
		private int item_hit;
		/** 상품 재고수량 */
		private int item_cnt;
		
		/** (Options 테이블과의 join) */
		/** 옵션 일련번호 */
		private int opt_no;
		/** 옵션명 */
		private String opt_name;
		/** 옵션가격 */
		private int opt_price;
		/** 구매 일련번호 */
		private int ord_no;
		
		/** (Images 테이블과의 join) */
		/** 이미지 일련번호 */
		private int id;
		/** 이미지 파일 원본이름 */
		private String origin_name;
		/** 이미지 저장경로 */
		private String file_path;
		/** 이미지 파일 형식 */
		private String content_type;
		/** 이미지 파일 용량 */
		private int file_size;
		/** 이미지 타입
		 * (A=상품 대표이미지, B=상품 썸네일 이미지, C=상품 상세설명 이미지, 
		 * D=뉴스 이미지, E=이벤트 이미지, F=오더 상품 썸네일, G=쿠폰 이미지) */		 
		private String img_type;
		/** 부모 테이블의 일련번호 */
		private int parent_id;
		

		
	
	    
}
