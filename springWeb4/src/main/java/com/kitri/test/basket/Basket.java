package com.kitri.test.basket;

public class Basket {
	private int prod_num;
	private String id;
	private int basket_code;
	private int quantity;
	
	public Basket() {
	}
	
	public Basket(int prod_num, String id, int basket_code, int quantity) {
		this.prod_num = prod_num;
		this.id = id;
		this.basket_code = basket_code;
		this.quantity = quantity;
	}

	public final int getProd_num() {
		return prod_num;
	}
	public final void setProd_num(int prod_num) {
		this.prod_num = prod_num;
	}
	
	public final String getId() {
		return id;
	}
	public final void setId(String id) {
		this.id = id;
	}
	
	public final int getBasket_code() {
		return basket_code;
	}
	public final void setBasket_code(int basket_code) {
		this.basket_code = basket_code;
	}

	public final int getQuantity() {
		return quantity;
	}
	public final void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
