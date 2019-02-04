package com.kitri.app1.imgBoard;

import java.util.ArrayList;

public interface Service {
	int getNum();
	void addImg(ImgBoard ib);
	ArrayList<ImgBoard> getAll();
	ArrayList<ImgBoard> getByWriter(String writer);
	ImgBoard getByNum(int num);
	void editImgBoard(ImgBoard ib); //title, content, w_date
	void delImgBoard(int num);
}
