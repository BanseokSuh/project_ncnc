package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.Coupon;

// 쿠폰 데이터 관리 기능을 제공하기 위한 Service 계층
public interface CouponService {
	/*
	 * 쿠폰 데이터 상세 조회
	 * @param Coupon 조회할 쿠폰의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Coupon getCouponItem(Coupon input) throws Exception;
	
	/*
	 * 쿠폰 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<Coupon> getCouponList(Coupon input) throws Exception;
	
	/*
	 * 쿠폰 데이터가 저장되어 있는 갯수 조회
	 * @return int
	 * @throws Exception
	 */
	public int getCouponCount(Coupon input) throws Exception;
	
	/*
	 * 쿠폰 데이터 등록하기
	 * @param Coupon 저장할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int addCoupon(Coupon input) throws Exception;
	
	/*
	 * 쿠폰 데이터 수정하기
	 * @param Coupon 수정할 정보를 담고 있는 Beans
	 * @throws Exception
	 */
	public int editCoupon(Coupon input) throws Exception;
	
	/*
	 * 쿠폰 데이터 삭제하기
	 * @param Coupon 삭제할 멤버의 일련번호를 담고 있는 Beans
	 * @throws Exception
	 */
	public int deleteCoupon(Coupon input) throws Exception;
}
