package com.kitri.app1;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	@RequestMapping(value="/test/test2", method=RequestMethod.GET)
	public void test2(Map<String, String> map) {
		map.put("key1",  "val1");
		map.put("key2",  "val2");
		map.put("key3",  "val3");
	}
}
