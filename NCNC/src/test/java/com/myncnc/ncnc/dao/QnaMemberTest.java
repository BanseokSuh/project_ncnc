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

import com.myncnc.ncnc.model.QnaMember;

/** JUnit에 의한 테스트 클래스로 정의 */
// import org.junit.runner.RunWith;
// import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미) */
// import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
// import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
// import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class QnaMemberTest {

	/** 목록 조회 테스트 */
	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private SqlSession sqlSession;

	/** 1:1 문의 > 입력 */
	@Test
	public void testA() {
		QnaMember input = new QnaMember();
		input.setQna_status("N");
		input.setQna_type(1);
		input.setQna_contents("테스트 값 뱉어내 이 친구야!!!~~~~~~~~~~");
		input.setMem_no(5);
		input.setReg_date("2020-01-01 00:00:00");
		input.setEdit_date("2020-03-03 00:00:00");
		sqlSession.insert("QnaMemberMapper.insertQnaMemberItem", input);
	}

	/** 1:1 문의 > 단일행 조회 */
	@Test
	public void testB() {
		QnaMember input = new QnaMember();
		input.setQna_no(4);
		input.setMem_no(6);
		sqlSession.selectOne("QnaMemberMapper.selectQnaMemberItem", input);
	}

	/** 1:1 문의 > 목록 조회 */
	@Test
	public void testC() {
		QnaMember input = new QnaMember();
		input.setMem_no(1);
		sqlSession.selectList("QnaMemberMapper.selectQnaMemberList", input);
	}

	/** 1:1 문의 > 삭제 */
	@Test
	public void testD() {
		QnaMember input = new QnaMember();
		input.setQna_no(12);
		input.setMem_no(5);
		sqlSession.delete("QnaMemberMapper.deleteQnaMemberItem", input);
	}

	/** 1:1 문의 > 수정 */
	@Test
	public void testE() {
		QnaMember input = new QnaMember();
		input.setQna_type(1);
		input.setQna_contents("테스트값 좋은말 할 때 뱉어내 이 xx야!!!!!!!!~~!!");
		input.setEdit_date("2020-01-01 00:00:00");
		input.setMem_no(5);
		input.setQna_no(8);
		sqlSession.update("QnaMemberMapper.editQnaMemberItem", input);

	}

}