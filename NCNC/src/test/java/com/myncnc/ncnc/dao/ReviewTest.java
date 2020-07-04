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

import com.myncnc.ncnc.model.Review;


@RunWith(SpringJUnit4ClassRunner.class)

/*spring의 설정 파일들을 읽어들이도록 설정(**은 '모든' 이라는 의미)*/
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})

/* 웹 어플리케이션임을 명시 */
@WebAppConfiguration

/* 매서드 이름순서로 실행하도록 설정(설정하지 않을 경우 무작위 순서로 실행된) */
@FixMethodOrder(MethodSorters.NAME_ASCENDING)

public class ReviewTest {

	/** MyBatis의 SQL 세션 주입 설정 **/
	@Autowired private SqlSession sqlSession;
	
	
	
	/** 다중 조회를 위한 기능 정의
		=> 상품상세페이지 > 해당 상품에 대한 리뷰들 조회
		 selectListReivewItem */
//	@Test
//	public void testA() {
//		//ReviewMemberOrderImages input = new ReviewMemberOrderImages();
//		//input.setOrd_no(3);
//		sqlSession.selectList("ReviewMemberItemImagesMapper.selectListReivewItem", input);
//	}
//	
//	
//	/** 다중행 조회를 위한 기능 정의 
//		=> 마이페이지 > 내가 쓴 상품평 목록 조회
//		selectListReivewMember*/
//	@Test
//	public void testB() {
//		//ReviewMemberOrderImages input = new ReviewMemberOrderImages();
//		//input.setMem_no(2);
//		sqlSession.selectList("ReviewMemberItemImagesMapper.selectListReivewMember", input);
//	}
//
//	
//	
//	/** 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 
//		경우 Mapper에서는 requltMap이 아닌 resultType으로 반환한다.
//		=> 해당 상품에 대한 리뷰의 개수*/
//	@Test
//	public void testC() {
//		//ReviewMemberOrderImages input = new ReviewMemberOrderImages();
//		//input.setOrd_no(3);
//		sqlSession.selectOne("ReviewMemberItemImagesMapper.selectCountReivewItem", input);
//	}
//
//	
//	
//	/** 조건에 맞는 데이터 수를 집계하여 int 타입으로 반환한다. count, max, min, sum, avg 함수를 사용한 
//		경우 Mapper에서는 requltMap이 아닌 resultType으로 반환한다.
//		=> 사용자가 쓴 리뷰의 개수*/
//	@Test
//	public void testD() {
//		//ReviewMemberOrderImages input = new ReviewMemberOrderImages();
//		//input.setMem_no(3);
//		sqlSession.selectOne("ReviewMemberItemImagesMapper.selectCountReivewMember", input);
//	}
//
//
//	/** 데이터 저장을 위한 기능 정의 
//		=> 리뷰 추가하기*/
//	@Test
//	public void testE() {
//		Review input = new Review();
//		input.setRev_img1("이미지");
//		input.setRev_img2("이미지2");
//		input.setRev_star(3);
//		input.setRev_title("리뷰제목");
//		input.setRev_contents("리뷰내용~~~~");
//		input.setReg_date("2020-11-20");
//		input.setEdit_date("2020-11-20");
//		input.setMem_no(3);
//		input.setItem_no(2);
//		sqlSession.insert("ReviewMapper.insertReview", input);
//	}
//		
//	
//	
//	/** 데이터 갱신을 위한 기능 정의
//		=>내가 쓴 리뷰 수정하기 */
//	@Test
//	public void testF() {
//		Review input = new Review();
//		input.setRev_img1("이미1");
//		input.setRev_img2("이미지3");
//		input.setRev_title("리뷰제목2222");
//		input.setRev_contents("리뷰내용~~~~2222");
//		input.setEdit_date("2020-11-20");
//		sqlSession.update("ReviewMapper.updateReview", input);
//	}
//		
//
//	/** 회원탈퇴를 위한 멤버번호 null 업데이트*/
//	@Test
//	public void testG() {
//		Review input = new Review();
//		input.setRev_no(3);
//		sqlSession.update("ReviewMapper.updateReviewMemNull", input);
//	}
//	
//
//
//	/** 회원탈퇴를 위한 멤버번호 null 업데이트*/
//	@Test
//	public void testH() {
//		Review input = new Review();
//		input.setRev_no(3);
//		sqlSession.delete("ReviewMapper.deleteReview", input);
//	}
	
	
	
	
	
	
	
	

	
}
