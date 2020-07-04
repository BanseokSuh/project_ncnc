package com.myncnc.ncnc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.RegexHelper;
import com.myncnc.ncnc.helper.UploadItem;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.DocumentImage;
import com.myncnc.ncnc.model.ItemImage;
import com.myncnc.ncnc.service.DocumentImageService;
import com.myncnc.ncnc.service.ItemImageService;

import lombok.extern.slf4j.Slf4j;


/**
 * Handles requests for the application home page.
 */
@Slf4j
@Controller
public class HomeController {
	
	/** WebHelper 주입 */
    @Autowired  
    WebHelper webHelper;

    /** RegexHelper 주입 */
    @Autowired  
    RegexHelper regexHelper;

    /** Service 패턴 구현체 주입 */
    @Autowired  
    DocumentImageService documentImageService;
    
    @Autowired
	ItemImageService itemImageService;

    /** "/프로젝트이름" 에 해당하는 ContextPath 변수 주입 */
    @Value("#{servletContext.contextPath}")
    String contextPath;
    
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public ModelAndView home(Model model) {
		
		DocumentImage indoc = new DocumentImage();
		
		ItemImage inbest = new ItemImage();

		// 조회결과가 저정될 객체
		List<DocumentImage> newsout = null;
		List<DocumentImage> eventout = null;
		
		List<ItemImage> besthot = null;
		List<ItemImage> bestnew = null;
		List<ItemImage> besthigh = null;
		List<ItemImage> bestlow = null;
		
		try {
			// 데이터 조회하기
			newsout = documentImageService.getNewsList(indoc);
			eventout = documentImageService.getEventList(indoc);
			
			besthot = itemImageService.getBestHot(inbest);
			bestnew = itemImageService.getBestNew(inbest);
			besthigh = itemImageService.getBestHigh(inbest);
			bestlow = itemImageService.getBestLow(inbest);

			
		} catch (Exception e) {
			return webHelper.redirect(null,e.getLocalizedMessage());
		}
		
		for(ItemImage item : besthot) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}
		for(ItemImage item : bestnew) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}
		for(ItemImage item : besthigh) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}
		for(ItemImage item : bestlow) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}
		
		
		// View 처리
		model.addAttribute("newsout", newsout);
		model.addAttribute("eventout", eventout);
		
		model.addAttribute("besthot",besthot);
		model.addAttribute("bestnew",bestnew);
		model.addAttribute("besthigh",besthigh);
		model.addAttribute("bestlow",bestlow);
		
		return new ModelAndView("home");
	}
	
//	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
//	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String home(Locale locale, Model model) {
//
//		log.debug("Hello Spring");
//		
//		Date date = new Date();
//		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
//		
//		String formattedDate = dateFormat.format(date);
//		
//		model.addAttribute("serverTime",formattedDate);
//		
//		return "home";
//	}
	
}
