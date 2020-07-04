package com.myncnc.ncnc.service;



import com.myncnc.ncnc.model.Orders;


public interface OrdersService {

	/**
	 * 데이터 저장을 위한 select 기능 정의
		=> 주문완료 중 = ajax Controller에서 리스트를 한번 호출해야함 그때 필요한 select
	 * 
	 * */
	public Orders getselectItem(Orders input) throws Exception;
	
	
	/**
	 * 데이터 저장을 위한 기능 정의
	 * => 주문 페이지
	 * @param OrdersMemberPointsDeliveryCouponImagesItemOptions 저장할 정보를 담고있는  beans
	   @return int
	   @throws Exception
	 * **/
	public int addOrders(Orders input) throws Exception;
	
	
	/**
	 * 데이터 갱신을 위한 기능 정의
	 *  => 주문 취소페이지
	 * @param OrdersMemberPointsDeliveryCouponImagesItemOptions 수정할 정보를 담고있는  beans
	   @return int
	   @throws Exception
	 * 
	 * */
	public int editOrders(Orders input) throws Exception;



	
	
}
