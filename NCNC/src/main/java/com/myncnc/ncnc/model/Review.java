package com.myncnc.ncnc.model;
import lombok.Data;

@Data
public class Review {

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
	//멤버 번호
	private int mem_no;
	//아이템 번호
	private int item_no;

	
}












