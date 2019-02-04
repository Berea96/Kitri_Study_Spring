package com.kitri.app1.imgBoardRep;

public class ImgBoardRep {
	private int num;
	private int img_num;
	private String writer;
	private String content;
	
	public ImgBoardRep() {
	}
	
	public ImgBoardRep(int num, int img_num, String writer, String content) {
		this.num = num;
		this.img_num = img_num;
		this.writer = writer;
		this.content = content;
	}
	
	public final int getNum() {
		return num;
	}
	public final void setNum(int num) {
		this.num = num;
	}
	
	public final int getImg_num() {
		return img_num;
	}
	public final void setImg_num(int img_num) {
		this.img_num = img_num;
	}
	
	public final String getWriter() {
		return writer;
	}
	public final void setWriter(String writer) {
		this.writer = writer;
	}
	
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}
}
