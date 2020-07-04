package com.myncnc.ncnc.service;

import com.myncnc.ncnc.model.Options;

public interface OptionsService {

	/**
	 * 옵션 데이터 상세 조회
	 * 
	 * @param Options 조회할 옵션의 일련번호를 담고 있는 Beans
	 * @return 조회된 데이터가 저장된 Beans
	 * @throws Exception
	 */
	public Options getOptionsItem(Options input) throws Exception;

}
