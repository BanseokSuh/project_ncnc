package com.myncnc.ncnc.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Points;
import com.myncnc.ncnc.service.PointsService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class PointsServiceImpl implements PointsService {

	/** MyBatis */
	// --> import org.apache.ibatis.session.SqlSession
	@Autowired
	SqlSession sqlSession;

	/** 포인트 갱신 */

	@Override
	public int editPoints(Points input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("PointsMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 포인트가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("포인트 수정에 실패했습니다.");
		}

		return result;
	}

	@Override
	public int insertPoints(Points input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("PointsMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 포인트가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("포인트 저장에 실패했습니다.");
		}
		return result;
	}



}
