package com.myncnc.ncnc.model;

import lombok.Data;

/*
 * 게시판 정보를 저장하기 위한 클래스
 */
@Data
public class DocumentImage {
	// 게시판 일련번호
	private int doc_no;
	
	// 게시판 글 제목
	private String doc_title;
	
	// 게시판 글 내용
	private String doc_contents;
	
	// 게시판 타입 ( A = 뉴스, B = 이벤트 )
	private String doc_type;
	
	// 게시판 조회수
	private int doc_hit;
	
	// 이벤트 D-day
	private String doc_day;
	
	// 이벤트 종료 여부
	private int doc_end;
	
	// 등록일시
	private String reg_date;
	
	// 최종변경일시
	private String edit_date;

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

}
