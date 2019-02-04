package com.kitri.app1.Category;

public class Category {
	
	private int code;
	private String text;
	private int parent_code;
	
	public Category() {
	}

	public Category(int code, String text, int parent_code) {
		this.code = code;
		this.text = text;
		this.parent_code = parent_code;
	}

	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public int getParent_code() {
		return parent_code;
	}
	public void setParent_code(int parent_code) {
		this.parent_code = parent_code;
	}
}
