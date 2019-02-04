package com.kitri.test.basket;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.test.product.Product;

@Controller
@RequestMapping("/basket")
public class BasketController {
	
	@Resource(name="basketService")
	private Service service;
	
	@RequestMapping(value = "/starList", method=RequestMethod.GET)
	public String getStarList(@RequestParam("id")String id, Model m) {
		
		Map<String, String> m1 = new HashMap<String, String>();
		Map<String, Integer> m2 = new HashMap<String, Integer>();
		
		m1.put("id", id);
		m2.put("basket_code", 1);
		
		ArrayList<Product> list = service.getByStar(m1, m2);
		
		System.out.println("starList length" + list.size());
		System.out.println("starList num" + list.get(0).getNum());
		System.out.println("starList img1" + list.get(0).getImg1());
		System.out.println("starList title" + list.get(0).getTitle());
		
		m.addAttribute("starList", list);
		
		System.out.println("성공");
		
		return "/basket/starList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/starList", method=RequestMethod.POST)
	public ModelAndView getStarList(@RequestParam("id")String id,
										  ModelAndView mav) {
		
		Map<String, String> m1 = new HashMap<String, String>();
		Map<String, Integer> m2 = new HashMap<String, Integer>();
		
		m1.put("id", id);
		m2.put("basket_code", 1);
		
		ArrayList<Product> list = service.getByStar(m1, m2);
		
		System.out.println("starList length" + list.size());
		
		mav.setViewName("json/starJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping("/basketList")
	public String getBasketList(@RequestParam("id")String id, Model m) {
		
		Map<String, String> m1 = new HashMap<String, String>();
		Map<String, Integer> m2 = new HashMap<String, Integer>();
		
		m1.put("id", id);
		m2.put("basket_code", 0);
		
		ArrayList<Basket> list = service.getByBasket(m1, m2);
		
		for(Basket b : list) {
			b.getId();
		}
		
		m.addAttribute("basketList", list);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("/add")
	public String addBasket(Basket b) {
		
		service.addBasket(b);
		
		return "";
	}
	
	@RequestMapping("/edit")
	public String editBasket(Basket b) {
		
		service.editBasket(b);
		
		return "";
	}
	
	@RequestMapping("/del")
	public String delBasket(Basket b) {
		
		service.delBasket(b);
		
		return "";
	}
}
