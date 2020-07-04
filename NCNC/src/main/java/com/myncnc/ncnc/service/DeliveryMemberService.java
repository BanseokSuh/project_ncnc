package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.DeliveryMember;

/** 배송지 데이터 관리 기능을 제공하기 위한 Service 계층. */
public interface DeliveryMemberService {
	
	
	/**
     * 배송지 데이터 상세 조회(기본 배송지 조회)
     * @param DeliveryMember 조회할 배송지의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public DeliveryMember getDeliveryMemberItem(DeliveryMember input) throws Exception;
    
    
    /**
     * 기본 배송지와 추가 배송지 전체 조회
     * @param DeliveryMember 검색조건과 페이지 구현 정보를 담고 있는 Beans
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
    public List<DeliveryMember> getDeliveryMemberList(DeliveryMember input) throws Exception;
    
}
