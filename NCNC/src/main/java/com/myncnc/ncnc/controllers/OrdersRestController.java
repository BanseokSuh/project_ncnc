package com.myncnc.ncnc.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.RegexHelper;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.Coupon;
import com.myncnc.ncnc.model.Member;
import com.myncnc.ncnc.model.OrdersMemberPointsDeliveryCouponImagesItemOptionsCart;
import com.myncnc.ncnc.service.CouponService;
import com.myncnc.ncnc.service.DeliveryMemberService;
import com.myncnc.ncnc.service.OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService;
import com.myncnc.ncnc.service.OrdersService;

@RestController
public class OrdersRestController {

	//webhelper 주입
		@Autowired WebHelper webHelper;
		
		//regexhelper 주입
		@Autowired RegexHelper regexHelper;
		
		//service 패턴 구현체 주입
		@Autowired OrdersService ordersService;
		
		//service 패턴 구현체 주입
		@Autowired CouponService couponService;
		
		//service 패턴 구현체 주입
		@Autowired DeliveryMemberService deliveryMemberService;
		
		@Autowired OrdersMemberPointsDeliveryCouponImagesItemOptionsCartService ordersMemberPointsDeliveryCouponImagesItemOptionsService;
		
		//프로젝트 이름에 해당하는 contextpath 변수 주입
		@Value("#{servletContext.contextPath}")
		String contextPath;
		
	/*****************************************************************
	 * 
	 * 단일행 조회를 위한 기능정의
		=> 주문페이지에 보여줘야하는 영역 (order)
		= 다른 테이블에서 가져와야 하는 부분
	 * */
	
	@RequestMapping(value = "/order/orderjson", method = RequestMethod.GET)
	public Map<String, Object> jsonorder( HttpSession session,
			@RequestParam(value = "item_no[]", required=false )int[] item_no,
			@RequestParam(value = "opt_no[]", required=false, defaultValue="1" )int[] opt_no,
			@RequestParam(value ="cart_no[]", required=false )int[] cart_no){
		
		
		/** 세션 정보 빈즈에 저장 */
		Member input_temp = (Member) session.getAttribute("member");
		
		
		
		
		//바로구매 -> 아이템 input
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart iinput = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		//장바구니 -> 카트 input
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart cinput= new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();
		
		
		/** 바로구매하기 iinput*/
	
			iinput.setItemlist(item_no);
			iinput.setOptlist(opt_no);
			iinput.setMem_no(input_temp.getMem_no());
		
		
		
		//배열 초기화
		//List<OrdersMemberPointsDeliveryCouponImagesItemOptions> output = null;
		
		//for(int i = 0; i < item_no.size(); i++ ) {
		//	input.setItem_no(item_no.get(i));
		//	input.setMem_no(input_temp.getMem_no());
	
		//	input = ordersMemberPointsDeliveryCouponImagesItemOptionsService.getselectOrdersItem(input);
		//	output.add(input);
		//}
		
		//인풋을 아이템으로 셀렉해서 
		//인풋으로 담고(메퍼를 사용해서)
		//다시 아웃풋으로 add해서 
		//내보낸다
		
	
		/** 은행이름 숫자 -> 문자 */
		String[] bank_num = {"1","2","3","4","5"};
		String[] back_no_name = {"은행선택","우리은행","신한은행","카카오","기업은행"};
		
		/** 사용가능한 쿠폰만 보여주기 */
		Coupon mycou = new Coupon();
		mycou.setMem_no(input_temp.getMem_no());
		
		List<Coupon> couList = null;
		 
		
		//output 선언
		List<OrdersMemberPointsDeliveryCouponImagesItemOptionsCart> output = null;
		OrdersMemberPointsDeliveryCouponImagesItemOptionsCart outputmem = new OrdersMemberPointsDeliveryCouponImagesItemOptionsCart();		
		
		try {
			if(item_no.length == 1) {
			//바로구매 
			output = ordersMemberPointsDeliveryCouponImagesItemOptionsService.getselectOrdersItem(iinput);
			outputmem = ordersMemberPointsDeliveryCouponImagesItemOptionsService.getselectOrdermember(iinput);
			}else if(cart_no.length > 1){
			//장바구니 구매
			output = ordersMemberPointsDeliveryCouponImagesItemOptionsService.getselectOrdersCartList(cinput);
			//log.debug(output);
			
			}
			//드롭다운을 위한 쿠폰 목록 조회
			couList = couponService.getCouponList(mycou);
			
		} catch (Exception e) {
			return webHelper.getJsonError(e.getLocalizedMessage());
		}
		
		
		
		/** (리스트)스펙 정리해서 하나로 묶고 담기 */
		String speclist = null;
		
		for(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart listitem : output) {
		
		speclist = listitem.getItem_cpu() + "/" + listitem.getItem_inch() + "/" + listitem.getItem_ram() + "/" + listitem.getItem_os() + "/" + 
				listitem.getItem_weight() + "/" + listitem.getItem_graphic() + "/" + listitem.getItem_ssd() + "/" + listitem.getItem_hdd();
		}
		
		int list_total_price = 0;
		int list_dis_price = 0;
		
		for(OrdersMemberPointsDeliveryCouponImagesItemOptionsCart totallist : output) {
			list_total_price += totallist.getItem_list_paymen() + 2500;
			list_dis_price += totallist.getDis_price();
			
		}
		
		
		
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("bank_num", bank_num);
        data.put("back_no_name", back_no_name);
        data.put("speclist", speclist);
        data.put("couList", couList);
        data.put("list_total_price", list_total_price);
        data.put("list_dis_price", list_dis_price);
        data.put("output", output);
        data.put("outputmem", outputmem);
        return webHelper.getJsonData(data);
		
	}
		
			
	
	
	
}
