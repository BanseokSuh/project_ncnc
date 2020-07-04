package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.CouponMember;

//쿠폰과 멤버를 조인한 데이터 관리 기능을 제공하기 위한 Service 계층
public interface CouponMemberService {
	/*
	 * 멤버가 가지고 있는 쿠폰 데이터 상세 조회
	 * @param Coupon 조회할 쿠폰의 일련번호를 담고있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public List<CouponMember> getCouponMemberList(CouponMember input) throws Exception;
	

	public CouponMember getCouponItem(CouponMember input) throws Exception;
	
	public int getCouponCount(CouponMember input) throws Exception;
}
