package com.myncnc.ncnc.service;

import com.myncnc.ncnc.model.Delivery;


/** 배송지 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface DeliveryService {
    
    /**
     * 배송지관리 목록 리스트에 담기
     * @param Delivery 저장할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int addDelivery(Delivery input) throws Exception;
    
    /**
     * 회원탈퇴를 위한 mem_no=null 처리
     * @param Delivery 수정할 정보를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int editDelivery(Delivery input) throws Exception;
    
    /**
     * 배송지관리 목록 리스트에서 삭제
     * @param Delivery 삭제할 배송지의 일련번호를 담고 있는 Beans
     * @return int
     * @throws Exception
     */
    public int deleteDelivery(Delivery input) throws Exception;

}
