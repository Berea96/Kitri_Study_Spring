package com.kitri.test.product;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("prodService")
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
	@Override
	public int makeNum() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.makeNum();
	}

	@Override
	public void addProduct(Product p) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(p);
	}

	@Override
	public ArrayList<Product> getByWriter(String id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByWriter(id);
	}
	
	@Override
	public ArrayList<Product> getByCate(int cate) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByCate(cate);
	}

	@Override
	public Product getByNum(int num) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByNum(num);
	}

	@Override
	public ArrayList<Product> getAll() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	@Override
	public void editProduct(Product p) {
		dao = sqlSession.getMapper(Dao.class);
		dao.update(p);
	}

	@Override
	public void delProduct(int num) {
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(num);
	}
}
