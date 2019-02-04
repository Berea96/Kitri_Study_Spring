package com.kitri.test.product;

import org.springframework.web.multipart.MultipartFile;

public class Product {
	private int num;
	private String title;
	private String seller;
	private int category;
	private int quantity;
	private String content;
	private int price;
	private String img1;
	private String img2;
	private String img3;
	private String img4;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	
	public Product() {
	}
	
	public Product(int num, String title, String seller, int category, 
				   int quantity, String content, int price,
				   String img1, String img2, String img3, String img4) {
		this.num = num;
		this.title = title;
		this.seller = seller;
		this.category = category;
		this.quantity = quantity;
		this.content = content;
		this.price = price;
		this.img1 = img1;
		this.img2 = img2;
		this.img3 = img3;
		this.img4 = img4;
	}
	
	public final int getNum() {
		return num;
	}
	public final void setNum(int num) {
		this.num = num;
	}
	
	public final String getTitle() {
		return title;
	}
	public final void setTitle(String title) {
		this.title = title;
	}
	
	public final String getSeller() {
		return seller;
	}
	public final void setSeller(String seller) {
		this.seller = seller;
	}
	
	public final int getCategory() {
		return category;
	}
	public final void setCategory(int category) {
		this.category = category;
	}
	
	public final int getQuantity() {
		return quantity;
	}
	public final void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public final String getContent() {
		return content;
	}
	public final void setContent(String content) {
		this.content = content;
	}
	
	public final int getPrice() {
		return price;
	}
	public final void setPrice(int price) {
		this.price = price;
	}
	
	public final String getImg1() {
		return img1;
	}
	public final void setImg1(String img1) {
		this.img1 = img1;
	}
	
	public final String getImg2() {
		return img2;
	}
	public final void setImg2(String img2) {
		this.img2 = img2;
	}
	
	public final String getImg3() {
		return img3;
	}
	public final void setImg3(String img3) {
		this.img3 = img3;
	}
	
	public final String getImg4() {
		return img4;
	}
	public final void setImg4(String img4) {
		this.img4 = img4;
	}

	public final MultipartFile[] getFile() {
		
		MultipartFile[] file = new MultipartFile[] {file1, file2, file3, file4};
		
		return file;
	}
	
	public final MultipartFile getFile1() {
		return file1;
	}

	public final MultipartFile getFile2() {
		return file2;
	}

	public final MultipartFile getFile3() {
		return file3;
	}

	public final MultipartFile getFile4() {
		return file4;
	}

	public final void setFile1(MultipartFile file1) {
		this.file1 = file1;
	}
	public final void setFile2(MultipartFile file2) {
		this.file2 = file2;
	}
	public final void setFile3(MultipartFile file3) {
		this.file3 = file3;
	}
	public final void setFile4(MultipartFile file4) {
		this.file4 = file4;
	}

	@Override
	public String toString() {
		return "Product [num=" + num + ", title=" + title + ", seller=" + seller + ", category=" + category
				+ ", quantity=" + quantity + ", content=" + content + ", price=" + price + ", img1=" + img1 + ", img2="
				+ img2 + ", img3=" + img3 + ", img4=" + img4 + "]";
	}
}
