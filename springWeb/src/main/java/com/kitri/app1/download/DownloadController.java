package com.kitri.app1.download;

import java.io.File;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/download")
public class DownloadController {
	
	private String base_path="C:\\data\\workspace\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img";
	
	@RequestMapping("/list")
	public ModelAndView fileList() {
		
		File dir = new File(base_path);
		String[] list = dir.list();
		
		return new ModelAndView("download/list", "list", list);
	}
	
	@RequestMapping("/down")
	public ModelAndView download(@RequestParam(value="name")String name) throws Exception {
		File downloadFile = new File(base_path+ "\\" +name);
		
		System.out.println("왔다");
		
		return new ModelAndView("download", "downloadFile", downloadFile);
	}
}
