package com.myncnc.ncnc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.PageData;
import com.myncnc.ncnc.helper.RegexHelper;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.Document;
import com.myncnc.ncnc.model.ItemImage;
import com.myncnc.ncnc.service.DocumentService;
import com.myncnc.ncnc.service.ItemImageService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class HomeRestController {
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
	ItemImageService itemImageService;

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
	@RequestMapping(value = "/ajax", method = RequestMethod.GET)
	public Map<String,Object> get_list(
			@RequestParam(value="page",defaultValue="1") int nowPage) {
		
		// 페이지 구현 변수
		int totalCount = 0;
		int listCount = 8;
		int pageCount = 5;
		
		ItemImage inbest = new ItemImage();
		PageData pageData = null;

		
		// 조회결과가 저정될 객체
		List<ItemImage> besthot = null;
		
		try {
			// 전체 게시글 수 조회
			totalCount = itemImageService.getItemCount(inbest);
			// 페이지 번호 계산
			pageData = new PageData(nowPage, totalCount, listCount, pageCount);
			
			// SQL의 LIMIT 절
			ItemImage.setOffset(pageData.getOffset());
			ItemImage.setListCount(pageData.getListCount());
			
			besthot = itemImageService.getBestHot(inbest);
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		// Json 처리
		Map<String,Object> data = new HashMap<String,Object>();
		data.put("besthot", besthot);
		data.put("pageData", pageData);
		return webHelper.getJsonData(data);
	}
}
