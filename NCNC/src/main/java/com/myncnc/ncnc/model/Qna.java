package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class Qna {

	// qna 일련번호
	private int qna_no;
	// qna 답변여부 (완료(Y), 미완료(N))
	private boolean qna_status;
	// qna 질문유형
	private int qna_type;
	// qna 질문내용
	private String qna_contents;
	// 회원 일련번호
	private int mem_no;
	// 등록일시
	private String reg_date;
	// 최종변경일시
	private String edit_date;
}
