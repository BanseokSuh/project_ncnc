package com.myncnc.ncnc.service;

import com.myncnc.ncnc.model.Points;

public interface PointsService {

	/**
	 * 포인트 데이터 갱신하기
	 * 
	 * @param Points 적립 + 사용할 정보를 담고 있는 Beans
	 * @return int
	 * @throws Exception
	 */
	public int editPoints(Points input) throws Exception;
	
	public int insertPoints(Points input) throws Exception;
}
