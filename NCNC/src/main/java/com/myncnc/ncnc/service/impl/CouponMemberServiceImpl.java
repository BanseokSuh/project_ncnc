package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.CouponMember;
import com.myncnc.ncnc.service.CouponMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CouponMemberServiceImpl implements CouponMemberService {
	// MyBatis 객체 주입
	@Autowired
	SqlSession sqlSession;

	@Override
	public List<CouponMember> getCouponMemberList(CouponMember input) throws Exception {
		List<CouponMember> result = null;

		try {
			result = sqlSession.selectList("CouponMemberMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public CouponMember getCouponItem(CouponMember input) throws Exception {
		CouponMember result = null;

		try {
			result = sqlSession.selectOne("CouponMemberMapper.selectItem", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int getCouponCount(CouponMember input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("CouponMemberMapper.selectCount", input);

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}

		return result;
	}

}
