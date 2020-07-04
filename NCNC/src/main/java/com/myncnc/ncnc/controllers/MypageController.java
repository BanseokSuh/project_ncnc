package com.myncnc.ncnc.controllers;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.RegexHelper;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.CartMemberItemOptionsImages;
import com.myncnc.ncnc.model.CouponMember;
import com.myncnc.ncnc.model.ItemImage;
import com.myncnc.ncnc.model.Member;
import com.myncnc.ncnc.model.Options;
import com.myncnc.ncnc.model.PointsMember;
import com.myncnc.ncnc.model.QnaMember;
import com.myncnc.ncnc.service.CartMemberItemOptionsImagesService;
import com.myncnc.ncnc.service.CouponMemberService;
import com.myncnc.ncnc.service.DeliveryMemberService;
import com.myncnc.ncnc.service.ItemImageService;
import com.myncnc.ncnc.service.MemberService;
import com.myncnc.ncnc.service.OptionsService;
import com.myncnc.ncnc.service.OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService;
import com.myncnc.ncnc.service.PointsMemberService;
import com.myncnc.ncnc.service.QnaMemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MypageController {

	@Autowired
	WebHelper webHelper;

	@Autowired
	RegexHelper regexHelper;

	@Autowired
	ItemImageService itemImageService;

	@Autowired
	QnaMemberService qnaMemberService;

	@Autowired
	DeliveryMemberService deliveryMemberService;

	@Autowired
	CartMemberItemOptionsImagesService cartMemberItemOptionsImagesService;

	@Autowired
	MemberService memberService;

	@Autowired
	CouponMemberService couponMemberService;

	@Autowired
	OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService ordersMemberPointsDeliveryCouponImagesItemOptionsCartService;

	@Autowired
	PointsMemberService pointsMemberService;

	@Autowired
	OptionsService optionsService;

	// "/프로젝트이름"에 해당하는 ContextPath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 카트목록
	@RequestMapping(value = "/mypage/cartList.do", method = RequestMethod.GET)
	public ModelAndView cartList(HttpSession session, Model model,
			@RequestParam(value = "item_no", defaultValue = "0", required = false) int item_no,
			@RequestParam(value = "opt_no", defaultValue = "0", required = false) int opt_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");
		int output_item_no = 0;

		// 조건
		if (item_no == 0 || opt_no == 0) {
			CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
			input.setMem_no(input_temp.getMem_no());
			List<CartMemberItemOptionsImages> output = null;
			try {
				output = cartMemberItemOptionsImagesService.getCartMemberItemList(input);
				output_item_no = input.getItem_no();
			} catch (Exception e) {
				return webHelper.redirect(null, "try catch error");
			}

			for (CartMemberItemOptionsImages item : output) {
				String rootDir = webHelper.getUploadPath(item.getOrigin_name());
				item.setOrigin_name(rootDir);
			}

			model.addAttribute("output", output);
			model.addAttribute("output_item_no", output_item_no);

			return new ModelAndView("cart/cartList");
		}

		// 상품번호 객체에 저장
		ItemImage input_cart = new ItemImage();
		input_cart.setItem_no(item_no);

		// 결과 객체 생성
		List<CartMemberItemOptionsImages> output = null;

		// 입력객체에 값 전달할 임시 객체 생성
		ItemImage output_cart = null;

		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();

		Options output_opt = new Options();

		// 합계 금액
		int total_price = 0;

		try {
			// 카트에 담을 아이템 가져오기
			output_cart = itemImageService.selectCartItem(input_cart);
			// 세션으로 가져온 멤버 담기
			input.setMem_no(input_temp.getMem_no());
			// 아이템을 카트에 담기
			input.setItem_no(output_cart.getItem_no());
			input.setCart_item_qty(1);
			input.setItem_brand(output_cart.getItem_brand());
			input.setItem_name(output_cart.getItem_name());
			input.setItem_cpu(output_cart.getItem_cpu());
			input.setItem_inch(output_cart.getItem_inch());
			input.setItem_ram(output_cart.getItem_ram());
			input.setItem_os(output_cart.getItem_os());
			input.setItem_weight(output_cart.getItem_weight());
			input.setItem_graphic(output_cart.getItem_graphic());
			input.setItem_ssd(output_cart.getItem_ssd());
			input.setItem_hdd(output_cart.getItem_hdd());
			input.setItem_price(output_cart.getItem_price());
			input.setItem_discount(output_cart.getItem_discount());
			input.setCart_type("A");
			// 파라미터로 받아온 옵션 넘버 담기
			input.setOpt_no(opt_no);

			// 아이템 카트에 담기 실행!
			cartMemberItemOptionsImagesService.addCartMember(input);

			// 카트에 담긴 아이템 리스트 조회하기
			output = cartMemberItemOptionsImagesService.getCartMemberItemList(input);

		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		for (CartMemberItemOptionsImages item : output) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}

		// 뷰 처리
		model.addAttribute("output_opt", output_opt);
		model.addAttribute("output", output);
		model.addAttribute("total_price", total_price);

		return new ModelAndView("cart/cartList");
	}

	// 장바구니 삭제
	@RequestMapping(value = "/mypage/cartDelete.do", method = RequestMethod.GET)
	public ModelAndView cartDelete(HttpSession session, Model model,
			@RequestParam(value = "cart_no", defaultValue = "0") int cart_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");
		int output_item_no = 0;

		// 파라미터 빈즈에 담기
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
		input.setMem_no(input_temp.getMem_no());
		input.setCart_no(cart_no);

		// 뿌려줄 객체 생성
		List<CartMemberItemOptionsImages> output = null;

		// '카트'이므로 A타입으로 설정해줌
		input.setCart_type("A");

		// 합계 금액
		int total_price = 0;

		try {
			// 카트에 담긴 아이템 삭제하기
			cartMemberItemOptionsImagesService.deleteCartOneMember(input);

			// 카트에 담긴 아이템 리스트 조회하기
			output = cartMemberItemOptionsImagesService.getCartMemberItemList(input);
			output_item_no = input.getItem_no();
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		for (CartMemberItemOptionsImages item : output) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}
		
		// 뷰 처리
		model.addAttribute("output", output);
		model.addAttribute("total_price", total_price);
		model.addAttribute("total_price", output_item_no);

		String redirectUrl = contextPath + "/mypage/cartList.do";
		return webHelper.redirect(redirectUrl, "상품이 장바구니에서 삭제되었습니다.");
	}

	// 찜 취소
	@ResponseBody
	@RequestMapping(value = "/mypage/cartDelete_ajax.do", method = RequestMethod.DELETE)
	public Map<String, Object> cartDelete_ajax(HttpSession session, Model model,
			@RequestParam(value = "cart_no", defaultValue = "0", required = false) int cart_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
		input.setMem_no(input_temp.getMem_no());
		input.setCart_no(cart_no);
		input.setCart_type("A");

		try {
			cartMemberItemOptionsImagesService.deleteCartOneMember(input);
		} catch (Exception e) {
			return webHelper.getJsonError("try catch error");
		}

		return webHelper.getJsonData();
	}

	// 비밀번호 변경 페이지 (myPage -> changePw)
	@RequestMapping(value = "/mypage/changePw.do", method = RequestMethod.GET)
	public ModelAndView chagnePw(HttpSession session, Model model) {

		// 페이지 이동
		return new ModelAndView("mypage/changePw");
	}

	// 비밀번호 변경 확인 (changePw -> changePw_ok)
	@RequestMapping(value = "/mypage/changePw_ok.do", method = RequestMethod.POST)
	public ModelAndView chagnePw_ok(HttpSession session, Model model,
			@RequestParam(value = "mem_pw", required = true) String mem_pw) {

		// 세션 정보 빈즈에 저장
		Member input = (Member) session.getAttribute("member");
		input.setMem_pw(mem_pw);

		// 입력값이 없을 경우
		if (input.getMem_pw() == "") {
			return webHelper.redirect(null, "비밀번호를 입력하세요.");
		}

		// 비밀번호 변경
		try {
			memberService.editMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 뷰 처리, 페이지 이동
		String redirectUrl = contextPath + "/mypage/myPage.do";
		return webHelper.redirect(redirectUrl, "비밀번호가 성공적으로 변경되었습니다!");
	}

	// 1:1 문의 페이지 - 쓰기(기본) (myPage -> cnct)
	@RequestMapping(value = "/mypage/cnct.do", method = RequestMethod.GET)
	public ModelAndView cnct(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		QnaMember input = new QnaMember();
		input.setMem_no(input_temp.getMem_no());

		// 결과 객체 생성
		List<QnaMember> output = null;

		// 1:1 문의 목록 조회하기
		try {
			output = qnaMemberService.selectQnaList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 뷰 처리
		model.addAttribute("output", output);
		return new ModelAndView("mypage/cnct");
	}

	// 1:1문의 페이지 - 쓰기(등록 버튼 클릭 시) (cnct -> cnct_ok)
	@RequestMapping(value = "/mypage/cnct_ok.do", method = RequestMethod.POST)
	public ModelAndView cnct_list(HttpSession session, Model model,
			@RequestParam(value = "qna_type", required = true) int qna_type,
			@RequestParam(value = "qna_contents", required = true) String qna_contents) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		QnaMember input = new QnaMember();
		input.setMem_no(input_temp.getMem_no());
		input.setQna_type(qna_type);
		input.setQna_contents(qna_contents);

		// 목록 페이지 객체 생성
		List<QnaMember> output = null;
		String show_status = null;

		if (input.getQna_type() == 0) {
			return webHelper.redirect(null, "질문 유형을 선택해주세요.");
		}

		// 글 등록하기
		try {
			qnaMemberService.addQna(input);
			output = qnaMemberService.selectQnaList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 뷰 처리
		model.addAttribute("show_status", show_status);
		model.addAttribute("output", output);

		// 입력 후 페이지 이동 처리
		String redirectUrl = contextPath + "/mypage/cnct.do";
		return webHelper.redirect(redirectUrl, "문의가 성공적으로 작성되었습니다!");
	}

	// 1:1문의 페이지 - 쓰기(취소 버튼 클릭 시)
	@RequestMapping(value = "/mypage/cnct_cancel.do", method = RequestMethod.GET)
	public ModelAndView cnct_cancel(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		QnaMember input = new QnaMember();
		input.setMem_no(input_temp.getMem_no());

		String redirectUrl = contextPath + "/mypage/myPage.do";
		return webHelper.redirect(redirectUrl, "이전 페이지로 돌아갑니다.");
	}

	// 1:1문의 페이지 - 목록(작성한 문의 삭제시)
	@RequestMapping(value = "/mypage/cnct_delete.do", method = RequestMethod.GET)
	public ModelAndView cnct_delete(HttpSession session, Model model,
			@RequestParam(value = "qna_no", defaultValue = "0") int qna_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		QnaMember input = new QnaMember();
		input.setMem_no(input_temp.getMem_no());
		input.setQna_no(qna_no);

		try {
			qnaMemberService.deleteQna(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		String redirectUrl = contextPath + "/mypage/cnct.do";
		return webHelper.redirect(redirectUrl, "문의가 성공적으로 삭제되었습니다!");
	}

	// 찜 목록 페이지
	@RequestMapping(value = "/mypage/jjim.do", method = RequestMethod.GET)
	public ModelAndView jjim(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
		input.setMem_id(input_temp.getMem_id());
		input.setMem_no(input_temp.getMem_no());

		int output_count = 0;

		// '찜'이므로 B타입으로 설정해줌
		input.setCart_type("B");

		// 결과 객체 생성
		List<CartMemberItemOptionsImages> output = null;

		try {
			output = cartMemberItemOptionsImagesService.getJJimMemberItemList(input);
			output_count = cartMemberItemOptionsImagesService.getCartMemberCount(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}
		
		for (CartMemberItemOptionsImages item : output) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}

		// 뷰 처리
		model.addAttribute("output_count", output_count);
		model.addAttribute("output", output);
		return new ModelAndView("mypage/jjim");
	}

	// 상품상세 - 찜 추가
	@ResponseBody
	@RequestMapping(value = "/mypage/jjim_select.do", method = RequestMethod.POST)
	public Map<String, Object> jjim_select(HttpSession session, Model model,
			@RequestParam(value = "item_no", defaultValue = "0", required = false) int item_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 임시객체 생성 후 파라미터 빈즈에 담기
		ItemImage input_cart = new ItemImage();
		input_cart.setItem_no(item_no);

		// 임시객체 생성
		ItemImage output_cart = null;

		// 값 저장할 객체 생성
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();

		try {
			output_cart = itemImageService.selectCartItem(input_cart);

			input.setMem_no(input_temp.getMem_no());
			// 아이템을 카트에 담기
			input.setItem_no(output_cart.getItem_no());
			input.setCart_item_qty(1);
			input.setItem_brand(output_cart.getItem_brand());
			input.setItem_name(output_cart.getItem_name());
			input.setItem_cpu(output_cart.getItem_cpu());
			input.setItem_inch(output_cart.getItem_inch());
			input.setItem_ram(output_cart.getItem_ram());
			input.setItem_os(output_cart.getItem_os());
			input.setItem_weight(output_cart.getItem_weight());
			input.setItem_graphic(output_cart.getItem_graphic());
			input.setItem_ssd(output_cart.getItem_ssd());
			input.setItem_hdd(output_cart.getItem_hdd());
			input.setItem_price(output_cart.getItem_price());
			input.setItem_discount(output_cart.getItem_discount());
			// '찜'이기 때문에 'B'로 설정
			input.setCart_type("B");
			// 파라미터로 받아온 옵션 넘버 담기
			input.setOpt_no(1);
			// 정보 담은 객체로 장바구니 추가 메서드 실행
			cartMemberItemOptionsImagesService.addCartMember(input);
		} catch (Exception e) {
			return webHelper.getJsonError("try catch error");
		}
		return webHelper.getJsonData();
	}

	// 상품상세 - 찜 취소
	@ResponseBody
	@RequestMapping(value = "/mypage/jjim_cancel.do", method = RequestMethod.DELETE)
	public Map<String, Object> jjim_cancel(HttpSession session, Model model,
			@RequestParam(value = "item_no", defaultValue = "0", required = false) int item_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
		input.setMem_no(input_temp.getMem_no());
		input.setItem_no(item_no);
		input.setCart_type("B");

		try {
			cartMemberItemOptionsImagesService.deleteJjimOneMember(input);
		} catch (Exception e) {
			return webHelper.getJsonError("try catch error");
		}

		return webHelper.getJsonData();
	}

	// 마이페이지 - 찜 목록 - 전체 삭제
	@RequestMapping(value = "/mypage/jjim_delete.do", method = RequestMethod.GET)
	public ModelAndView jjim_delete(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
		input.setMem_no(input_temp.getMem_no());

		// '찜'이므로 B타입으로 설정해줌
		input.setCart_type("B");

		try {
			cartMemberItemOptionsImagesService.deleteCartMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 뷰 처리
		return webHelper.redirect(contextPath + "/mypage/jjim.do", "모든 찜 상품이 성공적으로 삭제되었습니다.");
	}

	// 마이페이지 - 찜 목록 - 개별 삭제
	@RequestMapping(value = "/mypage/jjim_deleteOne.do", method = RequestMethod.GET)
	public ModelAndView jjim_deleteOne(HttpSession session, Model model,
			@RequestParam(value = "cart_no", defaultValue = "0") int cart_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 담기
		CartMemberItemOptionsImages input = new CartMemberItemOptionsImages();
		input.setMem_no(input_temp.getMem_no());
		input.setCart_no(cart_no);

		// '찜'이므로 A타입으로 설정해줌
		input.setCart_type("B");

		try {
			cartMemberItemOptionsImagesService.deleteCartOneMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 뷰 처리, 페이지 이동
		return webHelper.redirect(contextPath + "/mypage/jjim.do", "찜된 상품이 성공적으로 삭제되었습니다.");
	}

	// 회원정보 수정 페이지
	@RequestMapping(value = "/mypage/memInfoChange.do", method = RequestMethod.GET)
	public ModelAndView memberInfoChange(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input = (Member) session.getAttribute("member");

		// 결과 객체 생성
		Member output = new Member();

		try {
			output = memberService.getMemberItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 성별에 따른 아웃풋 설정
		String gender = null;
		if (output.getMem_gender().equals("2")) {
			gender = "남자";
		} else {
			gender = "여자";
		}

		// view 처리
		model.addAttribute("gender", gender);
		model.addAttribute("output", output);
		return new ModelAndView("mypage/memInfoChange");
	}

	// // 회원정보 수정 페이지 - 확인 버튼 클릭시
	@RequestMapping(value = "/mypage/memInfoChange_ok.do", method = RequestMethod.POST)
	public ModelAndView memInfoChange_ok(HttpSession session, Model model,
			@RequestParam(value = "mem_email", required = true) String mem_email,
			@RequestParam(value = "mem_tel", required = true) String mem_tel,
			@RequestParam(value = "mem_postcode", required = true) String mem_postcode,
			@RequestParam(value = "mem_addr1", required = true) String mem_addr1,
			@RequestParam(value = "mem_addr2", required = true) String mem_addr2) {

		// 세션 정보 빈즈에 저장, 파라미터 저장
		Member input = (Member) session.getAttribute("member");
		input.setMem_email(mem_email);
		input.setMem_tel(mem_tel);
		input.setMem_postcode(mem_postcode);
		input.setMem_addr1(mem_addr1);
		input.setMem_addr2(mem_addr2);

		// 회원정보 수정
		try {
			memberService.editMember(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 입력란이 공백일 시
		if (input.getMem_email() == "") {
			return webHelper.redirect(null, "주소를 입력해주세요.");
		}
		if (input.getMem_tel() == "") {
			return webHelper.redirect(null, "연락처를 입력해주세요.");
		}
		if (input.getMem_postcode() == "") {
			return webHelper.redirect(null, "우편번호를 입력해주세요.");
		}
		if (input.getMem_addr1() == "") {
			return webHelper.redirect(null, "주소를 입력해주세요.");
		}
		if (input.getMem_addr2() == "") {
			return webHelper.redirect(null, "상세주소를 입력해주세요.");
		}

		// 수정 후 마이페이지로 이동 처리
		String redirectUrl = contextPath + "/mypage/myPage.do";
		return webHelper.redirect(redirectUrl, "회원님의 정보가 성공적으로 변경되었습니다!");
	}

	// 회원정보 삭제 페이지 - 회원탈퇴
	@RequestMapping(value = "/mypage/memInfo_delete.do", method = RequestMethod.GET)
	public ModelAndView memInfo_delete(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장, 파라미터 저장
		Member input = (Member) session.getAttribute("member");

		// 회원 탈퇴(수정처리함)
		try {
			memberService.deleteMember(input);
		} catch (Exception e) {
			return webHelper.redirect(contextPath, "try catch error");
		}

		// 회원 탈퇴 후 세션 삭제
		session.removeAttribute("member");

		// 수정 후 마이페이지로 이동 처리
		String redirectUrl = contextPath + "/home.do";
		return webHelper.redirect(redirectUrl, "회원 탈퇴 되었습니다.");

	}

	// 쿠폰 목록 조회 페이지
	@RequestMapping(value = "/mypage/myCoupon.do", method = RequestMethod.GET)
	public ModelAndView myCoupon(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 파라미터 빈즈에 저장
		CouponMember input = new CouponMember();
		input.setMem_id(input_temp.getMem_id());
		input.setMem_no(input_temp.getMem_no());

		// 쿠폰 개수 객체 생성
		int output_count = 0;

		// 결과 객체 생성
		List<CouponMember> output = null;

		try {
			output_count = couponMemberService.getCouponCount(input);
			output = couponMemberService.getCouponMemberList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		// 뷰 처리
		model.addAttribute("output_count", output_count);
		model.addAttribute("output", output);
		return new ModelAndView("mypage/myCoupon");
	}

	// 비밀번호 변경 전 비밀번호 점검 페이지
	@RequestMapping(value = "/mypage/myInfoChange.do", method = RequestMethod.GET)
	public ModelAndView myInfoChagne(HttpSession session, Model model) {

		// 뷰 처리
		return new ModelAndView("mypage/myInfoChange");
	}

	// 비밀번호 변경 전 비밀번호 점검 페이지
	@RequestMapping(value = "/mypage/myInfoChange_ok.do", method = RequestMethod.POST)
	public ModelAndView myInfoChagne_ok(HttpSession session, Model model,
			@RequestParam(value = "mem_pw", required = true) String mem_pw) {

		// 세션 정보 빈즈에 저장
		Member input = (Member) session.getAttribute("member");

		String check_pw = input.getMem_pw();

		// 비밀번호를 기입하지 않았을 시
		if (mem_pw == "") {
			return webHelper.redirect(null, "비밀번호를 입력해주세요.");
		}

		// 비밀번호가 기존비밀번호랑 다를 시
		if (!check_pw.equals(mem_pw)) {
			return webHelper.redirect(null, "비밀번호가 올바르지 않습니다.");
		}

		// 결과 객체 생성
		Member output = new Member();

		try {
			output = memberService.getMemberItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 성별에 따른 아웃풋 설정
		String gender = null;
		if (output.getMem_gender().equals("2")) {
			gender = "여자";
		} else {
			gender = "남자";
		}

		// view 처리
		model.addAttribute("gender", gender);
		model.addAttribute("output", output);
		return new ModelAndView("mypage/memInfoChange");
	}

	// 멤버십 정보
	@RequestMapping(value = "/mypage/myMember.do", method = RequestMethod.GET)
	public ModelAndView myMember(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input = (Member) session.getAttribute("member");

		// 결과 객체 생성
		Member output = null;

		try {
			output = memberService.getMemberItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 뷰 처리
		model.addAttribute("output", output);
		return new ModelAndView("mypage/myMember");
	}

	// 마이 페이지
	@RequestMapping(value = "/mypage/myPage.do", method = RequestMethod.GET)
	public ModelAndView myPage(HttpSession session, Model model) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 쿠폰, 포인트 객체 생성
		CouponMember input_cou = new CouponMember();
		input_cou.setMem_no(input_temp.getMem_no());
		PointsMember input_po = new PointsMember();
		input_po.setMem_no(input_temp.getMem_no());

		// 쿠폰 갯수 출력 그릇
		int output_count = 0;

		// 포인트 출력 그릇
		PointsMember output_po = null;

		try {
			output_count = couponMemberService.getCouponCount(input_cou);
			output_po = pointsMemberService.getPointsMemberItem(input_po);
		} catch (Exception e) {
			return webHelper.redirect(null, "try catch error");
		}

		// 뷰 처리
		model.addAttribute("output_po", output_po);
		model.addAttribute("output_count", output_count);
		return new ModelAndView("mypage/myPage");
	}
}