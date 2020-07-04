package com.myncnc.ncnc.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Options;
import com.myncnc.ncnc.service.OptionsService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OptionsServiceImpl implements OptionsService {
	// MyBatis 객체 주입
	@Autowired
	SqlSession sqlSession;

	@Override
	public Options getOptionsItem(Options input) throws Exception {
		Options result = null;

		try {
			result = sqlSession.selectOne("OptionsMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
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
