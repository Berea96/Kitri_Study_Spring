package com.kitri.app1;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value="/test/test1", method=RequestMethod.GET)
	public String test1() {
		
		return "test1";
	}
	
	@RequestMapping(value="/test/test1", method=RequestMethod.POST)
	public String test1_post(Test t) {
		
		System.out.println(t);
		
		return "result";
	}
}
