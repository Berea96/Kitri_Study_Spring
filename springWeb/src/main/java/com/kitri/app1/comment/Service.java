package com.kitri.app1.comment;

import java.util.ArrayList;

public interface Service {
	void writeComment(Comment c);
	ArrayList<Comment> getAll(int article_num);
	void editComment(Comment c);
	void delComment(int comment_num);
}
