package com.kitri.app1.comment;

import java.sql.Date;

public class Comment {
	private int comment_num;
	private int article_num;
	private String writer;
	private String content;
	private Date w_date;
	
	public Comment() {}
	
	public Comment(int comment_num, int article_num, String writer, String content, Date w_date) {
		super();
		this.comment_num = comment_num;
		this.article_num = article_num;
		this.writer = writer;
		this.content = content;
		this.w_date = w_date;
	}
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getArticle_num() {
		return article_num;
	}
	public void setArticle_num(int article_num) {
		this.article_num = article_num;
	}

	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Date getW_date() {
		return w_date;
	}
	public void setW_date(Date w_date) {
		this.w_date = w_date;
	}
}
