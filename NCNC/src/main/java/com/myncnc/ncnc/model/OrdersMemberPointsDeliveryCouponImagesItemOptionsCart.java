package com.myncnc.ncnc.model;


import lombok.Data;

@Data
public class OrdersMemberPointsDeliveryCouponImagesItemOptionsCart {

	/** 1) 오더 컬럼 */
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
	
	
	/** 2) 멤버 컬럼 */
	//멤버일련번호(PK)
	private int	mem_no;
	//아이디
	private String mem_id;
	//비밀번호
	private String mem_pw;
	//회원이름
	private String mem_name;
	//이메일
	private String mem_email;
	//연락처
	private String mem_tel;
	//생년월일
	private String mem_birth;
	//성별(1 = 남자, 2 = 여자)
	private String mem_gender;
	//기본주소
	private String mem_addr1;
	//상세주소
	private String mem_addr2;
	//알림서비스(1:1 문의내역 회신: 필요(Y), 불필요(N))
	private boolean	mem_reply;
	//우편번호
	private String mem_postcode;

	

	/** 3) 포인트 컬럼 */
	//포인트 일련번호(PK)
	private int	po_no;
	//적립/사용 내역
	private String po_subject;
	//포인트(적립시 +값, 사용시 -값)
	private int	po_value;
	//포인트 유효일시
	private String po_limit_date;
	
	
	
	/** 4) 배송지관리 컬럼 */
	//배송지관리 일련번호(PK)
	private int	del_no;
	//주소 별칭
	private String del_nick;
	//우편번호
	private String del_postcode;
	//배송 기본주소
	private String del_addr1;
	//배송 상세주소
	private String del_addr2;
	//받는사람
	private String del_receiver;
	//받는사람 연락처
	private String del_tel;
	
	
	/** 5) 쿠폰 컬럼 **/
	//쿠폰 일련번호(PK)
	private int cou_no;
	//쿠폰명
	private String cou_name;
	//쿠폰 유효기간
	private String cou_exp;
	//쿠폰 할인율(%)
	private int cou_price;
	//쿠폰조건
	private int cou_condition;
	//최대 할인가격
	private int cou_max_price;
	
	
	
	/** 6) 이미지 컬럼 */
	//이미지 일련번호(PK)
	private int id;
	//이미지 파일 원본이름
	private String origin_name;
	//이미지 저장경로
	private String file_path;
	//이미지 파일 형식
	private String content_type;
	//이미지 파일 용량
	private int file_size;
	//이미지 타입 (A=상품 대표이미지, B=상품 썸네일 이미지, 
	//C=상품 상세설명 이미지, D=뉴스 이미지, E=이벤트 이미지,
	//F=오더 상품 썸네일, G=쿠폰 이미지)
	private String img_type;
	//부모 테이블의 일련번호
	private int parent_id;

	
	/** 7) 아이템 컬럼 **/
	//아이템 일련번호(PK)
	private int item_no;
	//상품출시일
	private String item_rel;
	//조회수
	private int item_hit;
	//재고수량
	private int item_cnt;

	
	/** 8) 옵션 컬럼  */
	//옵션 일련번호(PK)
	private int opt_no;
	//옵션 명
	private String opt_name;
	//옵션 추가 가격
	private int opt_price;
	
	
	/** 9) 카트 컬럼 */
	//장바구니 일련번호 (PK)
	private int cart_no;
	//상품의 수량
	private int cart_item_qty;
	//장바구니 타입(A=장바구니, B=찜)
	private String cart_type;
	
	//카트를 담을 배열변수 선언~
	private int[] cartlist;
	//바로구매 배열 담을 변수(item)
	private int[] itemlist;
	//바로구매 배열 담을 변수(options)
	private int[] optlist;
	
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
	//일반할인/옵션 더한 값 리스트 아이템에서 사용
	private int item_list_paymen;
	
	
	
	
	
	
	
			
}
