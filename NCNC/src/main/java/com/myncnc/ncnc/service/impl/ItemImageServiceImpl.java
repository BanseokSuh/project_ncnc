package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.ItemImage;
import com.myncnc.ncnc.service.ItemImageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ItemImageServiceImpl implements ItemImageService {

	@Autowired
	SqlSession sqlSession;

	
	/**
	 * 다중 조회를 위한 기능 정의 => 대학생용으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getUniHot(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectUniHot", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 다중 조회를 위한 기능 정의 => 비즈니스용으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getBussinessHot(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectBussinessHot", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 다중 조회를 위한 기능 정의 => 초경량으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getLightHot(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectLightHot", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 다중 조회를 위한 기능 정의 => 게이밍용으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getGamingHot(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectGamingHot", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 다중 조회를 위한 기능 정의 => 그래픽용으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getGraphicHot(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectGraphicHot", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 다중 조회를 위한 기능 정의 => 영상편집용으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getVideoHot(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectVideoHot", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 다중 조회를 위한 기능 정의 => 인기순으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getBestHot(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectBestHot", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**
	 * 다중 조회를 위한 기능 정의 => 최신순으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getBestNew(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectBestNew", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**
	 * 다중 조회를 위한 기능 정의 => 인기순 - 높은가격순으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getBestHigh(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectBestHigh", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}
	
	/**
	 * 다중 조회를 위한 기능 정의 => 인기순 - 낮은가격순으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getBestLow(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectBestLow", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 다중 조회를 위한 기능 정의 => 인기순 - 리뷰순으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getBestReview(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectBestReview", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**
	 * 다중 조회를 위한 기능 정의 => 인기순 - 판매순으로 구분한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getBestSell(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectBestSell", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/********************************************************************************************/

	/**
	 * 단일행 조회를 위한 기능 정의 => 아이템 상세조회를 위한 기능 - prdDetail
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public ItemImage getItem(ItemImage input) throws Exception {
		ItemImage result = null;

		try {
			result = sqlSession.selectOne("ItemImageMapper.selectItemDetail", input);
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}
	/**
	 * 다중 조회를 위한 기능 정의 => 이미지를 위한 리스트 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public List<ItemImage> getThumnail(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectItemThumNail", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("no data");
		}
		return result;
	}
	
	/**
	 * 다중 조회를 위한 기능 정의 => 이미지를 위한 상세이미지 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public ItemImage getImageDetail(ItemImage input) throws Exception {
		ItemImage result = null;

		try {
			result = sqlSession.selectOne("ItemImageMapper.selectItemImageDetail", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}
	
	/**
	 * 다중 조회를 위한 기능 정의 => 검색어를 통한 상품들 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public List<ItemImage> getSearch(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectSearch", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("no data");
		}
		return result;
	}
	
	/**
	 * 상품 갯수 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public int getItemCount(ItemImage input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ItemImageMapper.selectItemCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}

	/**
	 * 단일행 조회를 위한 기능 정의 => 카트에 담긴 아이템을 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public ItemImage selectCartItem(ItemImage input) throws Exception {
		ItemImage result = null;

		try {
			result = sqlSession.selectOne("ItemImageMapper.selectCartItem", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}
	
	/**
	 * 다중 조회를 위한 기능 정의 => 검색어 - 최신순으로 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */
	@Override
	public List<ItemImage> getSearchNew(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectSearchNew", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("no data");
		}
		return result;
	}
	/**
	 * 다중 조회를 위한 기능 정의 => 검색어 - 높은가격순으로 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public List<ItemImage> getSearchHigh(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectSearchHigh", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("no data");
		}
		return result;
	}
	
	/**
	 * 다중 조회를 위한 기능 정의 => 검색어 - 낮은가격순으로 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public List<ItemImage> getSearchLow(ItemImage input) throws Exception {
		List<ItemImage> result = null;

		try {
			result = sqlSession.selectList("ItemImageMapper.selectSearchLow", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("no data");
		}
		return result;
	}
	
	/**
	 * 단일행 조회를 위한 기능 정의 => 검색어 개수 조회
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public int getSearchCount(ItemImage input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("ItemImageMapper.selectSearchCount", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		}
		return result;
	}
	
	/**
	 * 조회수를 위한 기능
	 * 
	 * @param ItemImage 조회할 아이템번호를 갖고있는 beans
	 * @return 조회된 데이터가 저장된 beans
	 * @throws Exception
	 */

	@Override
	public void updateItemHit(ItemImage input) throws Exception {
			sqlSession.update("ItemImageMapper.updateItemHit", input);
	}


}
