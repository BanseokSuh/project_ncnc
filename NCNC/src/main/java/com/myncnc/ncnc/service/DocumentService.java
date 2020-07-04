package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.Document;


// 게시판 데이터 관리 기능을 제공하기 위한 Service 계층
public interface DocumentService {
	

	// qmenu > qNews 전체 목록페이지
	public List<Document> getNewsList(Document input) throws Exception;
		
	// qNews > newsDetail 상세페이지
	public Document getNewsItem(Document input) throws Exception;

	// Document 조회수 증가
	public void updateDocHit(Document input) throws Exception;
	
	// qmenu > qEvent(진행중) 전체 목록 조회
	public List<Document> getEventList(Document input) throws Exception;
	
	// qmenu > qEvent(종료) 전체 목록 조회
	public List<Document> getEventendList(Document input) throws Exception;

	// qEvent > eventDetail 상세페이지
	public Document getEventItem(Document input) throws Exception;
	
	// qEvent/eventDetail d-day 종료여부
	public void updateDocEnd(Document input) throws Exception;
	
	
	
}
