package com.kitri.test.prodMem;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/prodMem")
public class ProdMemController {
	
	@Resource(name="prodMemService")
	private Service service;

	@RequestMapping(value="/home")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String joinForm() {
		
		return "/prodMem/joinForm";
	}
	
	@RequestMapping(value="/checkId", method=RequestMethod.POST)
	public ModelAndView checkId(@RequestParam("id")String id, 
								ModelAndView mav) {
		
		System.out.println("도착");
		
		ProdMem member = service.getMember(id);
		
		boolean result = false;
		
		if(member != null) 
			result = true;
		
		mav.setViewName("prodMem/checkId");
		mav.addObject("result", result);
		
		return mav;
	}
	
	@RequestMapping(value="/join", method=RequestMethod.POST)
	public String join(ProdMem pm) {
		
		service.join(pm);
		
		return "/prodMem/joinSuccess";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam("id")String id, 
						HttpServletRequest req)	{
		
		ProdMem member = service.getMember(id);
		HttpSession session = req.getSession();
		
		System.out.println("넘어옴");
		
		if(member != null) {
			session.setAttribute("info", member);
			System.out.println(session.getAttribute("info"));
		}
		return "home";
	}
	
	@RequestMapping(value="/info", method=RequestMethod.GET)
	public String info(@RequestParam("id")String id, Model m) {
		
		ProdMem member = service.getMember(id);
		
		m.addAttribute("member", member);
		
		return "/prodMem/info";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String login(HttpServletRequest req) {
		
		HttpSession session = req.getSession(false);
		
		session.removeAttribute("info");
		session.invalidate();
		
		return "home";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String edit(ProdMem pm, Model m) {
		
		service.editMember(pm);
		
		return "home";
	}
	
	@RequestMapping(value="/del", method=RequestMethod.POST)
	public String del(@RequestParam("id") String id,
					  HttpServletRequest req) {
		
		service.delMember(id);
		
		HttpSession session = req.getSession(false);
		
		session.removeAttribute("info");
		session.invalidate();
		
		return "home";
	}
}
