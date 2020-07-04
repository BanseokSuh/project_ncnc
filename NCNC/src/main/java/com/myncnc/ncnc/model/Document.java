package com.myncnc.ncnc.model;

import lombok.Data;

/*
 * 게시판 정보를 저장하기 위한 클래스
 */
@Data
public class Document {
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

    /** LIMIT 절에서 사용할 조회 시작 위치 */
    private static int offset;
    
    /** LIMIT 절에서 사용할 조회할 데이터 수 */
    private static int listCount;
    
    public static int getOffset() {
        return offset;
    }
    
    public static void setOffset(int offset) {
        Document.offset = offset;
    }
    
    public static int getListCount() {
        return listCount;
    }
    
    public static void setListCount(int listCount) {
        Document.listCount = listCount;
    }
}
