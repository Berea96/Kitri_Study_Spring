package com.tuding.spring.liked;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/liked")
public class LikedController {

	@Resource(name="likedService")
	private LikedService service;
	
	@RequestMapping("/add")
	public void addLiked() {
		
	}
	
	@RequestMapping("/likeBoardNum")
	public void getByBoardNum() {
		
	}
	
	@RequestMapping("/listByMember")
	public void delLiked() {
		
	}
}
