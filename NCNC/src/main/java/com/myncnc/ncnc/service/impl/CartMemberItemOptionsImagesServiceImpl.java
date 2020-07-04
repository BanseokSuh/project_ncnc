package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.CartMemberItemOptionsImages;
import com.myncnc.ncnc.service.CartMemberItemOptionsImagesService;

import lombok.extern.slf4j.Slf4j;

/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
//--> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class CartMemberItemOptionsImagesServiceImpl implements CartMemberItemOptionsImagesService {

	/** MyBatis */
	@Autowired
	SqlSession sqlSession;

	/**
	 * 장바구니(A)/찜(B) 목록 리스트 전체 조회
	 * 
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	@Override
	public List<CartMemberItemOptionsImages> getCartMemberItemList(CartMemberItemOptionsImages input) throws Exception {
		List<CartMemberItemOptionsImages> result = null;

		try {
			result = sqlSession.selectList("CartMemberItemOptionsImagesMapper.selectList", input);

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

	@Override
	public int getCartMemberCount(CartMemberItemOptionsImages input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("CartMemberItemOptionsImagesMapper.selectCartCount", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 찜 전체 삭제
	@Override
	public int deleteCartMember(CartMemberItemOptionsImages input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("CartMemberItemOptionsImagesMapper.deleteCartCount", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 찜 개별 삭제
	@Override
	public int deleteCartOneMember(CartMemberItemOptionsImages input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("CartMemberItemOptionsImagesMapper.deleteCartOne", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	// 아이템 카트에 담기
	@Override
	public int addCartMember(CartMemberItemOptionsImages input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("CartMemberItemOptionsImagesMapper.insertCartList", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int deleteJjimOneMember(CartMemberItemOptionsImages input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.delete("CartMemberItemOptionsImagesMapper.deleteJjimOne", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public List<CartMemberItemOptionsImages> getJJimMemberItemList(CartMemberItemOptionsImages input) throws Exception {
		List<CartMemberItemOptionsImages> result = null;
		
		try {
			result = sqlSession.selectList("CartMemberItemOptionsImagesMapper.selectJJimList", input);

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
}
