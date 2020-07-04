package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Document;
import com.myncnc.ncnc.service.DocumentService;


import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class DocumentServiceImpl implements DocumentService {
	// MyBatis 객체 주입
	@Autowired
	SqlSession sqlSession;

	// qmenu > qNews 전체 목록 조회
	@Override
	public List<Document> getNewsList(Document input) throws Exception {
		List<Document> result = null;

		try {
			result = sqlSession.selectList("DocumentMapper.selectNewsList",input);
			
			if (result == null) {
                throw new NullPointerException("result=null");
            }
		} catch (NullPointerException e) {
			log.debug(e.getLocalizedMessage());
			throw new Exception("조회된 데이터가 없습니다.");
		} catch (Exception e) {
            log.error(e.getLocalizedMessage());
            throw new Exception("데이터 조회에 실패했습니다.");
        }		
		return result;
	}
	
    // qNews > newsDetail 상세 페이지 조회
	@Override
	public Document getNewsItem(Document input) throws Exception {
		Document result = null;

		try {
			result = sqlSession.selectOne("DocumentMapper.selectDocItem", input);

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
	public void updateDocHit(Document input) throws Exception {		
		sqlSession.update("DocumentMapper.updateDocHit",input);
    }
	
	// qmenu > qEvent(진행중) 전체 목록 조회
    @Override
    public List<Document> getEventList(Document input) throws Exception {
		List<Document> result = null;
		
		try {
			result = sqlSession.selectList("DocumentMapper.selectEventList",input);

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
    public List<Document> getEventendList(Document input) throws Exception {
		List<Document> result = null;
		
		try {
			result = sqlSession.selectList("DocumentMapper.selectEventendList",input);

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
    public Document getEventItem(Document input) throws Exception {
 		Document result = null;

		try {
			result = sqlSession.selectOne("DocumentMapper.selectDocItem", input);

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
    
 	// qEvent/eventDetail d-day 종료여부
 	@Override
 	public void updateDocEnd(Document input) throws Exception {		
 		sqlSession.update("DocumentMapper.updateDocEnd",input);
    }
 
}
