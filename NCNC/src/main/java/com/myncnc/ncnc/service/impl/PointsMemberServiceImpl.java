package com.myncnc.ncnc.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.PointsMember;
import com.myncnc.ncnc.service.PointsMemberService;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PointsMemberServiceImpl implements PointsMemberService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	/** 포인트 단일행 조회 */
	@Override
	public PointsMember getPointsMemberItem(PointsMember input) throws Exception {
		// TODO Auto-generated method stub
		PointsMember result = null;

		try {
			result = sqlSession.selectOne("PointsMemberMapper.selectItem", input);

//			if (result == null) {
//				throw new NullPointerException("result=null");
//			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 포인트가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("포인트 조회에 실패했습니다.");
		}

		return result;
	}

}
