package com.kitri.app1.imgBoardRep;

import java.util.ArrayList;

public interface Dao {
	int getNum();
	void insert(ImgBoardRep ibr);
	ArrayList<ImgBoardRep> selectAll(int img_num);
	void update(ImgBoardRep ibr);
	void delete(int num);
}
