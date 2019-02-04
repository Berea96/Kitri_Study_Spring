package com.kitri.test.category;

import java.util.ArrayList;

public interface Service {
	void createCategory(Category c);
	ArrayList<Category> getAll(int code);
}
