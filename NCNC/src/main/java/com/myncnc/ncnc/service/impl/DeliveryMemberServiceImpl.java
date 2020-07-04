package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.DeliveryMember;
import com.myncnc.ncnc.service.DeliveryMemberService;

import lombok.extern.slf4j.Slf4j;

/** 배송지 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
//--> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class DeliveryMemberServiceImpl implements DeliveryMemberService{

	/** MyBatis */
    @Autowired
    SqlSession sqlSession;
		
	/**
     * 배송지 데이터 상세 조회(기본 배송지 조회)
     * @param DeliveryMember 조회할 배송지의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */	
	@Override
	public DeliveryMember getDeliveryMemberItem(DeliveryMember input) throws Exception {
		DeliveryMember result = null;

        try {
            result = sqlSession.selectOne("DeliveryMapper.selectItem", input);

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
     * 기본 배송지와 추가 배송지 전체 조회
     * @return 조회 결과에 대한 컬렉션
     * @throws Exception
     */
	@Override
	public List<DeliveryMember> getDeliveryMemberList(DeliveryMember input) throws Exception {
		List<DeliveryMember> result = null;

        try {
            result = sqlSession.selectList("DeliveryMapper.selectList", input);

            if (result == null) {
                throw new NullPointerException("result=null");
            }
        } catch (NullPointerException e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("조회된 데이터들이 없습니다.");
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터들의 조회를 실패했습니다.");
        }
        return result;
	}

}

