package com.kitri.app1.fileBoard;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class FileBoard {
	private int num;
	private String writer;
	private String title;
	private Date w_date;
	private String content;
	private String file_path;
	private MultipartFile file;
	
	public FileBoard() {
	}

	public FileBoard(int num, String writer, String title, Date w_date, String content, String file_path) {
		this.num = num;
		this.writer = writer;
		this.title = title;
		this.w_date = w_date;
		this.content = content;
		this.file_path = file_path;
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

	public final String getFile_path() {
		return file_path;
	}
	public final void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public final MultipartFile getFile() {
		return file;
	}
	public final void setFile(MultipartFile file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "FileBoard [num=" + num + ", writer=" + writer + ", title=" + title + ", w_date=" + w_date + ", content="
				+ content + ", file_path=" + file_path + "]";
	}
}
