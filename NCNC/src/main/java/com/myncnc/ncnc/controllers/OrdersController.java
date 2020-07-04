package com.myncnc.ncnc.controllers;

import java.net.URLDecoder;
import java.util.ArrayList;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.RegexHelper;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.Coupon;
import com.myncnc.ncnc.model.Member;
import com.myncnc.ncnc.model.Orders;
import com.myncnc.ncnc.model.OrdersMemberPointsDeliveryCouponImagesItemOptionsCart;
import com.myncnc.ncnc.service.CouponService;
import com.myncnc.ncnc.service.DeliveryMemberService;
import com.myncnc.ncnc.service.OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService;
import com.myncnc.ncnc.service.OrdersService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrdersController {

	// webhelper 주입
	@Autowired
	WebHelper webHelper;

	// regexhelper 주입
	@Autowired
	RegexHelper regexHelper;

	// service 패턴 구현체 주입
	@Autowired
	OrdersService ordersService;

	// service 패턴 구현체 주입
	@Autowired
	CouponService couponService;

	// service 패턴 구현체 주입
	@Autowired
	DeliveryMemberService deliveryMemberService;

	@Autowired
	OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService ordersMemberPointsDeliveryCouponImagesItemOptionsCartService;

	// 프로젝트 이름에 해당하는 contextpath 변수 주입
	@Value("#{servletContext.contextPath}")
	String contextPath;

	/*****************************************************************
	 * 다중행 조회를 위한 기능정의 => 마이페이지 > 주문내역 (내용 일부 노출, 최근 날짜별로) => myOrderList
	 */
	@RequestMapping(value = "/mypage/myOrderList.do", method = RequestMethod.GET)
	public ModelAndView orderlist(Model model, HttpSession session) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		/** 1) 데이터 조회하기 */
		// 조회에 필요한 조건값(검색어)를 beans에 담는다
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		input.setMem_no(input_temp.getMem_no());

		// 조회결과가 저장될 객체
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> output = null;

		try {
			// 데이터 조회하기
			output = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectPieceList(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		for (OrdersMemberPointsDeliveryCouponImagesItemOptionsCart item : output) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}

		/** 2) view 처리 */

		model.addAttribute("output", output);

		return new ModelAndView("mypage/myOrderList");
	}

	/*****************************************************************
	 * 단일행 조회를 위한 기능정의 => 마이페이지 > 주문내역 > 하나의 주문내역 상세페이지 (전부노출) myOrderDetail
	 **/

	@RequestMapping(value = "/mypage/myOrderDetail.do", method = RequestMethod.GET)
	public ModelAndView orderDetail(Model model, HttpSession session,
			@RequestParam(value = "ord_no", defaultValue = "0") int ord_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		/** 1) 유효성 검사 */
		// 이 값이 존재하지 않는다면 데이터 조회가 불가능 하므로 반드시 필수갑승로 처리해야한다
		if (ord_no == 0) {
			return webHelper.redirect(null, "주문번호가 없습니다.");
		}

		/** 2) 데이터 조회하기 */
		// 데이터 조회에 필요한 조건값을 bean에 저장하기
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		input.setOrd_no(ord_no);
		input.setMem_no(input_temp.getMem_no());

		// 조회결과를 저장할 객체 선언
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart output = null;

		try {
			// 데이터 조회
			output = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectAllOne(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 스펙 정리해서 하나로 묶고 담기 */
		String spec = output.getItem_cpu() + "/" + output.getItem_inch() + "/" + output.getItem_ram() + "/"
				+ output.getItem_os() + "/" + output.getItem_weight() + "/" + output.getItem_graphic() + "/"
				+ output.getItem_ssd() + "/" + output.getItem_hdd();

		/** 주문번호 만들기 */
		String now_date = output.getOrders_date();

		String date = now_date.replace("-", "");
		date = date.replace(" ", "");
		date = date.replace(":", "");

		String orders_number = date + input_temp.getMem_no();

		String rootDir = webHelper.getUploadPath(output.getOrigin_name());
		output.setOrigin_name(rootDir);

		/** 3) view 처리 */
		model.addAttribute("output", output);
		model.addAttribute("spec", spec);
		model.addAttribute("orders_number", orders_number);

		return new ModelAndView("mypage/myOrderDetail");
	}

	/*****************************************************************
	 * 
	 * 단일행 조회를 위한 기능정의 => 주문페이지에 보여줘야하는 영역 (order) = 다른 테이블에서 가져와야 하는 부분
	 */

	@RequestMapping(value = "/order/order.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectOrderItem(Model model, HttpSession session,
			@RequestParam(value = "item_no[]", required = false) int[] item_no,
			@RequestParam(value = "opt_no[]", required = false, defaultValue = "1") int[] opt_no,
			@RequestParam(value = "cart_no", required = false) List<Integer> cart_no) {

		/** 세션 정보 빈즈에 저장 */
		Member input_temp = (Member) session.getAttribute("member");

		if (input_temp == null) {
			webHelper.redirect(null, "로그인을 하세요");
		}

		/** 카트로 배열 받아서 옮겨담기 **/
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();

		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> outputlist = new ArrayList<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart>();
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> output = null;

		/** 리스트가 아닌 멤버정보와 포인트 출력하는 객체 영역 */
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart memin = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		memin.setMem_no(input_temp.getMem_no());

		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart memout = null;

		/** 사용가능한 쿠폰만 보여주기 */
		Coupon mycou = new Coupon();
		mycou.setMem_no(input_temp.getMem_no());

		List<Coupon> couList = null;

		try {
			for (int i = 0; i < cart_no.size(); i++) {
				input.setCart_no(cart_no.get(i));
				input.setMem_no(input_temp.getMem_no());

				output = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectOrdersCartList(input);
				outputlist.addAll(output);

			}

			// 드롭다운을 위한 쿠폰 목록 조회
			couList = couponService.getCouponList(mycou);
			// 멤버 정보 조회
			memout = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectOrdermember(input);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		for (OrdersMemberPointsDeliveryCouponImagesItemOptionsCart item : outputlist) {
			String rootDir = webHelper.getUploadPath(item.getOrigin_name());
			item.setOrigin_name(rootDir);
		}

		/** (리스트)스펙 정리해서 하나로 묶고 담기 */
		String speclist = null;

		for (OrdersMemberPointsDeliveryCouponImagesItemOptionsCart listitem : output) {

			speclist = listitem.getItem_cpu() + "/" + listitem.getItem_inch() + "/" + listitem.getItem_ram() + "/"
					+ listitem.getItem_os() + "/" + listitem.getItem_weight() + "/" + listitem.getItem_graphic() + "/"
					+ listitem.getItem_ssd() + "/" + listitem.getItem_hdd();
		}

		int list_total_price = 0;
		int list_dis_price = 0;
		int deli_total = 0;

		for (int i = 0; i < cart_no.size(); i++) {
			list_total_price += outputlist.get(i).getItem_list_paymen() + 2500;
			list_dis_price += outputlist.get(i).getDis_price();
			deli_total += 2500;
		}

		/** 3) view(order(주문페이지)에 전달) 처리 */
		// 배송비
		model.addAttribute("deli_total", deli_total);

		// 스펙
		model.addAttribute("speclist", speclist);

		// 쿠폰
		model.addAttribute("couList", couList);

		// 리스트일때 총금액(옵션/기본할인)
		model.addAttribute("list_total_price", list_total_price);

		// 리스트일째 총 할인금액
		model.addAttribute("list_dis_price", list_dis_price);

		// 데이터
		model.addAttribute("outputlist", outputlist);
		model.addAttribute("memout", memout);

		return new ModelAndView("order/order");
	}

	/*****************************************************************
	 * 
	 * 데이터 저장을 위한 기능 정의 => 주문완료 페이지 = 오더에 저장되는 페이지 orderResult
	 */
	@RequestMapping(value = "/order/orders_ok.do", method = RequestMethod.GET)
	public ModelAndView orderresult(Model model, HttpSession session, HttpServletRequest request,
			@RequestParam(value = "ord_memo", required = false, defaultValue = "부재시 연락바랍니다.") String ord_memo,
			@RequestParam(value = "ord_bank", defaultValue = "0") int ord_bank,
			@RequestParam(value = "ord_payer", required = false) String ord_payer,
			@RequestParam(value = "ord_status", defaultValue = "A") String ord_status,
			@RequestParam(value = "ord_delivery", defaultValue = "2500") int ord_delivery,
			@RequestParam(value = "cart_no", required = false) List<Integer> cart_no) {

		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		/** 1) 오더를 출력해서 내용을 담기 **/
		// orders를 저장하기 위해 출력하기 input
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart selinput = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();

		// output에 출력한 내용 담기
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> outputlist = new ArrayList<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart>();
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> output = null;

		// 배송메모 디코딩하기
		String ordMemo = null;

		// 입금자 디코딩하기
		String ordPayer = null;

		// order로 나온 출력 내용 list로 내보내기
		try {
			for (int i = 0; i < cart_no.size(); i++) {
				selinput.setCart_no(cart_no.get(i));
				selinput.setMem_no(input_temp.getMem_no());

				output = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectOrdersCartList(selinput);
				outputlist.addAll(output);
			}

			ordMemo = URLDecoder.decode(request.getParameter("ord_memo"), "UTF-8");
			ordPayer = URLDecoder.decode(request.getParameter("ord_payer"), "UTF-8");

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 2) select으로 출력한 내용을 insert로 담기 */

		// 출력 객체를 담을 내용
		Orders insinput = new Orders();

		// input에 select로 내보낸 내용 담기
		for (int i = 0; i < cart_no.size(); i++) {
			insinput.setOrd_memo(ordMemo);
			insinput.setOrd_qty(1);
			insinput.setOrd_bank(ord_bank);
			insinput.setOrd_payer(ordPayer);
			insinput.setOrd_status(ord_status);
			insinput.setOrd_delivery(ord_delivery);
			insinput.setItem_brand(outputlist.get(i).getItem_brand());
			insinput.setItem_name(outputlist.get(i).getItem_name());
			insinput.setItem_cpu(outputlist.get(i).getItem_cpu());
			insinput.setItem_inch(outputlist.get(i).getItem_inch());
			insinput.setItem_ram(outputlist.get(i).getItem_ram());
			insinput.setItem_os(outputlist.get(i).getItem_os());
			insinput.setItem_weight(outputlist.get(i).getItem_weight());
			insinput.setItem_graphic(outputlist.get(i).getItem_graphic());
			insinput.setItem_ssd(outputlist.get(i).getItem_ssd());
			insinput.setItem_hdd(outputlist.get(i).getItem_hdd());
			insinput.setItem_price(outputlist.get(i).getItem_price());
			insinput.setItem_discount(outputlist.get(i).getItem_discount());
			insinput.setMem_no(input_temp.getMem_no());
			insinput.setOpt_no(outputlist.get(i).getOpt_no());
			insinput.setMem_postcode(outputlist.get(i).getMem_postcode());
			insinput.setMem_addr1(outputlist.get(i).getMem_addr1());
			insinput.setMem_addr2(outputlist.get(i).getMem_addr2());
			insinput.setMem_receiver(outputlist.get(i).getMem_name());
			insinput.setMem_tel(outputlist.get(i).getMem_tel());
		}

		try {
			// insert 하기
			ordersService.addOrders(insinput);

		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 주문 완료 페이지로 이동 */
		return new ModelAndView("order/orderResult");
	}

	/**
	 * 데이터 갱신을 위한 기능 정의 => 주문 취소할때 (1)
	 */
	@RequestMapping(value = "/myPage/myOrderCancle.do", method = RequestMethod.GET)
	public ModelAndView orderedit(Model model, HttpSession session,
			@RequestParam(value = "ord_no", defaultValue = "0") int ord_no) {

		/** 1) 데이터 조회하기 */
		// 세션 정보 빈즈에 저장
		Member input_temp = (Member) session.getAttribute("member");

		// 데이터 조회에 필요한 조건값을 Beans에 저장하기
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart input = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		input.setOrd_no(ord_no);
		input.setMem_no(input_temp.getMem_no());

		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart output = null;

		try {
			// 오더테이블 기본 정보 조회
			output = ordersMemberPointsDeliveryCouponImagesItemOptionsCartService.getselectAllOne(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 스펙 정리해서 하나로 묶고 담기 */
		String spec = output.getItem_cpu() + "/" + output.getItem_inch() + "/" + output.getItem_ram() + "/"
				+ output.getItem_os() + "/" + output.getItem_weight() + "/" + output.getItem_graphic() + "/"
				+ output.getItem_ssd() + "/" + output.getItem_hdd();

		/** 주문번호 만들기 */
		String now_date = output.getReg_date();

		String date = now_date.replace("-", "");
		date = date.replace(" ", "");
		date = date.replace(":", "");

		String orders_number = date + input_temp.getMem_no();

		/** 2) 데이터 조회하기 */
		// view에 추가
		model.addAttribute("spec", spec);
		model.addAttribute("output", output);
		model.addAttribute("orders_number", orders_number);
		return new ModelAndView("mypage/myOrderCancel");

	}

	/**
	 * 데이터 갱신을 위한 기능 정의 => 주문 취소할때 (2)
	 */

	@RequestMapping(value = "/myPage/myOrderCancle_ok.do", method = RequestMethod.GET)
	public ModelAndView statusf(Model model, @RequestParam(value = "ord_no", defaultValue = "0") int ord_no) {

		/** 1) 데이터 저장하기 */

		// 저장할 값들을 beans에 담는다
		Orders input = new Orders();
		input.setOrd_no(ord_no);

		// 저장된 결과를 조회하기 위한 객체

		try {
			// 데이터 저장
			// -> 데이터 저장에 성공하면 파라미터로 전달하는 input객체에 PK값이 저장된다
			ordersService.editOrders(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		/** 3) 결과를 확인하기위한 json 출력 */
		return new ModelAndView("mypage/myOrderComplete");

	}

}
