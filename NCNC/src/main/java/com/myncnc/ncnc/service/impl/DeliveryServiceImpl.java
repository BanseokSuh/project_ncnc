package com.myncnc.ncnc.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Delivery;
import com.myncnc.ncnc.service.DeliveryService;

import lombok.extern.slf4j.Slf4j;

/** 배송지 데이터 관리 기능을 제공하기 위한 Service 계층에 대한 구현체 */
//--> import org.springframework.stereotype.Service;
@Service
@Slf4j
public class DeliveryServiceImpl implements DeliveryService{

	/** MyBatis */
    @Autowired
    SqlSession sqlSession;

	
    /**
     * 배송지관리 목록 리스트에 담기
     * @param Delivery 저장할 정보를 담고 있는 Beans
     * @throws Exception
     */	
	@Override
	public int addDelivery(Delivery input) throws Exception {
        int result = 0;

        try {
            result = sqlSession.insert("DeliveryMapper.insertItem", input);

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
     * @param Delivery 수정할 정보를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int editDelivery(Delivery input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("DeliveryMapper.updateItem", input);

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
     * 배송지관리 목록 리스트에서 삭제
     * @param Delivery 삭제할 배송지의 일련번호를 담고 있는 Beans
     * @throws Exception
     */
	@Override
	public int deleteDelivery(Delivery input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("DeliveryMapper.deleteItem", input);

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

