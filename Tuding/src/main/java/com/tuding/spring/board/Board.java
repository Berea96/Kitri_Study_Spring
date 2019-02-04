package com.tuding.spring.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Board {
	private String writer;
	private int num;
	private String content;
	private Date w_date;
	private String file;
	private MultipartFile mfile;
	private int readcount;
	private int likecount;
	private String category;
	
	public Board() {
	}
	
	public Board(String writer, int num, String content, Date w_date, 
				 String file, int readcount, int likecount,
				 String category) {
		this.writer = writer;
		this.num = num;
		this.content = content;
		this.w_date = w_date;
		this.file = file;
		this.readcount = readcount;
		this.likecount = likecount;
		this.category = category;
	}
	
	public final String getWriter() {
		return writer;
	}
	public final void setWriter(String writer) {
		this.writer = writer;
	}
	
	public final int getNum() {
		return num;
	}
	public final void setNum(int num) {
		this.num = num;
	}
	
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}
	
	public final Date getw_date() {
		return w_date;
	}
	public final void setw_date(Date w_date) {
		this.w_date = w_date;
	}
	
	public final String getFile() {
		return file;
	}
	public final void setFile(String file) {
		this.file = file;
	}
	
	public final MultipartFile getMfile() {
		return mfile;
	}
	public final void setMfile(MultipartFile mfile) {
		this.mfile = mfile;
	}

	public final int getReadcount() {
		return readcount;
	}
	public final void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	public final int getLikecount() {
		return likecount;
	}
	public final void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	
	public final String getCategory() {
		return category;
	}
	public final void setCategory(String category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "Board [writer=" + writer + ", num=" + num + ", content=" + content + ", w_date=" + w_date + ", file=" + file
				+ ", readcount=" + readcount + ", likecount=" + likecount + ", category=" + category + "]";
	}
}	
