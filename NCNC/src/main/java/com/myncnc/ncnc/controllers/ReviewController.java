package com.myncnc.ncnc.controllers;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.MailHelper;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.ItemImage;
import com.myncnc.ncnc.model.Member;
import com.myncnc.ncnc.model.OrdersMemberPointsDeliveryCouponImagesItemOptionsCart;
import com.myncnc.ncnc.model.Review;
import com.myncnc.ncnc.model.ReviewMemberOrderImages;
import com.myncnc.ncnc.service.MemberService;
import com.myncnc.ncnc.service.OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService;
import com.myncnc.ncnc.service.ReviewMemberOrderImagesService;
import com.myncnc.ncnc.service.ReviewService;

@Controller
public class ReviewController {
	

	@Autowired
	WebHelper webHelper;

	@Autowired
	MailHelper mailHelper;

	@Autowired
	MemberService memberService;

	@Autowired
	ReviewMemberOrderImagesService reviewMemberOrderImagesService;
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService ordersMemberPointsDeliveryCouponImagesItemOptionsCartService;

	@Value("#{servletContext.contextPath}")
	String contextPath;
	
	@RequestMapping(value="/review/write.do",method=RequestMethod.GET)
	public ModelAndView writeReviewItem(HttpSession session, Model model,
			@RequestParam(value="ord_no",defaultValue="0") int ord_no) {
		
		Member mem = (Member) session.getAttribute("member");
		
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		input.setOrd_no(ord_no);
		input.setMem_no(mem.getMem_no());
		
		ReviewMemberOrderImages itemno = new ReviewMemberOrderImages();
		itemno.setOrd_no(ord_no);
		
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart output = null;
		ReviewMemberOrderImages outitemno = new ReviewMemberOrderImages();
		
		try {
			output = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectAllOne(input);
			outitemno = reviewMemberOrderImagesService.getItemNo(itemno);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		
		String rootDir = webHelper.getUploadPath(output.getOrigin_name());
		output.setOrigin_name(rootDir);
		
		
		model.addAttribute("output",output);
		model.addAttribute("itemno",outitemno);
		
		return new ModelAndView("review/writeReview");
	}
	
	@RequestMapping(value = "/review/write_ok.do", method = RequestMethod.GET)
	public ModelAndView writeReview(HttpSession session, Model model, 
			@RequestParam(value = "rev_title", defaultValue = "") String rev_title,
			@RequestParam(value = "rev_content", defaultValue = "") String rev_content,
			@RequestParam(value = "rev_star", defaultValue = "0") int rev_star,
			@RequestParam(value = "item_no",defaultValue="") int item_no,
			@RequestParam(value = "mem_no",defaultValue="0") int mem_no) {

		Member mem = (Member) session.getAttribute("member");
		
		// 데이터 조회하기
		Review input = new Review(); 
		input.setRev_title(rev_title);
		input.setRev_contents(rev_content);
		input.setRev_star(rev_star);
		input.setItem_no(item_no);
		input.setMem_no(mem.getMem_no());
		
		
		try {
			reviewService.getaddReview(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		String redirectUrl = contextPath + "/review/myReviewList.do?mem_no=" + mem.getMem_no();		
		return webHelper.redirect(redirectUrl, null);
	}
	
	@RequestMapping(value="/review/myReviewList.do",method=RequestMethod.GET)
	public ModelAndView myReviewList(HttpSession session ,Model model,
			@RequestParam(value="mem_no", required=false) int mem_no) {
		
		Member mem = (Member) session.getAttribute("member");
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart ord_list = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		ord_list.setMem_no(mem_no);
		
		ReviewMemberOrderImages input = new ReviewMemberOrderImages();
		input.setMem_no(mem.getMem_no());
		
		List<ReviewMemberOrderImages> memput = null;
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> ordout = null;
		try {
			ordout = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectPieceList(ord_list);
			memput = reviewMemberOrderImagesService.getListReivewMember(input);
		} catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		for(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart item : ordout) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}
		for(ReviewMemberOrderImages item : memput) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}
		
		model.addAttribute("ordout",ordout);
		model.addAttribute("memput",memput);
		
		return new ModelAndView("review/myReviewList");
	}
	
	@RequestMapping(value="/review/reviewDelete.do",method=RequestMethod.GET)
	public ModelAndView reviewDelete(HttpSession session ,Model model,
			@RequestParam(value="rev_no", required=false) int rev_no) {
		
		Member mem = (Member) session.getAttribute("member");
		Review input = new Review();
		input.setRev_no(rev_no);
		
		try {
			reviewService.getdeleteReview(input);
		}catch(Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		String path = contextPath + "/review/myReviewList.do?mem_no=" + mem.getMem_no();
		return webHelper.redirect(path, "Delete complete.");
	}
}
