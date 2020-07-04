package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class ItemImage {

	// 상품 일련번호
	private int item_no;
	// 제조사
	private String item_brand;
	// 상품명
	private String item_name;
	// CPU종류
	private String item_cpu;
	// 화면크기
	private float item_inch;
	// 메모리용량
	private int item_ram;
	// 운영체제
	private String item_os;
	// 무게
	private float item_weight;
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
	
	// 아이템 계산을 위한 임시 모델(가격 * 할인율)
	private int item_payment;

	
	// 이미지 일련번호
	private int id;
	// 이미지 파일 원본 이름
	private String origin_name;
	// 이미지 저장 경로
	private String file_path;
	// 이미지 파일 형식
	private String content_type;
	// 이미지 파일 용량
	private int file_size;
	// 이미지 타입 (A=상품 대표이미지, B=상품 썸네일 이미지, C=상품 상세설명 이미지, D=뉴스 이미지, E=이벤트 이미지, F=오더 상품 썸네일, G=쿠폰 이미지)
	private String img_type;
	// 부모 테이블 일련 번호 () 
	private int parent_id;
	
	/* 옵션 일련번호(PK키) */
	private int opt_no;

	/* 옵션명 */
	private String opt_name;
	
	/* 구매 일련번호 */
	private int ord_no;

	/* 옵션가격 */
	private int opt_price;
	
	/** sql에 등록한 임시 컬럼 */
	//총금액(쿠폰할인/기본할인/배송비/추가옵션금액/포인트)
	private int total_price;
	//쿠폰할인금액
	private int coupon_total;
	//기본할인금액
	private int dis_price;
	//중간 총금액(기본 할인)
	private int item_paymen;
	//년도월일만 가져와서 구매리스트에 뿌리기
	private String orders_date;

	/** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
    
    /** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
        ItemImage.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
    	ItemImage.listCount = listCount;
    }
}