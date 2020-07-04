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

import com.myncnc.ncnc.model.Points;
import com.myncnc.ncnc.model.PointsMember;

//JUnit에 의한 테스트 클래스로 정의
@RunWith(SpringJUnit4ClassRunner.class)
//Spring의 설정 파일들을 읽어들이도록 설정 ( **은 '모든' 이라는 의미 )
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
//웹 어플리케이션임을 명시
@WebAppConfiguration
//메서드 이름순서로 실행하도록 설정 ( 설정하지 않을 경우 무작위 순서로 실행됨 )
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class PointsTest {
	// MyBatis 객체 주입
	@Autowired
	private SqlSession sqlSession;

	// 멤버가 가지고 있는 포인트 조회
	@Test
	public void testA() {
		PointsMember input = new PointsMember();
		input.setMem_no(2);
		sqlSession.selectList("PointsMemberMapper.selectItem", input);
	}

	// 멤버가 가지고 있는 포인트 갱신
	@Test
	public void testB() {
		Points input = new Points();
		input.setMem_no(5);
		input.setPo_value(50);
		sqlSession.update("PointsMapper.updateItem", input);

	}

}
