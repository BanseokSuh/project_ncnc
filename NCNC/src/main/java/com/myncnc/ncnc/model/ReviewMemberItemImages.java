package com.myncnc.ncnc.model;
import lombok.Data;

@Data
public class ReviewMemberItemImages {

	/** 1) 기본 컬럼 */
	//상품평 테이블 일련번호(PK)
	private int rev_no;
	//상품평이미지 1
	private String rev_img1;
	//상품평이미지 1
	private String rev_img2;
	//상품평 별점(1~5 숫자당 별 1개씩)
	private int rev_star;
	//리뷰 제목
	private String rev_title;
	//리뷰 내용
	private String rev_contents;
	//등록일시
	private String reg_date;
	//최종변경일시
	private String edit_date;

	

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
	private int	mem_tel;
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
	
	/** 3) 아이템 컬럼 */
	//상품 일련번호(PK)
	private int	item_no;
	//제조사
	private String item_brand;
	//상품명
	private String item_name;
	//CPU종류
	private String item_cpu;
	//화면크기
	private int	item_inch;
	//메모리용량
	private int	item_ram;
	//운영체제
	private String item_os;
	//무게
	private int	item_weight;
	//그래픽
	private String item_graphic;
	//SSD용량
	private int	item_ssd;
	//HDD용량
	private int	item_hdd;
	//상품가격
	private int	item_price;
	//상품 출시일
	private String item_rel;
	//상품 조회수
	private int	item_hit;
	//할인율(%)
	private int	item_discount;
	//재고수량
	private int	item_cnt;

	
	/** 4) 이미지 컬럼 */
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
	
}
