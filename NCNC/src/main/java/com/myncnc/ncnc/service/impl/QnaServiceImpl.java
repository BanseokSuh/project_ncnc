package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.Qna;
import com.myncnc.ncnc.service.QnaService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaServiceImpl implements QnaService {

   @Autowired
   SqlSession sqlSession;

   // 1:1 문의 > 입력
   @Override
   public int addQna(Qna input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.insert("QnaMapper.insertQnaItem", null);

         if (result == 0) {
            throw new NullPointerException("result=0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("저장된 데이터가 없습니다.");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 저장에 실패했습니다.");
      }
      return result;
   }

   // 1:1 문의 > 조회
   @Override
   public Qna selectQna(Qna input) throws Exception {
      Qna result = null;

      try {
         result = sqlSession.selectOne("QnaMapper.selectQnaItem", input);

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

   // 1:1 문의 > 목록조회
   @Override
   public List<Qna> selectQnaList(Qna input) throws Exception {
      List<Qna> result = null;

      try {
         result = sqlSession.selectList("QnaMapper.selectQnaList", input);

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

   // 1:1 문의 > 삭제
   @Override
   public int deleteQna(Qna input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.delete("QnaMapper.deleteQnaItem", input);

         if (result == 0) {
            throw new NullPointerException("result=0");
         }
      } catch (NullPointerException e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("삭제된 데이터가 없습니다");
      } catch (Exception e) {
         log.error(e.getLocalizedMessage());
         throw new Exception("데이터 삭제에 실패했습니다.");
      }
      return result;
   }

   // 1:1 문의 > 수정
   @Override
   public int editQna(Qna input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("QnaMapper.editQnaItem", input);

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

}


