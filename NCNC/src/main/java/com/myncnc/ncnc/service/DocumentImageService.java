package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.DocumentImage;


// 게시판 데이터 관리 기능을 제공하기 위한 Service 계층
public interface DocumentImageService {
	

	// qmenu > qNews 전체 목록페이지
	public List<DocumentImage> getNewsList(DocumentImage input) throws Exception;
		
	// qNews > newsDetail 상세페이지
	public DocumentImage getNewsItem(DocumentImage input) throws Exception;

	// Document 조회수 증가
	public void updateDocHit(DocumentImage input) throws Exception;
	
	// qmenu > qEvent(진행중) 전체 목록 조회
	public List<DocumentImage> getEventList(DocumentImage input) throws Exception;
	
	// qmenu > qEvent(종료) 전체 목록 조회
	public List<DocumentImage> getEventendList(DocumentImage input) throws Exception;

	// qEvent > eventDetail 상세페이지
	public DocumentImage getEventItem(DocumentImage input) throws Exception;
	
	
}
