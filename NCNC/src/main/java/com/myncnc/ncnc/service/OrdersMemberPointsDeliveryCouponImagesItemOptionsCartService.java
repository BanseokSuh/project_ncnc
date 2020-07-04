package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.OrdersMemberPointsDeliveryCouponImagesItemOptionsCart;

public interface OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService {

	/**
	 * 다중행 조회를 위한 기능정의 
    	=> 마이페이지 > 주문내역 (내용 일부 노출, 최근 날짜별로)
    	 @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 조회할 멤버번호를 갖고있는 beans
		 @return 조회된 데이터가 저장된 beans
		 @throws Exception
	 * */
	public List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> getselectPieceList(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception;
	
	
	/**
	 * 단일행 조회를 위한 기능정의 
    	=> 마이페이지 > 주문내역 > 주문내역 상세페이지 (내용 전부노출)
    	 @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 조회할 멤버번호를 갖고있는 beans
		 @return 조회된 데이터가 저장된 beans
		 @throws Exception
	 * */
	public OrdersMemberPointsDeliveryCouponImagesItemOptionsCart getselectAllOne(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception;
	
	
	/**
	 *단일행 조회를 위한 기능정의
		=> 주문페이지에 보여줘야하는 영역 (order)
     @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 조회할 멤버번호를 갖고있는 beans
	 @return 조회된 데이터가 저장된 beans
	 @throws Exception
	 * */
	public List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> getselectOrdersItem(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception;
	
	/**
	 *단일행 조회를 위한 기능정의
		=> 주문페이지에 보여줘야하는 영역 (order)
		=> 카트에서 가져오는 부분(리스트)
     @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 조회할 멤버번호를 갖고있는 beans
	 @return 조회된 데이터가 저장된 beans
	 @throws Exception
	 * */	
	public List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> getselectOrdersCartList(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception;
	
	
	
	/**
	 * 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 
		경우 Mapper에서는 requltMap이 아닌 resultType으로 반환한다. 
		오더데이터가 저장되어 있는 갯수 조회
	 *   @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 검색조건을 가진 beans
		 @return int
		 @throws Exception
	 * */
	public int getselectCountOrdersAll(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception;
	
	
	
	public OrdersMemberPointsDeliveryCouponImagesItemOptionsCart getselectOrdermember(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception;
	
}
