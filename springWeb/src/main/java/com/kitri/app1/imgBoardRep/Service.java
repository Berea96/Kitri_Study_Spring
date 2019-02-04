package com.kitri.app1.imgBoardRep;

import java.util.ArrayList;

public interface Service {
	void addImgRep(ImgBoardRep ibr);
	ArrayList<ImgBoardRep> getAll(int img_num);
	void editImgBoard(ImgBoardRep ibr); //title, content, w_date
	void delImgBoard(int num);
}
