package com.myncnc.ncnc.dao;

import org.apache.ibatis.session.SqlSession;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.myncnc.ncnc.model.ItemImage;

/** JUnit에 의한 테스트 클래스로 정의 */
//import org.junit.runner.RunWith;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
@RunWith(SpringJUnit4ClassRunner.class)
/** Spring의 설정 파일들을 읽어들이도록 설정 (**은 '모든'이라는 의미) */
//import org.springframework.test.context.ContextConfiguration;
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/*-context.xml" })
/** 웹 어플리케이션임을 명시 */
//import org.springframework.test.context.web.WebAppConfiguration;
@WebAppConfiguration
/** 메서드 이름순서로 실행하도록 설정 (설정하지 않을 경우 무작위 순서로 실행됨) */
//import org.junit.FixMethodOrder;
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class ItemImageTest {

	// import org.springframework.beans.factory.annotation.Autowired;
	@Autowired
	private SqlSession sqlSession;

	/** 노트북 > 대학생용 > 인기순 */
	// import org.junit.Test;
	@Test
	public void testA() {
		sqlSession.selectList("ItemImageMapper.selectUniHot", null);
	}
	
	/** 노트북 > 대학생용 > 최신순 */
	// import org.junit.Test;
	@Test
	public void testB() {
		sqlSession.selectList("ItemImageMapper.selectUniNew", null);
	}
	
	/** 노트북 > 대학생용 > 높은가격 */
	// import org.junit.Test;
	@Test
	public void testC() {
		sqlSession.selectList("ItemImageMapper.selectUniHigh", null);
	}
	
	/** 노트북 > 대학생용 > 낮은가격 */
	// import org.junit.Test;
	@Test
	public void testD() {
		sqlSession.selectList("ItemImageMapper.selectUniLow", null);
	}

	/******************************************************************/
	
	/** 노트북 > 비지니스 > 인기순 */
	// import org.junit.Test;
	@Test
	public void testE() {
		sqlSession.selectList("ItemImageMapper.selectBussinessHot", null);
	}
	
	/** 노트북 > 비지니스 > 최신순 */
	// import org.junit.Test;
	@Test
	public void testF() {
		sqlSession.selectList("ItemImageMapper.selectBussinessHot", null);
	}
	
	/** 노트북 > 비지니스 > 높은가격 */
	// import org.junit.Test;
	@Test
	public void testG() {
		sqlSession.selectList("ItemImageMapper.selectBussinessHot", null);
	}
	
	/** 노트북 > 비지니스 > 낮은가격 */
	// import org.junit.Test;
	@Test
	public void testH() {
		sqlSession.selectList("ItemImageMapper.selectBussinessHot", null);
	}
	
	/******************************************************************/

	/** 노트북 > 초경량 > 인기순 */
	// import org.junit.Test;
	@Test
	public void testI() {
		sqlSession.selectList("ItemImageMapper.selectLightHot", null);
	}
	
	/** 노트북 > 초경량 > 최신순 */
	// import org.junit.Test;
	@Test
	public void testJ() {
		sqlSession.selectList("ItemImageMapper.selectLightNew", null);
	}
	
	/** 노트북 > 초경량 > 높은가격 */
	// import org.junit.Test;
	@Test
	public void testK() {
		sqlSession.selectList("ItemImageMapper.selectLightHigh", null);
	}
	
	/** 노트북 > 초경량 > 낮은가격 */
	// import org.junit.Test;
	@Test
	public void testL() {
		sqlSession.selectList("ItemImageMapper.selectLightLow", null);
	}
	
	/******************************************************************/

	/** 노트북 > 게이밍 > 인기순 */
	// import org.junit.Test;
	@Test
	public void testM() {
		sqlSession.selectList("ItemImageMapper.selectGamingHot", null);
	}
	
	/** 노트북 > 게이밍 > 최신순 */
	// import org.junit.Test;
	@Test
	public void testN() {
		sqlSession.selectList("ItemImageMapper.selectGamingNew", null);
	}
	
	/** 노트북 > 게이밍 > 높은가격 */
	// import org.junit.Test;
	@Test
	public void testO() {
		sqlSession.selectList("ItemImageMapper.selectGamingHigh", null);
	}
	
	/** 노트북 > 게이밍 > 낮은가격 */
	// import org.junit.Test;
	@Test
	public void testP() {
		sqlSession.selectList("ItemImageMapper.selectGamingLow", null);
	}
	
	/******************************************************************/

	/** 노트북 > 그래픽 > 인기순 */
	// import org.junit.Test;
	@Test
	public void testQ() {
		sqlSession.selectList("ItemImageMapper.selectGraphicHot", null);
	}
	
	/** 노트북 > 그래픽 > 최신순 */
	// import org.junit.Test;
	@Test
	public void testR() {
		sqlSession.selectList("ItemImageMapper.selectGraphicNew", null);
	}
	
	/** 노트북 > 그래픽 > 높은가격 */
	// import org.junit.Test;
	@Test
	public void testS() {
		sqlSession.selectList("ItemImageMapper.selectGraphicHigh", null);
	}
	
	/** 노트북 > 그래픽 > 낮은가격 */
	// import org.junit.Test;
	@Test
	public void testT() {
		sqlSession.selectList("ItemImageMapper.selectGraphicLow", null);
	}
	
	/******************************************************************/

	/** 노트북 > 영상편집 > 인기순 */
	// import org.junit.Test;
	@Test
	public void testU() {
		sqlSession.selectList("ItemImageMapper.selectVideoHot", null);
	}

	/** 노트북 > 영상편집 > 최신순 */
	// import org.junit.Test;
	@Test
	public void testV() {
		sqlSession.selectList("ItemImageMapper.selectVideoNew", null);
	}
	
	/** 노트북 > 영상편집 > 높은가격 */
	// import org.junit.Test;
	@Test
	public void testW() {
		sqlSession.selectList("ItemImageMapper.selectVideoHigh", null);
	}
	
	/** 노트북 > 영상편집 > 낮은가격 */
	// import org.junit.Test;
	@Test
	public void testX() {
		sqlSession.selectList("ItemImageMapper.selectVideoLow", null);
	}


	/******************************************************************/

	/** 노트북 > 베스트 > 전체 */
	@Test
	public void testY() {
		sqlSession.selectList("ItemImageMapper.selectBestAll", null);
	}

	/** 노트북 > 베스트 > 그래픽 */
	@Test
	public void testZ() {
		sqlSession.selectList("ItemImageMapper.selectBestGraphic", null);
	}

	/** 노트북 > 베스트 > 비즈니스 */
	@Test
	public void testZ1() {
		sqlSession.selectList("ItemImageMapper.selectBestBussiness", null);
	}

	/** 노트북 > 베스트 > 게이밍 */
	@Test
	public void testZ2() {
		sqlSession.selectList("ItemImageMapper.selectBestGaming", null);
	}

	/******************************************************************/

	/** 베스트 페이지 > 리뷰순 */
	@Test
	public void testZ3() {
		sqlSession.selectList("ItemImageMapper.selectBestReview", null);
	}

	/** 베스트 페이지 > 판매순 */
	@Test
	public void testZ4() {
		sqlSession.selectList("ItemImageMapper.selectBestSell", null);
	}

	/******************************************************************/

	/** 개별 상품 조회 */
	@Test
	public void testZ5() {
		ItemImage input = new ItemImage();
		input.setItem_no(5);
		sqlSession.selectList("ItemImageMapper.selectItemDetail", input);
	}

}