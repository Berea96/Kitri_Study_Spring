package com.tuding.spring.board;

import java.util.ArrayList;

public interface BoardService {
	void writeBoard(Board b);
	Board getByNum(int num);
	ArrayList<Board> getByWriter(String writer);
	ArrayList<Board> getByCategory(String category);
	ArrayList<Board> getAll();
	void likeBoard(int num, int count);
	void editBoard(Board b);
	void delBoard(int num);
}
