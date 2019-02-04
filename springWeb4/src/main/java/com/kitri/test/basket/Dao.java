package com.kitri.test.basket;

import java.util.ArrayList;
import java.util.Map;

import com.kitri.test.product.Product;

public interface Dao {
	void insert(Basket b);
	ArrayList<Product> selectByStar(Map<String, String> m1, Map<String, Integer> m2);
	ArrayList<Basket> selectByBasket(Map<String, String> m1, Map<String, Integer> m2);
	void update(Basket b);
	void delete(Basket b);
}