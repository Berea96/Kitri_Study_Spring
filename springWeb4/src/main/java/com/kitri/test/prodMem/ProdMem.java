package com.kitri.test.prodMem;

public class ProdMem {
	private String id;
	private String pwd;
	private String name;
	private String email;
	private int type;
	
	public ProdMem() {
	}
	
	public ProdMem(String id, String pwd, String name, String email, int type) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.type = type;
	}
	
	public final String getId() {
		return id;
	}
	public final void setId(String id) {
		this.id = id;
	}
	public final String getPwd() {
		return pwd;
	}
	public final void setPwd(String pwd) {
		this.pwd = pwd;
	}
	
	public final String getName() {
		return name;
	}
	public final void setName(String name) {
		this.name = name;
	}
	
	public final String getEmail() {
		return email;
	}
	public final void setEmail(String email) {
		this.email = email;
	}
	
	public final int getType() {
		return type;
	}
	public final void setType(int type) {
		this.type = type;
	}
}
