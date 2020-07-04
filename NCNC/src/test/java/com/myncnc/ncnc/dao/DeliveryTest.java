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

import com.myncnc.ncnc.model.Delivery;

//JUnit에 의한 테스트 클래스로 정의
@RunWith(SpringJUnit4ClassRunner.class)
//Spring의 설정 파일들을 읽어들이도록 설정 ( **은 '모든' 이라는 의미 )
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
//웹 어플리케이션임을 명시
@WebAppConfiguration
//메서드 이름순서로 실행하도록 설정 ( 설정하지 않을 경우 무작위 순서로 실행됨 )
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class DeliveryTest {
	
	// MyBatis의 SQL 세션 주입 설정
	@Autowired
	private SqlSession sqlSession;

	
	// 배송지관리 목록 리스트에 담기
	@Test
	public void testA() {
		Delivery input = new Delivery();
		
		input.setDel_nick("기숙사");
		input.setDel_postcode("33333");
		input.setDel_addr1("인천광역시 연수구 구월동");
		input.setDel_addr2("송도아파트 101동 102호");
		input.setDel_receiver("고길동");
		input.setDel_tel("010-9999-0001");
		input.setMem_no(3);
		input.setReg_date("2020-01-13");
		input.setEdit_date("2020-01-13");
		
		sqlSession.insert("DeliveryMapper.insertItem", input);
	}

	
    // 회원탈퇴를 위한 mem_no=null 처리
	@Test
	public void testB() {
		Delivery input = new Delivery();

		input.setMem_no(3);
		
		sqlSession.update("DeliveryMapper.updateItem", input);
	}	
	
  
    // 배송지관리 목록 리스트에서 삭제
	@Test
	public void testC() {
		Delivery input = new Delivery();

		input.setMem_no(2);
		input.setDel_no(2);
		
		sqlSession.delete("DeliveryMapper.deleteItem", input);
	}		
	
}
