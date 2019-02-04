package com.kitri.test.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kitri.test.prodMem.ProdMem;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Resource(name="prodService")
	private Service service;
	
	private String path = "C:\\data\\workspace\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\prod_img\\";
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addProd(Model m) {
		
		return "/product/addProdForm";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addProd(Product p) {
		
		int num = service.makeNum();
		
		MultipartFile[] files = p.getFile();
		System.out.println("file" + p.getFile1());
		System.out.println(files[1].getOriginalFilename());
		String[] fileName = new String[files.length];
		File[] f = new File[files.length];
		
		for(int i = 0; i < files.length; i++) {
			fileName[i] =  num + "_" + (i + 1) + files[i].getOriginalFilename();
			f[i] = new File(path + fileName[i]);
			try {
				files[i].transferTo(f[i]);
				if(i == 0) p.setImg1(fileName[i]);
				else if(i == 1) p.setImg2(fileName[i]);
				else if(i == 2) p.setImg3(fileName[i]);
				else if(i == 3) p.setImg4(fileName[i]);
			} catch(IllegalStateException e) {
				e.printStackTrace();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		p.setNum(num);
		service.addProduct(p);
		
		return "redirect:/product/allList";
	}
	
	@RequestMapping(value="/allList", method=RequestMethod.GET)
	public String getAllList(Model m) {
		
		ArrayList<Product> list = service.getAll();
		
		System.out.println(list.size());
		
		m.addAttribute("allList", list);
		
		return "/product/allList";
	}
	
	@RequestMapping(value="/allList", method=RequestMethod.POST)
	public ModelAndView getAllList(ModelAndView mav) {
		
		ArrayList<Product> list = service.getAll();
		
		System.out.println(list.size());
		
		mav.setViewName("json/prodJson");
		mav.addObject("list", list);
		
		return mav;
	}
	
	@RequestMapping(value="/myList", method=RequestMethod.GET)
	public String getMyList(Model m, HttpServletRequest req) {
		
		HttpSession session = req.getSession(false);
		
		String id = ((ProdMem)session.getAttribute("info")).getId();
		
		ArrayList<Product> list = service.getByWriter(id);
		
		m.addAttribute("myList", list);
		
		return "/product/myList";
	}
	
	@RequestMapping(value="/cateList", method=RequestMethod.GET)
	public String getCateList(@RequestParam("cate")int cate, Model m) {
		
		ArrayList<Product> list = service.getByCate(cate);
		
		m.addAttribute("allList", list);
		
		return "/product/allList";
	}
	
	@RequestMapping(value="/detail", method=RequestMethod.GET)
	public String getMyList(@RequestParam("num")int num, Model m) {
		
		Product p = service.getByNum(num);
		
		m.addAttribute("product", p);
		
		return "/product/detail";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String editProduct(Product p) {
		
		service.editProduct(p);
		
		return "redirect:/product/allList";
	}
	
	@RequestMapping(value="/del", method=RequestMethod.POST)
	public String delProduct(@RequestParam("num")int num) {
		
		service.delProduct(num);
		
		return "redirect:/product/allList";
	}
}
