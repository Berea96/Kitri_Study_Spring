package com.kitri.app1.upload;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class ReportController {

	private String img_path = "C:\\data\\workspace\\spring\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\img\\";
	
	@RequestMapping(value="/report/submission", method=RequestMethod.GET)
	public String form() {
		return "report/submissionForm";
//		return "report/submissionComplete";
	}
	@ModelAttribute("imgList")
	public String[] getImgeList() {
		File imgDir = new File(img_path);
		return imgDir.list();
	}

	@RequestMapping(value="/report/submitReport1", method=RequestMethod.POST)
	public String submitReport1(@RequestParam("studentNumber") String studentNumber,
								@RequestParam("report") MultipartFile report) {
		String fileName = report.getOriginalFilename();
		String path = img_path + fileName;
		File f = new File(path);
		
		try {
			report.transferTo(f);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "report/submissionComplete";
	}
	
	@RequestMapping(value="/report/submitReport2", method=RequestMethod.POST)
	public String submitReport2(MultipartHttpServletRequest request) {
		
		String studentNumber = request.getParameter("studentNumber");
		MultipartFile report = request.getFile("report");
		
		String fileName = report.getOriginalFilename();
		String path = img_path + fileName;
		File f = new File(path);
		
		try {
			report.transferTo(f);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "report/submissionComplete";
	}
	
	@RequestMapping(value="/report/submitReport3", method=RequestMethod.POST)
	public String submitReport3(ReportCommand reportCommand) {
		
		String fileName = reportCommand.getReport().getOriginalFilename();
		String path = img_path + fileName;
		File f = new File(path);
		
		try {
			reportCommand.getReport().transferTo(f);
		} catch(IllegalStateException e) {
			e.printStackTrace();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return "report/submissionComplete";
	}
}
