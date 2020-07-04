package com.myncnc.ncnc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.RegexHelper;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.Document;
import com.myncnc.ncnc.model.DocumentImage;
import com.myncnc.ncnc.service.DocumentImageService;
import com.myncnc.ncnc.service.DocumentService;

@Controller
public class QmenuController {
	
	/** WebHelper 주입 */
    @Autowired  
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired  
    DocumentService documentService;
    
    @Autowired  
    DocumentImageService documentImageService;

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
    /** qmenu > qNews 전체 목록페이지 */
    @RequestMapping(value = "/qmenu/qNews.do", method = RequestMethod.GET)
    public ModelAndView qNews(Model model) {

        /** 1) 페이지 구현에 필요한 변수값 생성 */

        /** 2) 데이터 조회하기 */
    	DocumentImage input = new DocumentImage();
        
        // 조회결과가 저장될 객체
        List<DocumentImage> output = null;  


        try {
        	
            // 데이터 조회하기
            output = documentImageService.getNewsList(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("output", output);
        
        return new ModelAndView("qmenu/qNews");
    }
      
    /** qNews > newsDetail 상세페이지 */
    @RequestMapping(value = "/qmenu/newsDetail.do", method = RequestMethod.GET)
    public ModelAndView newsDetail(Model model,
    		@RequestParam(value="doc_no", defaultValue="0") int doc_no) {
    	
    	/** 1) 유효성 검사  	 */
    	// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (doc_no == 0) {
            return webHelper.redirect(null, "게시글을 찾을 수가 없습니다.");
        }

        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        DocumentImage input = new DocumentImage();
        input.setDoc_no(doc_no);

        // 조회결과를 저장할 객체 선언
        DocumentImage output = null;

        try {
        	
        	// newsDetail 조회수 증가 
        	documentImageService.updateDocHit(input);

            // 데이터 조회
            output = documentImageService.getNewsItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        /** 3) View 처리 */
        model.addAttribute("output", output);
        
        return new ModelAndView("qmenu/newsDetail");	
    }
    
    /** qmenu > qEvent 전체 목록 조회 */
    @RequestMapping(value = "/qmenu/qEvent.do", method = RequestMethod.GET)
    public ModelAndView qEvent(Model model) {

        /** 1) 페이지 구현에 필요한 변수값 생성 */           

        /** 2) 데이터 조회하기 */
        DocumentImage input = new DocumentImage();
        
        // 조회결과가 저장될 객체
        List<DocumentImage> output = null;
        List<DocumentImage> output2 = null;

        try {
            // 데이터 조회하기
            output = documentImageService.getEventList(input);
            output2 = documentImageService.getEventendList(input);
          
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }

        /** 3) View 처리 */
        model.addAttribute("output", output );
        model.addAttribute("output2", output2 );

        return new ModelAndView("qmenu/qEvent");
    }
    
    /** qEvent > eventDetail 상세페이지 */
    @RequestMapping(value = "/qmenu/eventDetail.do", method = RequestMethod.GET)
    public ModelAndView eventDetail(Model model,
    		@RequestParam(value="doc_no", defaultValue="0") int doc_no) {
    	
    	/** 1) 유효성 검사  	 */
    	// 이 값이 존재하지 않는다면 데이터 조회가 불가능하므로 반드시 필수값으로 처리해야 한다.
        if (doc_no == 0) {
            return webHelper.redirect(null, "게시글을 찾을 수가 없습니다.");
        }

        /** 2) 데이터 조회하기 */
        // 데이터 조회에 필요한 조건값을 Beans에 저장하기
        DocumentImage input = new DocumentImage();
        input.setDoc_no(doc_no);

        // 조회결과를 저장할 객체 선언
        DocumentImage output = null;

        try {
        	// newsDetail 조회수 증가 
        	documentImageService.updateDocHit(input);

            // 데이터 조회
            output = documentImageService.getEventItem(input);
        } catch (Exception e) {
            return webHelper.redirect(null, e.getLocalizedMessage());
        }
        
        /** 3) View 처리 */
        model.addAttribute("output", output);
        
        return new ModelAndView("qmenu/eventDetail");	
    }

}
