package com.kitri.app1.imgBoard;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.app1.board.Article;

@Controller
@RequestMapping(value="/imgBoard")
public class ImgBoardController {
	
	@Resource(name="imgBoardService")
	private Service service;
	
	private String img_path = "C:\\data\\workspace\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
	
	@RequestMapping(value="/home")
	public void goHome() {}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public ModelAndView imgBoardList(ModelAndView mav) {
		ArrayList<ImgBoard> list = service.getAll();
		
		File imgDir = new File(img_path);
		String[] img = imgDir.list();
		
		mav.setViewName("/imgBoard/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/writerList", method=RequestMethod.POST)
	public ModelAndView imgBoardListByWriter(@RequestParam("writer")String writer,
											 ModelAndView mav) {
		
		ArrayList<ImgBoard> list = service.getByWriter(writer);
		
		mav.setViewName("/imgBoard/listJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/write", method=RequestMethod.POST)
	public String imgBoardWrite(ImgBoard ib) {
		
		int num = service.getNum();
		
		String fileName = num + ib.getFile().getOriginalFilename();
		String path = img_path + fileName;
		File f = new File(path);
		
		ib.setNum(num);
		ib.setImg_path(fileName);
		ib.setW_date(null);
		System.out.println(ib);
		
		try {
			service.addImg(ib);
			ib.getFile().transferTo(f);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/imgBoard/goMenu";
	}
	
	@RequestMapping(value="/viewBox", method=RequestMethod.POST)
	public ModelAndView boardViewBox(@RequestParam("num") int num) {
		
		ImgBoard ib = service.getByNum(num);
		
		ModelAndView mav = new ModelAndView("imgBoard/viewBox");
		
		mav.addObject("imgBoard", ib);
		
		return mav;
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.POST)
	public ModelAndView imgBoardDetail(@RequestParam("num")int num,
									   ModelAndView mav) {
		ImgBoard ib = service.getByNum(num);
		
		mav.setViewName("imgBoard/viewBox");
		mav.addObject("imgBoard", ib);
		
		return mav;
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String imgBoardEdit(ImgBoard ib) {
		service.editImgBoard(ib);
		return "redirect:/imgBoard/goMenu";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)
	public String imgBoardDelete(@RequestParam("num")int num) {
		service.delImgBoard(num);
		return "redirect:/imgBoard/goMenu";
	}
	
	@RequestMapping(value="/goMenu", method=RequestMethod.GET)
	public String goMenu() {
		return "member/menu";
	}
}
