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

import com.myncnc.ncnc.model.Cart;

//JUnit에 의한 테스트 클래스로 정의
@RunWith(SpringJUnit4ClassRunner.class)
//Spring의 설정 파일들을 읽어들이도록 설정 ( **은 '모든' 이라는 의미 )
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
//웹 어플리케이션임을 명시
@WebAppConfiguration
//메서드 이름순서로 실행하도록 설정 ( 설정하지 않을 경우 무작위 순서로 실행됨 )
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class CartTest {
	
	// MyBatis의 SQL 세션 주입 설정
	@Autowired
	private SqlSession sqlSession;

	
    // 장바구니(A)/찜(B) 목록 리스트에 담긴 데이터 수 조회 
	@Test
	public void testA() {
		Cart input = new Cart();
		
		input.setMem_no(1);
		input.setCart_type("A");
	    
		sqlSession.selectOne("CartMapper.selectCountAll", input);
	}
    
    
	// 장바구니(A)/찜(B) 목록 리스트에 담기
	@Test
	public void testB() {
		Cart input = new Cart();
			
		input.setCart_item_qty(2);
		input.setReg_date("2020-01-13");
		input.setEdit_date("2020-02-01");
		input.setCart_type("A");
		input.setItem_brand("SAMSUNG");
		input.setItem_name("갤럭시북 플렉스 NT930QCT-A58M");
		input.setItem_cpu("인텔 i5-10세대");
		input.setItem_inch((float)13.3);
		input.setItem_ram(8);
		input.setItem_os("운영체제 미포함");
		input.setItem_weight((float)1.16);
		input.setItem_graphic("Iris Plus Graphics");
		input.setItem_ssd(256);
		input.setItem_hdd(0);
		input.setItem_price(1735000);
		input.setItem_discount(10);
		input.setMem_no(2);
		input.setItem_no(3);
		    
		sqlSession.insert("CartMapper.insertItem", input);
		}	
		
	       
	// 회원탈퇴를 위한 mem_no=null 처리
	@Test
	public void testC() {
		Cart input = new Cart();	
		
		input.setMem_no(2);
		
		sqlSession.update("CartMapper.updateItem", input);
	}
	
	
	// 장바구니(A)/찜(B) 목록 리스트에서 삭제
	@Test
	public void testD() {
		Cart input = new Cart();	
		
		input.setMem_no(1);
		input.setItem_no(3);
		
		sqlSession.delete("CartMapper.deleteItem", input);
	}		
	
}
