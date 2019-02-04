package com.kitri.app1.comment;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.app1.comment.Dao;

@Component("comService")
public class ServiceImpl implements Service {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
	@Override
	public void writeComment(Comment c) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(c);
	}

	@Override
	public ArrayList<Comment> getAll(int article_num) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll(article_num);
	}

	@Override
	public void editComment(Comment c) {
		dao = sqlSession.getMapper(Dao.class);
		dao.update(c);
	}

	@Override
	public void delComment(int comment_num) {
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(comment_num);
	}
}