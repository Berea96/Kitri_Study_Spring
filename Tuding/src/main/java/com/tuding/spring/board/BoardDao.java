package com.tuding.spring.board;

import java.util.ArrayList;

public interface BoardDao {
	void insert(Board b);
	Board selectByNum(int num);
	void updateRead(int num);
	ArrayList<Board> selectByWriter(String writer);
	ArrayList<Board> selectByCategory(String category);
	ArrayList<Board> selectAll();
	void updateLike(int num, int count);
	void update(Board b);
	void delete(int num);
}
