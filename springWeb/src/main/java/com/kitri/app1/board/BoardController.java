package com.kitri.app1.board;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/board")
public class BoardController {
	
	@Resource(name="bodService")
	private Service service;

	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView boardList() {
		
		ArrayList<Article> list = service.GetAll();
		
		ModelAndView mav = new ModelAndView("board/listJson");
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/search", method=RequestMethod.POST)
	public ModelAndView boardTitleSearch(@RequestParam("type")int type,
										 @RequestParam("data")String data) {
		ArrayList<Article> list = null;
		
		if(type == 1) list = service.getTitle(data);
		else list = service.getByWriter(data);
		
		ModelAndView mav = new ModelAndView("board/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String boardWrite(Article a) {
		
		service.addArticle(a);
		
		return "redirect:/board/goMenu";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public ModelAndView boardDetail(@RequestParam("num") int num) {
		
		Article a = service.getByNum(num);
		
		ModelAndView mav = new ModelAndView("board/viewBox");
		
		mav.addObject("board", a);
		
		return mav;
	}
	
	@RequestMapping(value="/viewBox", method=RequestMethod.POST)
	public ModelAndView boardViewBox(@RequestParam("num") int num) {
		
		Article a = service.getByNum(num);
		
		ModelAndView mav = new ModelAndView("board/viewBox");
		
		mav.addObject("board", a);
		
		return mav;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String boardEdit(Article a) {
		
		service.editArticle(a);
		
		return "redirect:/board/goMenu";
	}
	
	@RequestMapping(value="/goMenu", method=RequestMethod.GET)
	public String goMenu() {
		return "member/menu";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String boardDelete(@RequestParam("num") int num) {
		
		System.out.println(num);
		
		service.delArticle(num);
		
		return "redirect:/board/goMenu";
	}
}
