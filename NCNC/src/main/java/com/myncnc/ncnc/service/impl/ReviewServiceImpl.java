package com.myncnc.ncnc.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Review;
import com.myncnc.ncnc.service.ReviewService;

import lombok.extern.slf4j.Slf4j;

/** 리뷰게시판 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 **/
@Slf4j
@Service
public class ReviewServiceImpl implements ReviewService {
	
    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

	
	

	
	/**
	 * 데이터 저장을 위한 기능 정의 
		=> 리뷰 추가하기
		@param ReviewMemberItemImages 저장할 정보를 담고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	@Override
	public int getaddReview(Review input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("ReviewMapper.insertReview", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("저장된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 저장에 실패했습니다.");
        }

        return result;
	}

	
	/**
	 *데이터 갱신을 위한 기능 정의
		=>내가 쓴 리뷰 수정하기
		@param ReviewMemberItemImages 수정할 정보를 담고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	@Override
	public int geteditReview(Review input) throws Exception {
		 int result = 0;

	        try {
	            result = sqlSession.update("ReviewMapper.updateReview", input);

	            if (result == 0) {
	                throw new NullPointerException("result=0");
	            }
	        } catch (NullPointerException e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("수정된 데이터가 없습니다.");
	        } catch (Exception e) {
	            log.error(e.getLocalizedMessage());
	            throw new Exception("데이터 수정에 실패했습니다.");
	        }

	        return result;
	}

	
	/**
	 * 데이터 삭제를 위한 기능 정의
		=> 내가 쓴 리뷰 삭제하기
		@param ReviewMemberItemImages 삭제할 리뷰의 일련번호를 담고있는 beans
		@return 조회된 데이터가 저장된 beans
		@throws Exception
	 * */
	@Override
	public int getdeleteReview(Review input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.delete("ReviewMapper.deleteReview", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제에 실패했습니다.");
        }

        return result;
	}

}
