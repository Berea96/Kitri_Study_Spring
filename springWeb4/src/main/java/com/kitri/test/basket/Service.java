package com.kitri.test.basket;

import java.util.ArrayList;
import java.util.Map;

import com.kitri.test.product.Product;

public interface Service {
	void addBasket(Basket b);
	ArrayList<Product> getByStar(Map<String, String> m1, Map<String, Integer> m2);
	ArrayList<Basket> getByBasket(Map<String, String> m1, Map<String, Integer> m2);
	void editBasket(Basket b);
	void delBasket(Basket b);
}