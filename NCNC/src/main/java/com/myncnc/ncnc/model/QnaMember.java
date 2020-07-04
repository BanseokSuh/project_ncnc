package com.myncnc.ncnc.model;

import lombok.Data;

@Data
public class QnaMember {

	// qna 일련번호
	private int qna_no;
	// qna 답변여부 (완료(Y), 미완료(N))
	private String qna_status;
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

	
	// 아이디
	private String mem_id;
	// 비밀번호 
	private String mem_pw;
	// 회원명
	private String mem_name;
	// 이메일
	private String mem_email;
	// 연락처
	private String mem_tel;
	// 생년월일
	private String mem_birth;
	// 성별
	private String mem_gender;
	// 기본주소
	private String mem_addr1;
	// 상세주소
	private String mem_addr2;
	// 알림서비스 (1:1 문의내역 회신: 필요(Y), 불필요(N))
	private boolean mem_reply;
	// 우편번호
	private String mem_postcode;

}
