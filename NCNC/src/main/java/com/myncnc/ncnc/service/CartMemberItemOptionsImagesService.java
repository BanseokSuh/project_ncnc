package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.CartMemberItemOptionsImages;


/** 장바구니 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface CartMemberItemOptionsImagesService {

    /**
     * 장바구니(A)/찜(B) 목록 리스트 전체 조회
     * @param CartMemberItemOptionsImages 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<CartMemberItemOptionsImages> getCartMemberItemList(CartMemberItemOptionsImages input) throws Exception;
    public List<CartMemberItemOptionsImages> getJJimMemberItemList(CartMemberItemOptionsImages input) throws Exception;
   
   
    // 찜 갯수값 불러오기
    public int getCartMemberCount(CartMemberItemOptionsImages input) throws Exception;
    
    // 찜 전체 삭제
    public int deleteCartMember(CartMemberItemOptionsImages input) throws Exception;
    
    // 찜 개별 삭제
    public int deleteCartOneMember(CartMemberItemOptionsImages input) throws Exception;
    
    // 카트에 아이템 담기
    public int addCartMember(CartMemberItemOptionsImages input) throws Exception;
    
    // 찜 취소
    public int deleteJjimOneMember(CartMemberItemOptionsImages input) throws Exception;
    
}
