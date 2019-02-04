package com.kitri.test.product;

import java.util.ArrayList;

public interface Service {
	int makeNum();
	void addProduct(Product p);
	ArrayList<Product> getByWriter(String id);
	ArrayList<Product> getByCate(int cate);
	Product getByNum(int num);
	ArrayList<Product> getAll();
	void editProduct(Product p);
	void delProduct(int num);
}
