package com.kitri.test.product;

import java.util.ArrayList;

public interface Dao {
	int makeNum();
	void insert(Product p);
	ArrayList<Product> selectByWriter(String id);
	Product selectByNum(int num);
	ArrayList<Product> selectByCate(int cate);
	ArrayList<Product> selectAll();
	void update(Product p);
	void delete(int num);
}
