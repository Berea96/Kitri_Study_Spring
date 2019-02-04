package com.kitri.app1.fileBoard;

import java.util.ArrayList;

public interface Dao {
	//seq_file_board_num;
	void insert(FileBoard fb);
	ArrayList<FileBoard> selectAll();
	void update(FileBoard fb);
	void delete(int num);
}
