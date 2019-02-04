package com.kitri.app1.imgBoardLike;

public class ImgBoardLike {
	private int img_num;
	private int img_like;
	
	public ImgBoardLike() {
	}

	public ImgBoardLike(int img_num, int img_like) {
		this.img_num = img_num;
		this.img_like = img_like;
	}

	public final int getImg_num() {
		return img_num;
	}
	public final void setImg_num(int img_num) {
		this.img_num = img_num;
	}

	public final int getImg_like() {
		return img_like;
	}
	public final void setImg_like(int img_like) {
		this.img_like = img_like;
	}

	@Override
	public String toString() {
		return "ImgBoardLike [img_num=" + img_num + ", img_like=" + img_like + "]";
	}
}
