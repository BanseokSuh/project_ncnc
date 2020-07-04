package com.myncnc.ncnc.service;

import com.myncnc.ncnc.model.PointsMember;

public interface PointsMemberService {

	
    /**
     * 포인트 데이터 상세 조회
     * @param Points 조회할 포인트의 일련번호를 담고 있는 Beans
     * @return 조회된 데이터가 저장된 Beans
     * @throws Exception
     */
    public PointsMember getPointsMemberItem(PointsMember input) throws Exception;


}
