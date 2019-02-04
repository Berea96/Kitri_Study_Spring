package com.kitri.app1.imgBoardRep;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/imgRep")
public class ImgBoardRepController {

	@Resource(name="imgBoardRepService")
	private Service service;
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView getAll(@RequestParam("img_num")int img_num,
							   ModelAndView mav) {
		
		System.out.println("도착");
		
		ArrayList<ImgBoardRep> list = service.getAll(img_num);
		
		mav.setViewName("imgRep/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView writeImgRep(ImgBoardRep ibr, ModelAndView mav) {
		
		service.addImgRep(ibr);
		
		mav.setViewName("result");
		
		return mav;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public ModelAndView editImgRep(ImgBoardRep ibr, ModelAndView mav) {
		
		service.editImgBoard(ibr);
		mav.setViewName("result");
		
		return mav;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView delImgRep(@RequestParam("num")int num,
								  ModelAndView mav) {
		service.delImgBoard(num);
		
		mav.setViewName("result");
		
		return mav;
	}
}
