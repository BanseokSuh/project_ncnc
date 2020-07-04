package com.myncnc.ncnc.service;

import com.myncnc.ncnc.model.Cart;



/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface CartService {

    /**
     * 장바구니(A)/찜(B) 목록 리스트에 담긴 데이터 수 조회
     * @param Cart 검색조건을 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int getCartCount(Cart input) throws Exception;
 
    
    /**
     * 장바구니(A)/찜(B) 목록 리스트에 담기
     * @param Cart 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addCart(Cart input) throws Exception;
  
    
    /**
     * 회원탈퇴를 위한 mem_no=null 처리
     * @param Cart 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int editCart(Cart input) throws Exception;
   
    
    /**
     * 장바구니(A)/찜(B) 목록 리스트에서 삭제
     * @param Cart 삭제할 장바구니의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteCart(Cart input) throws Exception;
    
}
