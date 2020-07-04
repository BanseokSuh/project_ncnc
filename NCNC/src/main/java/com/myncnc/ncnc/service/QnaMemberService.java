package com.myncnc.ncnc.service;

import java.util.List;

import com.myncnc.ncnc.model.QnaMember;


public interface QnaMemberService {

   // 1:1 문의 > 입력 (cnct.jsp)
   public int addQna(QnaMember input) throws Exception;

   // 1:1 문의 > 조회 (cnct.jsp)
   public QnaMember selectQna(QnaMember input) throws Exception;

   // 1:1 문의 > 목록 조회 (cnct.jsp)
   public List<QnaMember> selectQnaList(QnaMember input) throws Exception;

   // 1:1 문의 > 삭제 (cnct.jsp)
   public int deleteQna(QnaMember input) throws Exception;

   // 1:1 문의 > 수정 (cnct.jsp)
   public int editQna(QnaMember input) throws Exception;

}
