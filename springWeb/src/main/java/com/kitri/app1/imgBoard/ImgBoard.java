package com.kitri.app1.imgBoard;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ImgBoard {
	private int num;
	private String writer;
	private String title;
	private Date w_date;
	private String content;
	private String img_path;
	private MultipartFile file;
	
	public ImgBoard() {
	}

	public ImgBoard(int num, String writer, String title, Date w_date, String content, String img_path) {
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.w_date = w_date;
		this.content = content;
		this.img_path = img_path;
	}
	
	public final int getNum() {
		return num;
	}
	public final void setNum(int num) {
		this.num = num;
	}
	
	public final String getWriter() {
		return writer;
	}
	public final void setWriter(String writer) {
		this.writer = writer;
	}
	
	public final String getTitle() {
		return title;
	}
	public final void setTitle(String title) {
		this.title = title;
	}
	
	public final Date getW_date() {
		return w_date;
	}
	public final void setW_date(Date w_date) {
		this.w_date = w_date;
	}
	
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}
	
	public final String getImg_path() {
		return img_path;
	}
	public final void setImg_path(String img_path) {
		this.img_path = img_path;
	}
	
	public final MultipartFile getFile() {
		return file;
	}
	public final void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "ImgBoard [num=" + num + ", writer=" + writer + ", title=" + title + ", w_date=" + w_date + ", content="
				+ content + ", img_path=" + img_path + "]";
	}
}
