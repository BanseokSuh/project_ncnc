package com.myncnc.ncnc.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.myncnc.ncnc.model.Document;

//JUnit에 의한 테스트 클래스로 정의
@RunWith(SpringJUnit4ClassRunner.class)
//Spring의 설정 파일들을 읽어들이도록 설정 ( **은 '모든' 이라는 의미 )
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
//웹 어플리케이션임을 명시
@WebAppConfiguration
//메서드 이름순서로 실행하도록 설정 ( 설정하지 않을 경우 무작위 순서로 실행됨 )
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class DocuementTest {
	// MyBatis 객체 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 이벤트 게시판 조회
	@Test
	public void testA() {
		Document input = new Document();
		input.setDoc_type("A");
		sqlSession.selectList("DocumentMapper.selectList",input);
	}
	
	// 이벤트 상세 내용 조회
	@Test
	public void testB() {
		Document input = new Document();
		input.setDoc_no(6);
		sqlSession.selectOne("DocumentMapper.selectItem",input);
	}
	
	// 뉴스 게시판 조회
	@Test
	public void testC() {
		Document input = new Document();
		input.setDoc_type("B");
		sqlSession.selectList("DocumentMapper.selectList",input);
	}
	
	// 뉴스 상세 내용 조회
	@Test
	public void testD() {
		Document input = new Document();
		input.setDoc_no(1);
		sqlSession.selectOne("DocumentMapper.selectItem",input);
	}
	
}
