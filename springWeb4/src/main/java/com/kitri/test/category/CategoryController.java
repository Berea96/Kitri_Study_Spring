package com.kitri.test.category;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/category")
public class CategoryController {
	
	@Resource(name="categoryService")
	private Service service;

	@ModelAttribute("categoryList")
	public ArrayList<Category> getList() {
		
		ArrayList<Category> list = service.getAll(0);
		
		System.out.println(list.get(0).getText());
		System.out.println("성공");
		
		return list;
	}
	
	@RequestMapping(value="/sendList", method=RequestMethod.GET)
	public String sendList(Model m) {
		
		ArrayList<Category> list = service.getAll(0);
		
		m.addAttribute("categoryList", list);
		
		return "redirect:/product/add";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public ModelAndView getChildList(ModelAndView mav) {
//		System.out.println("도착했수다");
		
		ArrayList<Category> list = service.getAll(0);
		
		mav.setViewName("category/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/list2", method=RequestMethod.GET)
	public ModelAndView getChildList(@RequestParam("parent_code")int parent_code,
									 ModelAndView mav) {
//		System.out.println("도착했수다");
		
		ArrayList<Category> list = service.getAll(parent_code);
		
		mav.setViewName("category/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/main")
	public void mainCategory() {}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public ModelAndView createCategory(Category c, ModelAndView mav) {
		
		service.createCategory(c);
		
		mav.setViewName("result");
		
		return mav;
	}
}
