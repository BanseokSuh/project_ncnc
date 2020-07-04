package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.OrdersMemberPointsDeliveryCouponImagesItemOptionsCart;
import com.myncnc.ncnc.service.OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService;

import lombok.extern.slf4j.Slf4j;

/** 오더테이블 select 기능을 제공하기 위한 Service 계층에 대한 구현체 **/
@Slf4j
@Service
public class OrdersMemberPointsDeliveryCouponImagesItemOptionsCartServiceImpl implements OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService {
    
	
	
	/** MyBatis */
    // --> import org.apache.ibatis.session.SqlSession
    @Autowired   SqlSession sqlSession;
	
	/**
	 * 다중행 조회를 위한 기능정의 
    	=> 마이페이지 > 주문내역 (내용 일부 노출, 최근 날짜별로)
    	 @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 조회할 멤버번호를 갖고있는 beans
		 @return 조회된 데이터가 저장된 beans
		 @throws Exception
	 * */
	@Override
	public List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> getselectPieceList(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input)
			throws Exception {
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> result = null;
	
		try {
			result = sqlSession.selectList("OrdersMemberPointsDeliveryCouponImagesItemOptionsCartMapper.selectPieceList", input);

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
	 * 단일행 조회를 위한 기능정의 
    	=> 마이페이지 > 주문내역 > 주문내역 상세페이지 (내용 전부노출)
    	 @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 조회할 멤버번호를 갖고있는 beans
		 @return 조회된 데이터가 저장된 beans
		 @throws Exception
	 * */
	@Override
	public OrdersMemberPointsDeliveryCouponImagesItemOptionsCart getselectAllOne(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input)
			throws Exception {
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart result = null;
		
		try {
			result = sqlSession.selectOne("OrdersMemberPointsDeliveryCouponImagesItemOptionsCartMapper.selectAllOne", input);

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
	 * 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 
		경우 Mapper에서는 requltMap이 아닌 resultType으로 반환한다. 
		오더데이터가 저장되어 있는 갯수 조회
	 *   @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 검색조건을 가진 beans
		 @return int
		 @throws Exception
	 * */
	@Override
	public int getselectCountOrdersAll(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception {
		int result = 0;
        
        try {
            result = sqlSession.selectOne("OrdersMemberPointsDeliveryCouponImagesItemOptionsCartMapper.selectCountOrdersAll", input);
        } catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }
        
        return result;
	}

	/**
	 * 다중행 조회를 위한 기능정의-> 주문페이지
	 * 다른 테이블에서 가져와야하는 부분(바로구매)
	 *   @param OrdersMemberPointsDeliveryCouponImagesItemOptionsCart 검색조건을 가진 beans
		 @return int
		 @throws Exception
	 * */

	@Override
	public List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> getselectOrdersItem(
			OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception {
		
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> result = null;
		
		try {
			result = sqlSession.selectList("OrdersMemberPointsDeliveryCouponImagesItemOptionsCartMapper.selectOrdersItem", input);

			//if (result == null) {
			//	throw new NullPointerException("result=null");
			//}
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
	public List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> getselectOrdersCartList(
			OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception {
		
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> result = null;
		
		try {
			result = sqlSession.selectList("OrdersMemberPointsDeliveryCouponImagesItemOptionsCartMapper.selectOrdersCartList", input);

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
	public OrdersMemberPointsDeliveryCouponImagesItemOptionsCart getselectOrdermember(
			OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input) throws Exception {
		
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart result = null;
		
		try {
			result = sqlSession.selectOne("OrdersMemberPointsDeliveryCouponImagesItemOptionsCartMapper.selectOrdermember", input);

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
		
			return result;	}


	

}
