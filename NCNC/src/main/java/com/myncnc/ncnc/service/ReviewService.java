package com.myncnc.ncnc.service;


import com.myncnc.ncnc.model.Review;

public interface ReviewService {

	

	
	/**
	 * 데이터 저장을 위한 기능 정의 
		=> 리뷰 추가하기
		@param ReviewMemberItemImages 저장할 정보를 담고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	public int getaddReview(Review input) throws Exception;
	
	
	/**
	 *데이터 갱신을 위한 기능 정의
		=>내가 쓴 리뷰 수정하기
		@param ReviewMemberItemImages 수정할 정보를 담고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	public int geteditReview(Review input) throws Exception;
	
	
	/**
	 * 데이터 삭제를 위한 기능 정의
		=> 내가 쓴 리뷰 삭제하기
		@param ReviewMemberItemImages 삭제할 리뷰의 일련번호를 담고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	public int getdeleteReview(Review input) throws Exception;
}
