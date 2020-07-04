package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.OptionsOrdersItem;

public interface OptionsOrdersItemService {

	/**
	 * 옵션 데이터 상세 조회
	 * 
	 * @param Options 조회할 옵션의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public OptionsOrdersItem getOptionsItem(OptionsOrdersItem input) throws Exception;

	
	/**
	 * 옵션 데이터 목록 조회
	 * @return 조회 결과에 대한 컬렉션
	 * @throws Exception
	 */
	public List<OptionsOrdersItem> getOptionsList(OptionsOrdersItem input) throws Exception;
	
}
