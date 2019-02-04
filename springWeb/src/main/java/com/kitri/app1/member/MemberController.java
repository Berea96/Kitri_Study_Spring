package com.kitri.app1.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Resource(name="memService")
	private Service service;

	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView memberList(ModelAndView mav) {
		
		ArrayList<Member> list = service.getAll();
		
		mav.setViewName("member/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public void joinForm() {
		
	}
	
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	public void checkId(@RequestParam("id") String id,
						HttpServletResponse response) {
		
		boolean flag = service.checkId(id);
		
		String str = "{\"result\" : \"" + flag + "\"}";
		
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

//	@RequestMapping(value="/member/join", method=RequestMethod.POST)
//	public ModelAndView checkId(HttpServletRequest request) {
//		String id = request.getParameter("id");
//		ModelAndView mav = new ModelAndView("member/checkId");
//		boolean flag = service.checkId(id);
//		mav.addObject("flag", flag);
//		return mav
//	}
	
	@ResponseBody
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String loginForm(Member m) {
		
		service.join(m);
		
//		return "member/login";
		return "success";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public void loginForm2() {}
	
	@RequestMapping(value="/menu", method=RequestMethod.GET)
	public void menu() {}
	
	@RequestMapping(value="/menu", method=RequestMethod.POST)
	public String login(@RequestParam("id") String id,
						@RequestParam("pwd") String pwd,
						HttpServletRequest request) {
		
		boolean flag = service.login(id, pwd);
		String target = "";
		HttpSession session = request.getSession();
		session.setAttribute("id", id);
		
		if(flag) {
			target = "redirect:menu";
		}
		else {
			target = "redirect:login";
		}
		return target;
	}
	
	@RequestMapping(value="/info", method=RequestMethod.POST)
	public void info(@RequestParam("id") String id,
					 HttpServletRequest request,
					 HttpServletResponse response) {
		
		HttpSession session = request.getSession(false);
		
		Member member = service.getMyInfo((String)session.getAttribute("id"));
//		System.out.println((String)session.getAttribute("id"));
		
		String str = member.toString();
		
		try {
			response.getWriter().write(str);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="/editInfo", method=RequestMethod.POST)
	public String editInfo(Member m) {
		
		service.editMyInfo(m);
		
		return "redirect:menu";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		session.removeAttribute("id");
		session.invalidate();
		
		return "redirect:login";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String delete(@RequestParam("id") String id,
						 HttpServletRequest request) {
		
		HttpSession session = request.getSession(false);
		
		session.removeAttribute("id");
		session.invalidate();
		
		service.delMember(id);
		
		return "redirect:login";
	}
}
