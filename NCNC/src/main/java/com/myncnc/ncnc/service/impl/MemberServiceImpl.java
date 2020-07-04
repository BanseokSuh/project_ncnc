package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Member;
import com.myncnc.ncnc.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class MemberServiceImpl implements MemberService {
	// MyBatis 객체 주입
	@Autowired
	SqlSession sqlSession;

	// 멤버 상세 조회
	@Override
	public Member getMemberItem(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.selectItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	// 멤버 목록 조회
	@Override
	public List<Member> getMemberList(Member input) throws Exception {
		List<Member> result = null;

		try {
			result = sqlSession.selectList("MemberMapper.selectList", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	// 멤버 총 갯수
	@Override
	public int getMemberCount(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.selectCountAll", input);
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}

	// 멤버 추가
	@Override
	public int addMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.insert("MemberMapper.insertItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}

		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("저장에 실패했습니다.");
		}
		return result;
	}

	// 멤버 수정
	@Override
	public int editMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.update("MemberMapper.updateItem", input);

			if (result == 0) {
				throw new NullPointerException("result=0");
			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("수정된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 수정에 실패했습니다.");
		}
		return result;
	}

	// 멤버 삭제
	@Override
	public int deleteMember(Member input) throws Exception {
		int result = 0;

		try {
			sqlSession.update("DeleteMemberMapper.unsetResell", input);
			sqlSession.update("DeleteMemberMapper.unsetReview", input);
			sqlSession.update("DeleteMemberMapper.unsetCart", input);
			sqlSession.update("DeleteMemberMapper.unsetCoupon", input);
			sqlSession.update("DeleteMemberMapper.unsetPoints", input);
			sqlSession.update("DeleteMemberMapper.unsetQna", input);
			sqlSession.update("DeleteMemberMapper.unsetOrders", input);
			sqlSession.update("DeleteMemberMapper.unsetComment", input);
			sqlSession.update("DeleteMemberMapper.unsetDelivery", input);

			result = sqlSession.delete("MemberMapper.deleteItem", input);

//			if (result == 0) {
//				throw new NullPointerException("result=0");
//			}
		} catch (NullPointerException e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("삭제된 데이터가 없습니다.");
		} catch (Exception e) {
			log.error(e.getLocalizedMessage());
			throw new Exception("데이터 삭제에 실패했습니다.");
		}
		return result;
	}

	@Override
	public int checkIdMember(Member input) throws Exception {
		int result = 0;

		try {
			result = sqlSession.selectOne("MemberMapper.idCheck", input);
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("아이디 중복체크에 실패했습니다.");
		}
		return result;
	}

	@Override
	public Member searchId(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.searchId", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("아이디 찾기에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Member searchPw(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.searchPw", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("비밀번호 찾기에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Member resetPw(Member input) throws Exception {
		Member result = null;

		try {
			result = sqlSession.selectOne("MemberMapper.resetPw", input);
			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("비밀번호 변경에 실패했습니다.");
		}

		return result;
	}

	@Override
	public Member checkPw(Member input) throws Exception {
		Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.checkPw",input);
			if(result == null ) {
				throw new NullPointerException("result=null");
			}
		}catch(NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}catch(Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("비밀번호가 다릅니다.");
		}
		return result;
	}

}
