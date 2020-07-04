package com.myncnc.ncnc.controllers;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.myncnc.ncnc.helper.MailHelper;
import com.myncnc.ncnc.helper.WebHelper;
import com.myncnc.ncnc.model.Coupon;
import com.myncnc.ncnc.model.Member;
import com.myncnc.ncnc.model.Points;
import com.myncnc.ncnc.service.CouponService;
import com.myncnc.ncnc.service.MemberService;
import com.myncnc.ncnc.service.PointsService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	@Autowired
	WebHelper webHelper;

	@Autowired
	MailHelper mailHelper;

	@Autowired
	MemberService memberService;

	@Autowired
	CouponService couponService;
	
	@Autowired
	PointsService pointsService;

	// ????????????
	@Value("#{servletContext.contextPath}")
	String contextPath;

	// 로그인 페이지
	@RequestMapping(value = "/login/login.do", method = RequestMethod.GET)
	public ModelAndView login(Model model) {

		return new ModelAndView("login/login");
	}

	// 로그인 ok 페이지
	@RequestMapping(value = "/login/login_ok.do", method = RequestMethod.POST)
	public ModelAndView login_ok(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value = "mem_id", defaultValue = "") String mem_id,
			@RequestParam(value = "mem_pw", defaultValue = "") String mem_pw,
			@RequestParam(value = "remember_user_info", defaultValue = "") String remCheck) {

		// 유효성 검사
		if (mem_id.equals("")) {
			return webHelper.redirect(null, "Enter your id");
		}

		if (mem_pw.equals("")) {
			return webHelper.redirect(null, "Enter your password");
		}

		// 데이터 조회하기
		Member input = new Member();
		input.setMem_id(mem_id);
		input.setMem_pw(mem_pw);

		// 조회 결과를 저장할 객체
		Member pw = null;
		Member output = null;
		String faillogin = contextPath + "/login/login.do";
		
		try {
			// 비밀번호 가져오기
			pw = memberService.checkPw(input);
			if (pw.getMem_pw().equals(mem_pw)) {
				output = memberService.getMemberItem(input);
			} else {
				return webHelper.redirect(faillogin, "Wrong password");
			}
		} catch (Exception e) {
			return webHelper.redirect(null, "Check id or password");
		}
		
		// 세션에 저장
		HttpSession session = request.getSession();
		session.setAttribute("member", output);
		session.setMaxInactiveInterval(18000);

		// 아이디 저장 부분 처리
		if (remCheck.equals("Y")) {

			try {
				mem_id = URLEncoder.encode(mem_id, "utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			Cookie cookie = new Cookie("remember", mem_id);
			cookie.setPath("/");
			cookie.setDomain("itproject.ezenac.co.kr");

			if (mem_id.equals("")) {
				cookie.setMaxAge(0);
			} else {
				cookie.setMaxAge(60);
			}
			response.addCookie(cookie);
		}

		String redirectUrl = contextPath;
		return webHelper.redirect(redirectUrl, "Login");
	}

	// 로그아웃
	@RequestMapping(value = "/login/logout.do", method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		String redirectUrl = contextPath;
		return webHelper.redirect(redirectUrl, "Logout");
	}

	// 회원가입 페이지
	@RequestMapping(value = "/login/joinStep1.do", method = RequestMethod.GET)
	public ModelAndView joinStep1() {
		return new ModelAndView("login/joinStep1");
	}

	// 14세 이상 회원가입
	@RequestMapping(value = "/login/joinStep2_adult.do", method = RequestMethod.GET)
	public ModelAndView joinStep2_adult() {
		return new ModelAndView("login/joinStep2_adult");
	}

	// 14세 이상 회원가입 폼
	@RequestMapping(value = "/login/joinStep3_form_a.do", method = RequestMethod.GET)
	public ModelAndView joinStep3_form_a() {
		return new ModelAndView("login/joinStep3_form_a");
	}

	// 14세 이상 회원가입 폼_ok
	@RequestMapping(value = "/login/joinStep3_form_a_ok.do", method = RequestMethod.POST)
	public ModelAndView joinStep3_form_a_ok(HttpServletRequest request, Model model,
			@RequestParam(value = "mem_id", required = false) String mem_id,
			@RequestParam(value = "mem_pw", required = false) String mem_pw,
			@RequestParam(value = "mem_name", required = false) String mem_name,
			@RequestParam(value = "mem_email", required = false) String mem_email,
			@RequestParam(value = "mem_tel", required = false) String mem_tel,
			@RequestParam(value = "mem_birth", required = false) String mem_birth,
			@RequestParam(value = "mem_gender", required = false) String mem_gender,
			@RequestParam(value = "mem_addr1", required = false) String mem_addr1,
			@RequestParam(value = "mem_addr2", required = false) String mem_addr2,
			@RequestParam(value = "mem_postcode", required = false) String mem_postcode,
			@RequestParam(value = "mem_reply", defaultValue = "1") boolean mem_reply) {

		// 가입하기 ( 멤버 테이블에 데이터 저장 )
		Member input = new Member();
		input.setMem_id(mem_id);
		input.setMem_pw(mem_pw);
		input.setMem_name(mem_name);
		input.setMem_email(mem_email);
		input.setMem_tel(mem_tel);
		input.setMem_birth(mem_birth);
		input.setMem_gender(mem_gender);
		input.setMem_addr1(mem_addr1);
		input.setMem_addr2(mem_addr2);
		input.setMem_postcode(mem_postcode);
		input.setMem_reply(mem_reply);

		Member output = null;
		Coupon coupon = new Coupon();
		Points point = new Points();
		
		try {
			memberService.addMember(input);
			output = memberService.getMemberItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		HttpSession session = request.getSession();
		session.setAttribute("member", output);

		Member input_temp = (Member) session.getAttribute("member");

		coupon.setMem_no(input_temp.getMem_no());
		point.setMem_no(input_temp.getMem_no());
		try {
			couponService.addCoupon(coupon);
			pointsService.insertPoints(point);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		
		return new ModelAndView("login/welcome");
	}

	// 14세 미만 회원가입
	@RequestMapping(value = "/login/joinStep2_child.do", method = RequestMethod.GET)
	public ModelAndView joinStep2_child() {
		return new ModelAndView("login/joinStep2_child");
	}

	// 14세 미만 회원가입 폼
	@RequestMapping(value = "/login/joinStep3_form_c.do", method = RequestMethod.GET)
	public ModelAndView joinStep3_form_c() {
		return new ModelAndView("login/joinStep3_form_c");
	}

	// 14세 미만 회원가입 폼
	@RequestMapping(value = "/login/joinStep3_form_c_ok.do", method = RequestMethod.POST)
	public ModelAndView joinStep3_form_c(HttpServletRequest request, Model model,
			@RequestParam(value = "mem_id", defaultValue = "") String mem_id,
			@RequestParam(value = "mem_pw", defaultValue = "") String mem_pw,
			@RequestParam(value = "mem_name", defaultValue = "") String mem_name,
			@RequestParam(value = "mem_email", defaultValue = "") String mem_email,
			@RequestParam(value = "mem_tel", defaultValue = "") String mem_tel,
			@RequestParam(value = "mem_birth", defaultValue = "") String mem_birth,
			@RequestParam(value = "mem_gender", defaultValue = "") String mem_gender,
			@RequestParam(value = "mem_addr1", defaultValue = "") String mem_addr1,
			@RequestParam(value = "mem_addr2", defaultValue = "") String mem_addr2,
			@RequestParam(value = "mem_postcode", defaultValue = "") String mem_postcode,
			@RequestParam(value = "mem_reply", defaultValue = "1") boolean mem_reply) {

		// 가입하기 ( 멤버 테이블에 데이터 저장 )
		Member input = new Member();
		input.setMem_id(mem_id);
		input.setMem_pw(mem_pw);
		input.setMem_name(mem_name);
		input.setMem_email(mem_email);
		input.setMem_tel(mem_tel);
		input.setMem_birth(mem_birth);
		input.setMem_gender(mem_gender);
		input.setMem_addr1(mem_addr1);
		input.setMem_addr2(mem_addr2);
		input.setMem_postcode(mem_postcode);
		input.setMem_reply(mem_reply);

		Member output = null;
		Coupon coupon = new Coupon();
		Points point = new Points();
		
		try {
			memberService.addMember(input);
			output = memberService.getMemberItem(input);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		HttpSession session = request.getSession();
		session.setAttribute("member", output);
		Member input_temp = (Member) session.getAttribute("member");

		coupon.setMem_no(input_temp.getMem_no());
		point.setMem_no(input_temp.getMem_no());
		try {
			couponService.addCoupon(coupon);
			pointsService.insertPoints(point);
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}
		return new ModelAndView("login/welcome");
	}

	// 아이디 중복확인
	@ResponseBody
	@RequestMapping(value = "/login/idCheck.do", method = RequestMethod.GET)
	public int check_id(@RequestParam(value = "mem_id", defaultValue = "") String mem_id) {

		// 조회 결과
		Member input = new Member();
		input.setMem_id(mem_id);

		int result = 0;

		try {
			result = memberService.checkIdMember(input);
		} catch (Exception e) {
			return -1;
		}

		return result;
	}

	// 아이디 찾기
	@RequestMapping(value = "/login/searchId.do", method = RequestMethod.GET)
	public ModelAndView searchId() {
		return new ModelAndView("login/searchId");
	}

	// 아이디 찾기 폼
	@RequestMapping(value = "/login/searchId_ok.do", method = RequestMethod.POST)
	public ModelAndView searchId_ok(
			@RequestParam(value = "mem_name", defaultValue = "") String mem_name,
			@RequestParam(value = "mem_email", defaultValue = "") String mem_email) {

		Member input = new Member();
		input.setMem_name(mem_name);
		input.setMem_email(mem_email);

		Member output = new Member();

		try {
			output = memberService.searchId(input);

			mailHelper.sendMail(output.getMem_email(), "NCNC 가입 아이디 입니다.", "아이디는 " + output.getMem_id() + " 입니다.");
		} catch (Exception e) {
			return webHelper.redirect(null, "Check ID or name");
		}
		String redirectUrl = contextPath + "/login/login.do";
		return webHelper.redirect(redirectUrl, "Check your mail");
	}

	// 비밀번호 찾기
	@RequestMapping(value = "/login/searchPw.do", method = RequestMethod.GET)
	public ModelAndView searchPw() {
		return new ModelAndView("login/searchPw");

	}

	@RequestMapping(value = "/login/searchPw_ok.do", method = RequestMethod.POST)
	public ModelAndView searchPw_ok(@RequestParam(value = "mem_id", defaultValue = "null") String mem_id,
			@RequestParam(value = "mem_name", defaultValue = "") String mem_name,
			@RequestParam(value = "mem_email", defaultValue = "") String mem_email) {

		Member input = new Member();
		input.setMem_id(mem_id);
		input.setMem_name(mem_name);
		input.setMem_email(mem_email);

		Member output = new Member();

		try {
			output = memberService.searchPw(input);

			mailHelper.sendMail(output.getMem_email(), "NCNC 가입 비밀번호 입니다.", "비밀번호는 " + output.getMem_pw() + " 입니다.");
		} catch (Exception e) {
			return webHelper.redirect(null, e.getLocalizedMessage());
		}

		return new ModelAndView("login/login");
	}

	// 회원가입 완료 페이지
	@RequestMapping(value = "/login/welcome.do", method = RequestMethod.GET)
	public ModelAndView welcome() {
		return new ModelAndView("login/welcome");
	}
}
