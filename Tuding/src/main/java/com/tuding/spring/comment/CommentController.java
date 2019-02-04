package com.tuding.spring.comment;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	@Resource(name="commentService")
	private CommentService service;
	
	@RequestMapping("/write")
	public void writeComment() {
		
	}
	
	@RequestMapping("/listByBoardNum")
	public void getByBoardNum() {
		
	}
	
	@RequestMapping("/listByWriter")
	public void getByWriter() {
		
	}
	
	@RequestMapping("/edit")
	public void editComment() {
		
	}
	
	@RequestMapping("/del")
	public void delCommnet() {
		
	}
}
