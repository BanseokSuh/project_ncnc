package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.Qna;



public interface QnaService {

   // 1:1 문의 > 입력 (cnct.jsp)
   public int addQna(Qna input) throws Exception;

   // 1:1 문의 > 조회 (cnct.jsp)
   public Qna selectQna(Qna input) throws Exception;

   // 1:1 문의 > 목록 조회 (cnct.jsp)
   public List<Qna> selectQnaList(Qna input) throws Exception;

   // 1:1 문의 > 삭제 (cnct.jsp)
   public int deleteQna(Qna input) throws Exception;

   // 1:1 문의 > 수정 (cnct.jsp)
   public int editQna(Qna input) throws Exception;

}
