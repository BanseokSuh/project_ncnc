package com.myncnc.ncnc.service.impl;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Cart;
import com.myncnc.ncnc.service.CartService;

import lombok.extern.slf4j.Slf4j;

/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
//--> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class CartServiceImpl implements CartService {
	
	/** MyBatis */
    @Autowired
    SqlSession sqlSession;

  
    /**
     * 장바구니(A)/찜(B) 목록 리스트에 담긴 데이터 수 조회
     * @return int
     * @throws Exception
     */	
	@Override
	public int getCartCount(Cart input) throws Exception {
		int result = 0;
		
        try {
            result = sqlSession.selectOne("CartMapper.selectCountAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        return result;
	}

	
    /**
     * 장바구니(A)/찜(B) 목록 리스트에 담기
     * @param Cart 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */	
	@Override
	public int addCart(Cart input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("CartMapper.insertItem", input);

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
     * 회원탈퇴를 위한 mem_no=null 처리
     * @param Cart 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */		
	@Override
	public int editCart(Cart input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("CartMapper.updateItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("수정된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 수정을 실패했습니다.");
        }
        return result;
	}

	
    /**
     * 장바구니(A)/찜(B) 목록 리스트에서 삭제
     * @param Cart 삭제할 장바구니의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int deleteCart(Cart input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("CartMapper.deleteItem", input);

            if (result == 0) {
                throw new NullPointerException("result=0");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("삭제된 데이터가 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 삭제를 실패했습니다.");
        }
        return result;
	}

}
