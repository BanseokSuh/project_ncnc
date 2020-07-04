package com.myncnc.ncnc.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myncnc.ncnc.model.QnaMember;
import com.myncnc.ncnc.service.QnaMemberService;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class QnaMemberServiceImpl implements QnaMemberService {

   @Autowired
   SqlSession sqlSession;

   // 1:1 문의 > 입력
   @Override
   public int addQna(QnaMember input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.insert("QnaMemberMapper.insertQnaMemberItem", input);
         
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
   public QnaMember selectQna(QnaMember input) throws Exception {
      QnaMember result = null;

      try {
         result = sqlSession.selectOne("QnaMemberMapper.selectQnaMemberItem", input);

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
   public List<QnaMember> selectQnaList(QnaMember input) throws Exception {
      List<QnaMember> result = null;

      try {
         result = sqlSession.selectList("QnaMemberMapper.selectQnaMemberList", input);

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
   public int deleteQna(QnaMember input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.delete("QnaMemberMapper.deleteQnaMemberItem", input);

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
   public int editQna(QnaMember input) throws Exception {
      int result = 0;

      try {
         result = sqlSession.update("QnaMemberMapper.editQnaMemberItem", input);

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
