
package com.myncnc.ncnc.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.myncnc.ncnc.model.ItemImage;
import com.myncnc.ncnc.model.Member;
import com.myncnc.ncnc.model.OptionsOrdersItem;
import com.myncnc.ncnc.model.ReviewMemberItemImages;
import com.myncnc.ncnc.model.ReviewMemberOrderImages;
import com.myncnc.ncnc.service.ItemImageService;
import com.myncnc.ncnc.service.ItemService;
import com.myncnc.ncnc.service.OptionsOrdersItemService;
import com.myncnc.ncnc.service.OptionsService;
import com.myncnc.ncnc.service.ReviewMemberItemImagesService;
import com.myncnc.ncnc.service.ReviewMemberOrderImagesService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class ItemController {

	/* WebHelper 주입 */
	// --> import org.springframework.beans.factory.nnotation.Autowired;
	// --> import study.sprng.springhelper.helper.WebHelper;
	@Autowired
	WebHelper webHelper;

	/* RegexHelper 주입 */
	// --> import study.spring.springheler.helper.RegexHelper;
	@Autowired
	RegexHelper regexHelper;

	/* Service 패턴 구현체 주입 */
	// --> import com.myncnc.ncnc.service.ItemService;

	@Autowired
	ItemService itemService;

	/* Service 패턴 구현체 주입 */
	// --> import com.myncnc.ncnc.service.ItemImageService;

	@Autowired
	ItemImageService itemImageService;

	/* Service 패턴 구현체 주입 */
	// --> import com.myncnc.ncnc.service.OptionsOrdersItemService;

	@Autowired
	OptionsOrdersItemService optionsOrdersItemService;

	/* Service 패턴 구현체 주입 */
	// --> import com.myncnc.ncnc.service.OptionsService;
	@Autowired
	OptionsService optionsService;

	/* Service 패턴 구현체 주입 */
	// --> import com.myncnc.ncnc.service.ReviewMemberItemImagesService;

	@Autowired
	ReviewMemberItemImagesService reviewMemberItemImagesService;

	/* Service 패턴 구현체 주입 */
	// --> import com.myncnc.ncnc.service.ReviewMemberOrderImagesService;

	@Autowired
	ReviewMemberOrderImagesService reviewMemberOrderImagesService;

	/* "/프로젝트이름 " 에 해당하는 ContextPath 변수 주입 */
	// --> import org.springframework.beans.factory.annotation.Value;
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/* 대학생 목록페이지 */
	@RequestMapping(value = "/qmenu/qPrdList.do", method = RequestMethod.GET)
	public ModelAndView Uni(Model model) {

		ItemImage input = new ItemImage();

		/* 대학생 */
		List<ItemImage> UniHot = null;

		/* 비즈니스 */
		List<ItemImage> BussinessHot = null;

		/* 초경량 */
		List<ItemImage> LightHot = null;

		/* 게이밍 */
		List<ItemImage> GamingHot = null;

		/* 그래픽 */
		List<ItemImage> GraphicHot = null;

		/* 영상편집 */
		List<ItemImage> VideoHot = null;

		try {
			// 데이터 조회하기

			/* 대학생 */
			UniHot = itemImageService.getUniHot(input);

			/* 비즈니스 */
			BussinessHot = itemImageService.getBussinessHot(input);

			/* 초경량 */
			LightHot = itemImageService.getLightHot(input);

			/* 게이밍 */
			GamingHot = itemImageService.getGamingHot(input);

			/* 그래픽 */
			GraphicHot = itemImageService.getGraphicHot(input);

			/* 영상편집 */
			VideoHot = itemImageService.getVideoHot(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		for(ItemImage item : UniHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : BussinessHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : LightHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : GamingHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : GraphicHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : VideoHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		

		/* 대학생 */
		model.addAttribute("UniHot", UniHot);

		/* 비즈니스 */
		model.addAttribute("BussinessHot", BussinessHot);

		/* 초경량 */
		model.addAttribute("LightHot", LightHot);

		/* 게이밍 */
		model.addAttribute("GamingHot", GamingHot);

		/* 그래픽 */
		model.addAttribute("GraphicHot", GraphicHot);

		/* 영상편집 */
		model.addAttribute("VideoHot", VideoHot);

		return new ModelAndView("qmenu/qPrdList");
	}

	@RequestMapping(value = "/qmenu/qBest.do", method = RequestMethod.GET)
	public ModelAndView qBestsell(Model model) {

		ItemImage input = new ItemImage();

		// 판매순
		List<ItemImage> output = null;
		// 리뷰순
		List<ItemImage> output1 = null;

		try {
			// 데이터 조회하기
			output = itemImageService.getBestSell(input);
			output1 = itemImageService.getBestReview(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		for(ItemImage item : output) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : output1) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		

		model.addAttribute("output", output);
		model.addAttribute("output1", output1);
		return new ModelAndView("qmenu/qBest");
	}

	@RequestMapping(value = "/search/search.do", method = RequestMethod.GET)
	public ModelAndView search(Model model,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword)

	{

		/* 1) 페이지 구현에 필요한 변수값 생성 */

		/* 2) 데이터 조회하기 */
		// 조회에 필요한 조건값 (검색어)를 Beans에 담는다.
		ItemImage input = new ItemImage();
		input.setItem_name(keyword); // 이름말고 스펙을 검색했을시 나오게 하려면?
		input.setItem_brand(keyword);
		input.setItem_graphic(keyword);

		List<ItemImage> searchhot = null;
		List<ItemImage> searchnew = null;
		List<ItemImage> searchhigh = null;
		List<ItemImage> searchlow = null;

		int searchCount = 0;
		try {
			// 데이터 조회하기
			searchhot = itemImageService.getSearch(input);
			searchnew = itemImageService.getSearchNew(input);
			searchhigh = itemImageService.getSearchHigh(input);
			searchlow = itemImageService.getSearchLow(input);

			searchCount = itemImageService.getSearchCount(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		for(ItemImage item : searchhot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : searchnew) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : searchhigh) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		for(ItemImage item : searchlow) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		
		
		/* 3) View 처리 */
		model.addAttribute("keyword", keyword);
		model.addAttribute("hot", searchhot);
		model.addAttribute("news", searchnew);
		model.addAttribute("high", searchhigh);
		model.addAttribute("low", searchlow);
		model.addAttribute("searchCount", searchCount);

		return new ModelAndView("search/search");
	}

	@RequestMapping(value = "/item/hPrdList/hPrdUni.do", method = RequestMethod.GET)
	public ModelAndView hPrdUni(Model model,
			// 검색어
			@RequestParam(value = "keyword", required = false) String keyword,
			// 받아올 키워드
			@RequestParam(value = "item_brand", required = false) String item_brand,
			@RequestParam(value = "item_cpu", required = false) String item_cpu,
			@RequestParam(value = "item_inch", required = false) String item_inch,
			@RequestParam(value = "item_ram", required = false) String item_ram,
			@RequestParam(value = "item_os", required = false) String item_os,
			@RequestParam(value = "item_weight", required = false) String item_weight,
			// 페이지 구현에서 사용할 현재 페이지 번호
			@RequestParam(value = "page", defaultValue = "1") int nowPage) {
		// 파라미터 다 적고 스트링으로 받아

		// input 넣기 전에 숫자형인것들은 parse Int로 변환시켜서 input에 넣어야 함

		ItemImage input = new ItemImage();
		input.setItem_name(keyword);

		if (item_inch != null) {
			float iteminch = Float.parseFloat(item_inch);
			input.setItem_inch(iteminch);
		}
		if (item_ram != null) {
			int itemram = Integer.parseInt(item_ram);
			input.setItem_ram(itemram);
		}
		if (item_weight != null) {
			float itemweight = Float.parseFloat(item_weight);
			input.setItem_weight(itemweight);
		}

		input.setItem_brand(item_brand);
		input.setItem_cpu(item_cpu);
		input.setItem_os(item_os);

		List<ItemImage> UniHot = null;

		try {
			// 데이터 조회하기
			UniHot = itemImageService.getUniHot(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
			
			
			

		}
		
		for(ItemImage item : UniHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		model.addAttribute("UniHot", UniHot);

		return new ModelAndView("item/hPrdList/hPrdUni");

	}

	/********************************************************************************/

	@RequestMapping(value = "/item/hPrdList/hPrdBuss.do", method = RequestMethod.GET)
	public ModelAndView hPrdBuss(Model model,
			// 받아올 키워드
			@RequestParam(value = "item_brand", required = false) String item_brand,
			@RequestParam(value = "item_cpu", required = false) String item_cpu,
			@RequestParam(value = "item_inch", required = false) String item_inch,
			@RequestParam(value = "item_ram", required = false) String item_ram,
			@RequestParam(value = "item_os", required = false) String item_os,
			@RequestParam(value = "item_weight", required = false) String item_weight) {

		// String으로 받은 값을 각각 자료형에 맞게 형변환
		ItemImage input = new ItemImage();

		if (item_inch != null) {
			float iteminch = Float.parseFloat(item_inch);
			input.setItem_inch(iteminch);
		}
		if (item_ram != null) {
			int itemram = Integer.parseInt(item_ram);
			input.setItem_ram(itemram);
		}
		if (item_weight != null) {
			float itemweight = Float.parseFloat(item_weight);
			input.setItem_weight(itemweight);
		}

		input.setItem_brand(item_brand);
		input.setItem_cpu(item_cpu);
		input.setItem_os(item_os);

		List<ItemImage> BussinessHot = null;

		try {
			// 데이터 조회하기
			BussinessHot = itemImageService.getBussinessHot(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		for(ItemImage item : BussinessHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		model.addAttribute("BussinessHot", BussinessHot);

		return new ModelAndView("item/hPrdList/hPrdBuss");

	}

	/***********************************************************************************/

	@RequestMapping(value = "/item/hPrdList/hPrdGaming.do", method = RequestMethod.GET)
	public ModelAndView hPrdGaming(Model model,
			// 받아올 키워드
			@RequestParam(value = "item_brand", required = false) String item_brand,
			@RequestParam(value = "item_cpu", required = false) String item_cpu,
			@RequestParam(value = "item_inch", required = false) String item_inch,
			@RequestParam(value = "item_ram", required = false) String item_ram,
			@RequestParam(value = "item_os", required = false) String item_os,
			@RequestParam(value = "item_weight", required = false) String item_weight) {

		// String으로 받은 값을 각각 자료형에 맞게 형변환
		ItemImage input = new ItemImage();

		if (item_inch != null) {
			float iteminch = Float.parseFloat(item_inch);
			input.setItem_inch(iteminch);
		}
		if (item_ram != null) {
			int itemram = Integer.parseInt(item_ram);
			input.setItem_ram(itemram);
		}
		if (item_weight != null) {
			float itemweight = Float.parseFloat(item_weight);
			input.setItem_weight(itemweight);
		}

		input.setItem_brand(item_brand);
		input.setItem_cpu(item_cpu);
		input.setItem_os(item_os);

		List<ItemImage> GamingHot = null;

		try {
			// 데이터 조회하기
			GamingHot = itemImageService.getGamingHot(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		for(ItemImage item : GamingHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		
		model.addAttribute("GamingHot", GamingHot);

		return new ModelAndView("item/hPrdList/hPrdGaming");

	}

	/***********************************************************************************/

	@RequestMapping(value = "/item/hPrdList/hPrdGraphic.do", method = RequestMethod.GET)
	public ModelAndView hPrdGraphic(Model model,
			// 받아올 키워드
			@RequestParam(value = "item_brand", required = false) String item_brand,
			@RequestParam(value = "item_cpu", required = false) String item_cpu,
			@RequestParam(value = "item_inch", required = false) String item_inch,
			@RequestParam(value = "item_ram", required = false) String item_ram,
			@RequestParam(value = "item_os", required = false) String item_os,
			@RequestParam(value = "item_weight", required = false) String item_weight) {

		// String으로 받은 값을 각각 자료형에 맞게 형변환
		ItemImage input = new ItemImage();

		if (item_inch != null) {
			float iteminch = Float.parseFloat(item_inch);
			input.setItem_inch(iteminch);
		}
		if (item_ram != null) {
			int itemram = Integer.parseInt(item_ram);
			input.setItem_ram(itemram);
		}
		if (item_weight != null) {
			float itemweight = Float.parseFloat(item_weight);
			input.setItem_weight(itemweight);
		}

		input.setItem_brand(item_brand);
		input.setItem_cpu(item_cpu);
		input.setItem_os(item_os);

		List<ItemImage> GraphicHot = null;

		try {
			// 데이터 조회하기
			GraphicHot = itemImageService.getGraphicHot(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		for(ItemImage item : GraphicHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		model.addAttribute("GraphicHot", GraphicHot);

		return new ModelAndView("item/hPrdList/hPrdGraphic");

	}

	/***********************************************************************************/

	@RequestMapping(value = "/item/hPrdList/hPrdLight.do", method = RequestMethod.GET)
	public ModelAndView hPrdLight(Model model,
			// 받아올 키워드
			@RequestParam(value = "item_brand", required = false) String item_brand,
			@RequestParam(value = "item_cpu", required = false) String item_cpu,
			@RequestParam(value = "item_inch", required = false) String item_inch,
			@RequestParam(value = "item_ram", required = false) String item_ram,
			@RequestParam(value = "item_os", required = false) String item_os,
			@RequestParam(value = "item_weight", required = false) String item_weight) {

		// String으로 받은 값을 각각 자료형에 맞게 형변환
		ItemImage input = new ItemImage();

		if (item_inch != null) {
			float iteminch = Float.parseFloat(item_inch);
			input.setItem_inch(iteminch);
		}
		if (item_ram != null) {
			int itemram = Integer.parseInt(item_ram);
			input.setItem_ram(itemram);
		}
		if (item_weight != null) {
			float itemweight = Float.parseFloat(item_weight);
			input.setItem_weight(itemweight);
		}

		input.setItem_brand(item_brand);
		input.setItem_cpu(item_cpu);
		input.setItem_os(item_os);

		List<ItemImage> LightHot = null;

		try {
			// 데이터 조회하기
			LightHot = itemImageService.getLightHot(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		for(ItemImage item : LightHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		model.addAttribute("LightHot", LightHot);

		return new ModelAndView("item/hPrdList/hPrdLight");

	}

	/***********************************************************************************/

	@RequestMapping(value = "/item/hPrdList/hPrdVideo.do", method = RequestMethod.GET)
	public ModelAndView hPrdVideo(Model model,
			// 받아올 키워드
			@RequestParam(value = "item_brand", required = false) String item_brand,
			@RequestParam(value = "item_cpu", required = false) String item_cpu,
			@RequestParam(value = "item_inch", required = false) String item_inch,
			@RequestParam(value = "item_ram", required = false) String item_ram,
			@RequestParam(value = "item_os", required = false) String item_os,
			@RequestParam(value = "item_weight", required = false) String item_weight) {

		// String으로 받은 값을 각각 자료형에 맞게 형변환
		ItemImage input = new ItemImage();

		if (item_inch != null) {
			float iteminch = Float.parseFloat(item_inch);
			input.setItem_inch(iteminch);
		}
		if (item_ram != null) {
			int itemram = Integer.parseInt(item_ram);
			input.setItem_ram(itemram);
		}
		if (item_weight != null) {
			float itemweight = Float.parseFloat(item_weight);
			input.setItem_weight(itemweight);
		}

		input.setItem_brand(item_brand);
		input.setItem_cpu(item_cpu);
		input.setItem_os(item_os);

		List<ItemImage> VideoHot = null;

		try {
			// 데이터 조회하기
			VideoHot = itemImageService.getVideoHot(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());

		}
		
		for(ItemImage item : VideoHot) {
	         String rootDir = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir);
	      }
		model.addAttribute("VideoHot", VideoHot);

		return new ModelAndView("item/hPrdList/hPrdVideo");

	}

	/***********************************************************************************/

	/* 상세페이지 */
	@RequestMapping(value = "/item/prdDetail.do", method = RequestMethod.GET)
	public ModelAndView view(HttpSession session, Model model,
			@RequestParam(value = "item_no", defaultValue = "0") int item_no

	) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");
		int output_item_no = 0;

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능 하므로 반드시 필수값으로 처리해야 한다.
		if (item_no == 0) {
			return webHelper.redirect(null, "no number");
		}
		
		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		ItemImage input = new ItemImage();
		input.setItem_no(item_no);

		// 리뷰를 받을 input1
		ReviewMemberItemImages input1 = new ReviewMemberItemImages();
		input1.setItem_no(item_no);

		// 총 리뷰 개수를 계산할 아이템 번호를 받을 input2
		ReviewMemberOrderImages input2 = new ReviewMemberOrderImages();
		input2.setItem_no(item_no);

		// count 선언
		int count = 0;
		List<ReviewMemberItemImages> review = null;

		// 조회 결과를 저장할 객체
		ItemImage output = null;

		// 이미지를 위한 img 리스트
		List<ItemImage> img = null;
		
		ItemImage img1 = null;

		/** 옵션 목록 조회하기 */
		List<OptionsOrdersItem> output1 = null;

		try {
			// 조회수 증가
			itemImageService.updateItemHit(input);
			// 데이터 조회
			output = itemImageService.getItem(input);
			output1 = optionsOrdersItemService.getOptionsList(null);
			img = itemImageService.getThumnail(input);
			img1 = itemImageService.getImageDetail(input);
			
			review = reviewMemberItemImagesService.getListReivewItemDetail(input1);
			count = reviewMemberOrderImagesService.getCountReivewItem(input2);


			output_item_no = input.getItem_no();

			// output2 = optionsOrdersItemService.getOptionsItem(null);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		// 아이템 이미지
		for(ItemImage item : img) {
	         String rootDir1 = webHelper.getUploadPath(item.getOrigin_name());
	         item.setOrigin_name(rootDir1);
	      }
		
// 아이템 대표 이미지
	         String rootDir1 = webHelper.getUploadPath(output.getOrigin_name());
	         output.setOrigin_name(rootDir1);


		/** 3) view 처리 */
		model.addAttribute("output", output);
		model.addAttribute("output1", output1);
		model.addAttribute("img", img);
		model.addAttribute("img1", img1);
		model.addAttribute("review", review);
		model.addAttribute("count", count);

		model.addAttribute("output_item_no", output_item_no);

		return new ModelAndView("item/prdDetail");

	}

}