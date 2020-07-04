package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.DocumentImage;
import com.myncnc.ncnc.service.DocumentImageService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DocumentImageServiceImpl implements DocumentImageService {
	// MyBatis 객체 주입
	@Autowired
	SqlSession sqlSession;

	// qmenu > qNews 전체 목록 조회
	@Override
	public List<DocumentImage> getNewsList(DocumentImage input) throws Exception {
		List<DocumentImage> result = null;
		
		try {
			result = sqlSession.selectList("DocumentImageMapper.selectNewsList",input);

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
	
    // qNews > newsDetail 상세 페이지 조회
	@Override
	public DocumentImage getNewsItem(DocumentImage input) throws Exception {
		DocumentImage result = null;

		try {
			result = sqlSession.selectOne("DocumentImageMapper.selectNewsItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
	}
	
    // Document 조회수 증가
	@Override
	public void updateDocHit(DocumentImage input) throws Exception {		
		sqlSession.update("DocumentImageMapper.updateDocHit",input);
    }
	
	// qmenu > qEvent(진행중) 전체 목록 조회
    @Override
    public List<DocumentImage> getEventList(DocumentImage input) throws Exception {
		List<DocumentImage> result = null;
		
		try {
			result = sqlSession.selectList("DocumentImageMapper.selectEventList",input);

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

    // qmenu > qEvent(완료) 전체 목록 조회
    @Override
    public List<DocumentImage> getEventendList(DocumentImage input) throws Exception {
		List<DocumentImage> result = null;
		
		try {
			result = sqlSession.selectList("DocumentImageMapper.selectEventendList",input);

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
    
    // qEvent > eventDetail 상세 페이지 조회
 	@Override
    public DocumentImage getEventItem(DocumentImage input) throws Exception {
 		DocumentImage result = null;

		try {
			result = sqlSession.selectOne("DocumentImageMapper.selectEventItem", input);

			if (result == null) {
				throw new NullPointerException("result=null");
			}
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("데이터 조회에 실패했습니다.");
		}
		return result;
 	}
 
}
