package com.kitri.app1.board;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("bodService")
public class ServiceImpl implements Service {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public void addArticle(Article a) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.insert(a);
	}

	@Override
	public ArrayList<Article> GetAll() {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	@Override
	public Article getByNum(int num) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectByNum(num);
	}

	@Override
	public ArrayList<Article> getByWriter(String writer) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectByWriter(writer);
	}

	@Override
	public ArrayList<Article> getTitle(String title) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.selectByTitle(title);
	}

	@Override
	public void editArticle(Article a) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.update(a);
	}

	@Override
	public void delArticle(int num) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.delete(num);
	}
}
