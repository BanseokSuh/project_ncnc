package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Item;
import com.myncnc.ncnc.service.ItemService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ItemServiceImpl implements ItemService {

	@Autowired
	SqlSession sqlSession;

	// 노트북 > 대학생용
	@Override
	public List<Item> getNUni(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNUni", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 노트북 > 비즈니스
	@Override
	public List<Item> getNBussiness(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNBussiness", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 노트북 > 초경량
	@Override
	public List<Item> getNLight(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNLight", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 노트북 게이밍
	@Override
	public List<Item> getNGaming(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNGaming", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 노트북 > 그래픽
	@Override
	public List<Item> getNGraphic(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNGraphic", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 노트북 > 영상편집
	@Override
	public List<Item> getNVideo(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNVideo", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**************************************************************************************/

	// 상품목록 페이지 (퀵메뉴) > 인기순
	@Override
	public List<Item> getNNHot(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNNHot", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 상품목록 페이지 (퀵메뉴) > 최신순
	@Override
	public List<Item> getNNNew(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNNNew", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 상품목록 페이지 (퀵메뉴) > 높은가격순
	@Override
	public List<Item> getNNHigh(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNNHigh", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 상품목록 페이지 (퀵메뉴) > 낮은가격순
	@Override
	public List<Item> getNNLow(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectNNLow", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**************************************************************************************/

	// index > 베스트 > 전체
	@Override
	public List<Item> getBestAll(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectBestAll", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// index > 베스트 > 그래픽
	@Override
	public List<Item> getBestGraphic(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectBestGraphic", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// index > 베스트 > 비즈니스
	@Override
	public List<Item> getBestBussiness(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectBestBussiness", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// index > 베스트 > 게이밍
	@Override
	public List<Item> getBestGaming(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectBestGaming", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**************************************************************************************/

	// 베스트 페이지 > 리뷰순
	@Override
	public List<Item> getBestReview(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectBestReview", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	// 베스트 페이지 > 판매순
	@Override
	public List<Item> getBestSell(Item input) throws Exception {
		List<Item> result = null;

		try {
			result = sqlSession.selectList("ItemMapper.selectBestSell", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**************************************************************************************/
	
	// 개별 상품 조회 
	@Override
	public Item getItem(Item input) throws Exception {
		Item result = null;

		try {
			result = sqlSession.selectOne("ItemMapper.selectItemDetail", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}
	
	// 상품 목록 조회  
	@Override
	public List<Item> getItemList(Item input) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	/**************************************************************************************/

	// 장바구니 담기 
	@Override
	public Item addItem(Item input) throws Exception {
		Item result = null;

		try {
			result = sqlSession.selectOne("ItemMapper.insertItem", null);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("");
		}
		return result;
	}

}
