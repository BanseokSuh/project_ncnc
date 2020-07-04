package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.OptionsOrdersItem;
import com.myncnc.ncnc.service.OptionsOrdersItemService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OptionsOrdersItemServiceImpl implements OptionsOrdersItemService {
	// MyBatis 객체 주입
	@Autowired
	SqlSession sqlSession;

	@Override
	public OptionsOrdersItem getOptionsItem(OptionsOrdersItem input) throws Exception {
		OptionsOrdersItem result = null;

		try {
			result = sqlSession.selectOne("OptionsOrdersItemMapper.selectItem", input);

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

	// 게시판 목록 조회
		@Override
		public List<OptionsOrdersItem> getOptionsList(OptionsOrdersItem input) throws Exception {
			List<OptionsOrdersItem> result = null;

			try {
				result = sqlSession.selectList("OptionsOrdersItemMapper.selectList", input);

				if (result == null) {
					throw new NullPointerException("result=null");
				}
			} catch (NullPointerException e) {
				log.debug(e.getLocalizedMessage());
				throw new Exception("저장된 데이터가 없습니다.");
			} catch (Exception e) {
				log.debug(e.getLocalizedMessage());
				throw new Exception("데이터 조회에 실패했습니다.");
			}
			return result;
		}
}
