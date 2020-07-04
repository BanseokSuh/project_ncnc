package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.ReviewMemberItemImages;

public interface ReviewMemberItemImagesService {
	/**
	 * 다중 조회를 위한 기능 정의
		=> 상품상세페이지 > 해당 상품에 대한 리뷰들 조회
		 	@param ReviewMemberItemImages 조회할 아이템번호를 갖고있는 beans
		 	@return 조회된 데이터가 저장된 beans
		 	@throws Exception
	 * */
	public List<ReviewMemberItemImages> getListReivewItem(ReviewMemberItemImages input) throws Exception;
	
	/**
	 * 다중 조회를 위한 기능 정의 (상품상세에서 리뷰 확인)
		=> 상품상세페이지 > 해당 상품에 대한 리뷰들 조회
		 	@param ReviewMemberItemImages 조회할 아이템번호를 갖고있는 beans
		 	@return 조회된 데이터가 저장된 beans
		 	@throws Exception
	 * */
	public List<ReviewMemberItemImages> getListReivewItemDetail(ReviewMemberItemImages input) throws Exception;
	
	
	/**
	 * 다중행 조회를 위한 기능 정의 
		=> 마이페이지 > 내가 쓴 상품평 목록 조회
		@param ReviewMemberItemImages 조회할 멤버번호를 갖고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	public List<ReviewMemberItemImages> getListReivewMember(ReviewMemberItemImages input) throws Exception;
	
	
	/**
	 * 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 
		경우 Mapper에서는 requltMap이 아닌 resultType으로 반환한다.
		=> 해당 상품에 대한 리뷰의 개수
		@param ReviewMemberItemImages 조회할 아이템번호를 갖고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	public int getCountReivewItem(ReviewMemberItemImages input) throws Exception;
	
	
	/**
	 * 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 
		경우 Mapper에서는 requltMap이 아닌 resultType으로 반환한다.
		=> 사용자가 쓴 리뷰의 개수
		@param ReviewMemberItemImages 조회할 멤버번호를 갖고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	public int getCountReivewMember(ReviewMemberItemImages input) throws Exception;
	
	
}
