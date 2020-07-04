package com.myncnc.ncnc.dao;


import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
/* Junit에 의한 테스트 클래스로 정의 */
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.myncnc.ncnc.model.Orders;
import com.myncnc.ncnc.model.OrdersMemberPointsDeliveryCouponImagesItemOptionsCart;



@RunWith(SpringJUnit4ClassRunner.class)

/*spring의 설정 파일들을 읽어들이도록 설정(**은 '모든' 이라는 의미)*/
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})

/* 웹 어플리케이션임을 명시 */
@WebAppConfiguration

/* 매서드 이름순서로 실행하도록 설정(설정하지 않을 경우 무작위 순서로 실행된) */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class OrdersTest {
	
/** MyBatis의 SQL 세션 주입 설정 **/
	@Autowired 
	private SqlSession sqlSession;
	
	
	/** 다중행 조회를 위한 기능정의 
    	=> 마이페이지 > 주문내역 (일부 노출)(myOrderList) 
    	selectPieceList */
	@Test
	public void testA() {
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		input.setMem_no(2);
		sqlSession.selectList("OrdersMemberPointsDeliveryCouponImagesItemOptionsMapper.selectPieceList", input);
	}
	
	
	/**
	 *	단일행 조회를 위한 기능정의 
    	=> 마이페이지 > 주문내역 > 하나의 주문내역 상세페이지 (전부노출)(myOrderDetail)
    	selectAllOne
	 * */
	@Test
	public void testB() {
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		input.setMem_no(2);
		input.setOrd_no(1);
		sqlSession.selectOne("OrdersMemberPointsDeliveryCouponImagesItemOptionsMapper.selectAllOne", input);
	}
	
	/**
	 *	단일행 조회를 위한 기능정의
		=> 주문페이지에 보여줘야하는 영역 (order)
		selectOrdersItem
	 * */
	@Test
	public void testC() {
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		input.setMem_no(2);
		input.setItem_no(1);
		sqlSession.selectOne("OrdersMemberPointsDeliveryCouponImagesItemOptionsMapper.selectOrdersItem", input);
	}
	
	
	/**
	 *	데이터 저장을 위한 기능 정의 
		=> 주문완료 페이지 = 오더에 저장되는 페이지(orderResult)
		insertOrders
	 * */
	@Test
	public void testD() {
		Orders input = new Orders();
		input.setOrd_memo("경비실에 맡겨주세여");
		input.setOrd_qty(2);
		input.setOrd_bank(1);
		input.setOrd_payer("이다은");
		input.setOrd_status("A");
		input.setOrd_delivery(2500);
		input.setReg_date("2019-12-20");
		input.setEdit_date("2020-12-10");
		input.setItem_brand("Lenovo");
		input.setItem_name("레노버 아이디어패드 S340-14IIL i5 Ten SLIM Edition");
		input.setItem_cpu("인텔 i5-10세대");
		input.setItem_inch(17);
		input.setItem_ram(8);
		input.setItem_os("운영체제 미포함");
		input.setItem_weight(1);
		input.setItem_graphic("Iris Plus Graphics");
		input.setItem_ssd(256);
		input.setItem_hdd(0);
		input.setItem_price(670710);
		input.setItem_discount(30);
		input.setMem_no(2);
		input.setMem_postcode("12346");
		input.setMem_addr1("서울시 동동시 동동동 11-2");
		input.setMem_addr2("3층");
		input.setMem_tel("0314334548");
		sqlSession.insert("OrdersMapper.insertOrders", input);
	}
	
	/**
	 * 	<!-- 데이터 갱신을 위한 기능 정의 
		=> 주문 취소 페이지(상태변경)(myOrderCancel)
		updateOrders
	 * */
	
	@Test
	public void testE() {
		Orders input = new Orders();
		input.setOrd_no(3);
		sqlSession.update("OrdersMapper.updateOrders", input);
	}
	
	
	/**
	 * 	회원탈퇴를 위한 null값 업데이트
		updateOrdersMemNull
	 * */
	
	@Test
	public void testF() {
		Orders input = new Orders();
		input.setOrd_no(2);
		sqlSession.update("OrdersMapper.updateOrdersMemNull", input);
	}
	
	
	@Test
	public void testG() {
		Orders input = new Orders();
		input.setOrd_no(3);
		sqlSession.selectOne("OrdersMapper.selectOrders", input);
	}
	
	
	
	
	
	
}
