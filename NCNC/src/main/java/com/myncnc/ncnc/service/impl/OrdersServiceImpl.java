package com.myncnc.ncnc.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Orders;
import com.myncnc.ncnc.service.OrdersService;

import lombok.extern.slf4j.Slf4j;

/** 오더테이블 update, insert 기능을 제공하기 위한 Service 계층에 대한 구현체 **/
@Slf4j
@Service
public class OrdersServiceImpl implements OrdersService{
    /** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired
    SqlSession sqlSession;

	@Override
	public Orders getselectItem(Orders input) throws Exception {
		
		Orders result = null;
		
		try {
			result = sqlSession.selectOne("OrdersMapper.selectOrders", input);
			
			if(result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회가 실패!");
		}
		
		return result;
	}

	
	
	/**
	 * 데이터 저장을 위한 기능 정의
	 * => 주문 페이지
	 * @param OrdersMemberPointsDeliveryCouponImagesItemOptions 저장할 정보를 담고있는  beans
	   @return int
	   @throws Exception
	 * **/
	@Override
	public int addOrders(Orders input) throws Exception {
		int result = 0;

        try {
            result = sqlSession.insert("OrdersMapper.insertOrders", input);

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
	    * 데이터 갱신을 위한 기능 정의 
	    * => 주문 취소페이지
	    * @param OrdersMemberPointsDeliveryCouponImagesItemOptions 수정할 정보를 담고있는  beans
	      @return int
	      @throws Exception
	    * 
	    * */
	   @Override
	   public int editOrders(Orders input) throws Exception {
	       int result = 0;

	           try {
	               result = sqlSession.update("OrdersMapper.updateOrders", input);

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
}
