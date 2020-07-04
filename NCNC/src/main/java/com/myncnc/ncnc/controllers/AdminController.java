package com.myncnc.ncnc.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myncnc.ncnc.helper.WebHelper;

@Controller
public class AdminController {

	@Autowired
	WebHelper webHelper;

	@Value("#{servletContext.contextPath}")
	String contextPath;

	@RequestMapping(value = "/admin/login_ok", method = RequestMethod.POST)
	public ModelAndView admin_login(HttpServletRequest request, HttpServletResponse response, Model model,
			@RequestParam(value = "mem_id", defaultValue = "") String mem_id,
			@RequestParam(value = "mem_pw", defaultValue = "") String mem_pw,
			@RequestParam(value = "remember_user_info", defaultValue = "") String remCheck) {

		return new ModelAndView("admin/admin");
	}
}
