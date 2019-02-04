package com.kitri.app1.Category;

import java.util.ArrayList;

public interface Service {
	void createCategory(Category c);
	ArrayList<Category> getAll(int code);
}
