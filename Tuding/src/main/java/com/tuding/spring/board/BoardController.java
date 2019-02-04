package com.tuding.spring.board;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

	@Resource(name="boardService")
	private BoardService service;
	
	@RequestMapping("/write")
	public void writeBoard() {
		
	}
	
	@RequestMapping("/detail")
	public void getByNum() {
		
	}
	
	@RequestMapping("/listByWriter")
	public void getByWriter() {
		
	}
	
	@RequestMapping("/listByCategory")
	public void getByCategory() {
		
	}
	
	@RequestMapping("/listAll")
	public void getAll() {
		
	}
	
	@RequestMapping("/edit")
	public void editBoard() {
		
	}
	
	@RequestMapping("/del")
	public void delBoard() {
		
	}
}
