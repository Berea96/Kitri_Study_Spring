package com.kitri.app1.imgBoard;

import java.util.ArrayList;

public interface Dao {
	int getNum();
	void insert(ImgBoard ib);
	ArrayList<ImgBoard> selectAll();
	ArrayList<ImgBoard> selectByWriter(String writer);
	ImgBoard selectByNum(int num);
	void update(ImgBoard ib); //title, content, w_date
	void delete(int num);
}
