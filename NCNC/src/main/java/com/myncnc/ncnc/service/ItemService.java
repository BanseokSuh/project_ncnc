package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.Item;

public interface ItemService {

	// 노트북 > 대학생용
	public List<Item> getNUni(Item input) throws Exception;

	// 노트북 > 비지니스
	public List<Item> getNBussiness(Item input) throws Exception;

	// 노트북 > 초경량
	public List<Item> getNLight(Item input) throws Exception;

	// 노트북 > 게이밍
	public List<Item> getNGaming(Item input) throws Exception;

	// 노트북 > 그래픽
	public List<Item> getNGraphic(Item input) throws Exception;

	// 노트북 > 영상편집
	public List<Item> getNVideo(Item input) throws Exception;

	/*****************************************************************/

	// 상품목록 페이지 (퀵메뉴) > 인기순
	public List<Item> getNNHot(Item input) throws Exception;

	// 상품목록 페이지 (퀵메뉴) > 최신순
	public List<Item> getNNNew(Item input) throws Exception;

	// 상품목록 페이지 (퀵메뉴) > 높은가격순
	public List<Item> getNNHigh(Item input) throws Exception;

	// 상품목록 페이지 (퀵메뉴) > 낮은가격순
	public List<Item> getNNLow(Item input) throws Exception;

	/*****************************************************************/

	// index > 베스트 > 전체
	public List<Item> getBestAll(Item input) throws Exception;

	// index > 베스트 > 그래픽
	public List<Item> getBestGraphic(Item input) throws Exception;

	// index > 베스트 > 비즈니스
	public List<Item> getBestBussiness(Item input) throws Exception;

	// index > 베스트 > 게이밍
	public List<Item> getBestGaming(Item input) throws Exception;

	/*****************************************************************/

	// 베스트 페이지 > 리뷰순
	public List<Item> getBestReview(Item input) throws Exception;

	// 베스트 페이지 > 판매순
	public List<Item> getBestSell(Item input) throws Exception;

	/*****************************************************************/

	// 개별 상품 조회
	public Item getItem(Item input) throws Exception;

	// 상품 목록 조회
	public List<Item> getItemList(Item input) throws Exception;

	/*****************************************************************/

	// 장바구니 담기
	public Item addItem(Item input) throws Exception;

}