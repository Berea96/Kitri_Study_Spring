package com.kitri.app1.Category;

import java.util.ArrayList;

public interface Dao {
	void insert(Category c);
	ArrayList<Category> selectAll(int parent_code);
}
