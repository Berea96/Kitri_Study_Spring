package com.kitri.app1.comment;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/comment")
public class CommentController {
	
	@Resource(name="comService")
	private Service service;

	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView getAll(@RequestParam("num")int article_num) {
		
		ArrayList<Comment> list = service.getAll(article_num);
		
		ModelAndView mav = new ModelAndView("comment/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
//	@ResponseBody
//	@RequestMapping(value="/list", method=RequestMethod.POST)
//	public ArrayList<Comment> getAll(@RequestParam("num")int article_num) {
//		
//		ArrayList<Comment> list = service.getAll(article_num);
//		
////		ModelAndView mav = new ModelAndView("comment/listJson");
////		mav.addObject("list", list);
//		
//		return list;
//	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public ModelAndView writeComment(Comment c, ModelAndView mav) {
		
//		System.out.println("comment write station");
//		System.out.println(c.getArticle_num());
//		System.out.println(c.getComment_num());
//		System.out.println(c.getWriter());
//		System.out.println(c.getContent());
		
		c.setW_date(null);
		
		service.writeComment(c);
		
		mav.setViewName("/result");
		
		return mav;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public ModelAndView editComment(Comment c,  ModelAndView mav) {
		
		service.editComment(c);
		
//		System.out.println("comment edit station");
		
		mav.setViewName("/result");
		
		return mav;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public ModelAndView delComment(@RequestParam("comment_num")int comment_num,
			 			  		   ModelAndView mav) {
		
		service.delComment(comment_num);
		
		mav.setViewName("/result");
		
		return mav;
	}
}
