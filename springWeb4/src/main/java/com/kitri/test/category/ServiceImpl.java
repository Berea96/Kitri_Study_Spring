package com.kitri.test.category;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("categoryService")
public class ServiceImpl implements Service {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;

	@Override
	public void createCategory(Category c) {
		dao = sqlSession.getMapper(Dao.class);
		
		dao.insert(c);
	}

	@Override
	public ArrayList<Category> getAll(int parent_code) {
		dao = sqlSession.getMapper(Dao.class);
		
		return dao.selectAll(parent_code);
	}
}
