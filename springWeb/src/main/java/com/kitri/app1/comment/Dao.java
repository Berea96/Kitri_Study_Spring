package com.kitri.app1.comment;

import java.util.ArrayList;

public interface Dao {
	void insert(Comment c);
	ArrayList<Comment> selectAll(int article_num);
	void update(Comment c);
	void delete(int comment_num);
}
