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

import com.myncnc.ncnc.model.Member;

// JUnit에 의한 테스트 클래스로 정의
@RunWith(SpringJUnit4ClassRunner.class)
// Spring의 설정 파일들을 읽어들이도록 설정 ( **은 '모든' 이라는 의미 )
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
// 웹 어플리케이션임을 명시
@WebAppConfiguration
// 메서드 이름순서로 실행하도록 설정 ( 설정하지 않을 경우 무작위 순서로 실행됨 )
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class MemberTest {
	// MyBatis의 SQL 세션 주입 설정
	@Autowired
	private SqlSession sqlSession;

	// 멤버 조회
	@Test
	public void testA() {
		Member input = new Member();
		input.setMem_id("ekdms9993");
		sqlSession.selectOne("MemberMapper.selectItem", input);
	}

	// 신규 가입
	@Test
	public void testB() {
		Member input = new Member();

		input.setMem_id("abczz33");
		input.setMem_pw("123123");
		input.setMem_name("테스트사람");
		input.setMem_email("abczz33@naver.com");
		input.setMem_tel("010-8756-1256");
		input.setMem_birth("1995-02-04");
		input.setMem_gender("1");
		input.setMem_postcode("06874");
		input.setMem_addr1("서울 강서구 우장산로");
		input.setMem_addr2("402호");
		input.setMem_reply(true);

		sqlSession.insert("MemberMapper.insertItem", input);
	}

	// 회원 정보 수정
	@Test
	public void testC() {
		Member input = new Member();

		input.setMem_no(6);
		input.setMem_id("abczz33");
		input.setMem_pw("123123");
		input.setMem_name("테스트사람");
		input.setMem_email("cjh5054@naver.com");
		input.setMem_tel("010-1792-2076");
		input.setMem_birth("1995-02-04");
		input.setMem_gender("1");
		input.setMem_postcode("06874");
		input.setMem_addr1("서울 강서구 우장산로");
		input.setMem_addr2("508호");
		input.setMem_reply(true);
		input.setReg_date("2020-04-27 00:00:00");

		sqlSession.update("MemberMapper.updateItem", input);
	}

	// 아이디 중복 체크
	@Test
	public void testD() {
		Member input = new Member();

		input.setMem_id("ironsoft");
		sqlSession.selectOne("MemberMapper.idCheck", input);
	}
}
