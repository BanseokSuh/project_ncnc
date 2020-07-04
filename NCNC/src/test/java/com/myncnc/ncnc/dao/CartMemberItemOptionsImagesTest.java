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

import com.myncnc.ncnc.model.CartMemberItemOptionsImages;

//JUnit에 의한 테스트 클래스로 정의
@RunWith(SpringJUnit4ClassRunner.class)
//Spring의 설정 파일들을 읽어들이도록 설정 ( **은 '모든' 이라는 의미 )
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
//웹 어플리케이션임을 명시
@WebAppConfiguration
//메서드 이름순서로 실행하도록 설정 ( 설정하지 않을 경우 무작위 순서로 실행됨 )
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class CartMemberItemOptionsImagesTest {
	
	// MyBatis의 SQL 세션 주입 설정
	@Autowired
	private SqlSession sqlSession;
	
	// 장바구니(A)/찜(B) 목록 리스트 전체 조회
	@Test
	public void testA() {
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
		input.setMem_no(1);
		input.setCart_type("A");
	   sqlSession.selectList("CartMemberItemOptionsImagesMapper.selectList", input);
	}
}
