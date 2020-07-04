package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.ReviewMemberOrderImages;
import com.myncnc.ncnc.service.ReviewMemberOrderImagesService;

import lombok.extern.slf4j.Slf4j;

/** 리뷰게시판 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 **/
@Slf4j
@Service
public class ReviewMemberOrderImagesServiceImpl implements ReviewMemberOrderImagesService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	/**
	 * 다중 조회를 위한 기능 정의 => 상품상세페이지 > 해당 상품에 대한 리뷰들 조회
	 * 
	 * @param ReviewMemberItemImages 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ReviewMemberOrderImages> getListReivewItem(ReviewMemberOrderImages input) throws Exception {
		List<ReviewMemberOrderImages> result = null;

		try {
			result = sqlSession.selectList("ReviewMemberOrderImagesMapper.selectListReivewItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 다중행 조회를 위한 기능 정의 => 마이페이지 > 내가 쓴 상품평 목록 조회
	 * 
	 * @param ReviewMemberItemImages 조회할 멤버번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ReviewMemberOrderImages> getListReivewMember(ReviewMemberOrderImages input) throws Exception {
		List<ReviewMemberOrderImages> result = null;

		try {
			result = sqlSession.selectList("ReviewMemberOrderImagesMapper.selectListReivewMember", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 경우
	 * Mapper에서는 requltMap이 아닌 resultType으로 반환한다. => 해당 상품에 대한 리뷰의 개수
	 * 
	 * @param ReviewMemberItemImages 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public int getCountReivewItem(ReviewMemberOrderImages input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewMemberOrderImagesMapper.selectCountReivewItem", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	/**
	 * 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 경우
	 * Mapper에서는 requltMap이 아닌 resultType으로 반환한다. => 사용자가 쓴 리뷰의 개수
	 * 
	 * @param ReviewMemberItemImages 조회할 멤버번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public int getCountReivewMember(ReviewMemberOrderImages input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ReviewMemberOrderImagesMapper.selectCountReivewMember", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public ReviewMemberOrderImages getItemNo(ReviewMemberOrderImages input) throws Exception {
		ReviewMemberOrderImages result = null;

		try {
			result = sqlSession.selectOne("ReviewMemberOrderImagesMapper.selectItemNo", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}
}
