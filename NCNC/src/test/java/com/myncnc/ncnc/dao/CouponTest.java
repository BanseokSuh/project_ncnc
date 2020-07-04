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

import com.myncnc.ncnc.model.Coupon;
import com.myncnc.ncnc.model.CouponMember;

//JUnit에 의한 테스트 클래스로 정의
@RunWith(SpringJUnit4ClassRunner.class)
//Spring의 설정 파일들을 읽어들이도록 설정 ( **은 '모든' 이라는 의미 )
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
//웹 어플리케이션임을 명시
@WebAppConfiguration
//메서드 이름순서로 실행하도록 설정 ( 설정하지 않을 경우 무작위 순서로 실행됨 )
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class CouponTest {
	// MyBatis 객체 주입
	@Autowired
	private SqlSession sqlSession;
	
	// 멤버가 가지고 있는 쿠폰 조회
	@Test
	public void testA() {
		CouponMember input = new CouponMember();
		input.setMem_no(2);
		sqlSession.selectList("CouponMemberMapper.selectList",input);
	}
	
	// 쿠폰 삭제
	@Test
	public void testB() {
		Coupon input = new Coupon();
		input.setCou_no(2);
		sqlSession.delete("CouponMapper.deleteItem",input);
	}
	
	// 쿠폰 발급
	@Test
	public void testC() {
		Coupon input = new Coupon();
		input.setMem_no(5);
		input.setCou_name("신규가입 쿠폰");
		input.setCou_condition(50000);
		input.setCou_exp("2020-05-28 00:00:00");
		input.setCou_max_price(5000);
		input.setCou_price(10);
		sqlSession.insert("CouponMapper.insertItem",input);
	}
}
