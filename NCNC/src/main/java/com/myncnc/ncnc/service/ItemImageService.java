package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.ItemImage;

public interface ItemImageService {

	// 노트북 > 대학생용 > 인기순
	public List<ItemImage> getUniHot(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 노트북 > 비지니스 > 인기순
	public List<ItemImage> getBussinessHot(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 노트북 > 초경량 > 인기순
	public List<ItemImage> getLightHot(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 노트북 > 게이밍 > 인기순
	public List<ItemImage> getGamingHot(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 노트북 > 그래픽 > 인기순
	public List<ItemImage> getGraphicHot(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 노트북 > 영상편집 > 인기순
	public List<ItemImage> getVideoHot(ItemImage input) throws Exception;

	/********************************************************************************************/

	// index > 베스트 > 인기순
	public List<ItemImage> getBestHot(ItemImage input) throws Exception;

	// index > 베스트 > 최신순
	public List<ItemImage> getBestNew(ItemImage input) throws Exception;

	// index > 베스트 > 높은가격
	public List<ItemImage> getBestHigh(ItemImage input) throws Exception;

	// index > 베스트 > 낮은가격
	public List<ItemImage> getBestLow(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 베스트 페이지 > 리뷰순
	public List<ItemImage> getBestReview(ItemImage input) throws Exception;

	// 베스트 페이지 > 판매순
	public List<ItemImage> getBestSell(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 검색 목록 페이지
	public List<ItemImage> getSearch(ItemImage input) throws Exception;

	// 검색 최신순
	public List<ItemImage> getSearchNew(ItemImage input) throws Exception;

	// 검색 높은가격순
	public List<ItemImage> getSearchHigh(ItemImage input) throws Exception;

	// 검색 낮은 가격순
	public List<ItemImage> getSearchLow(ItemImage input) throws Exception;

	/********************************************************************************************/

	// 개별 상품 조회
	public ItemImage getItem(ItemImage input) throws Exception;

	public int getItemCount(ItemImage input) throws Exception;

	// 이미지 가지고와
	public List<ItemImage> getThumnail(ItemImage input) throws Exception;
	
	// 이미지 디테일
	public ItemImage getImageDetail(ItemImage input) throws Exception;

	// 아이템 정보 카트에 담기
	public ItemImage selectCartItem(ItemImage input) throws Exception;

	// 검색 결과 갯수
	public int getSearchCount(ItemImage input) throws Exception;
	
	// 검색 결과 갯수
	public void updateItemHit(ItemImage input) throws Exception;

}
