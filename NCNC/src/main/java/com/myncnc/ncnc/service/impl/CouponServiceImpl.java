package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Coupon;
import com.myncnc.ncnc.service.CouponService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CouponServiceImpl implements CouponService{
	// MyBatis 객체 주입
	@Autowired
	SqlSession sqlSession;
	
	// 쿠폰 상세 조회
	@Override
	public Coupon getCouponItem(Coupon input) throws Exception {
		Coupon result = null;
		
		try {
			result = sqlSession.selectOne("CouponMapper.selectItem",input);
			
			if( result == null ) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	// 쿠폰 목록 조회
	@Override
	public List<Coupon> getCouponList(Coupon input) throws Exception {
		List<Coupon> result = null;
		
		try {
			result = sqlSession.selectList("CouponMapper.selectList",input);
			
			if( result == null ) {
				throw new NullPointerException("result=null");
			}
		} catch(NullPointerException e){
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	// 쿠폰 갯수
	@Override
	public int getCouponCount(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.selectOne("CouponMapper.selectCountAll",input);
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
	// 쿠폰 추가
	@Override
	public int addCoupon(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.insert("CouponMapper.insertItem",input);
			
			if( result == 0 ) {
				throw new NullPointerException("result=0");
			}
		} catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}
	
	// 쿠폰 수정
	@Override
	public int editCoupon(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.update("CouponMapper.editItem",input);
			
			if( result == 0 ) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 저장에 실패했습니다.");
		}
		return result;
	}
	
	// 쿠폰 삭제
	@Override
	public int deleteCoupon(Coupon input) throws Exception {
		int result = 0;
		
		try {
			result = sqlSession.delete("CouponMapper.deleteItem",input);
			
			if( result == 0 ) {
				throw new NullPointerException("result=0");
			}
		}catch(NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		}catch(Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}

}
