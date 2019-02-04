package com.kitri.test.basket;

import java.util.ArrayList;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.test.product.Product;

@Component("basketService")
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
	@Override
	public void addBasket(Basket b) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(b);
	}

	@Override
	public ArrayList<Product> getByStar(Map<String, String> m1, Map<String, Integer> m2) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByStar(m1, m2);
	}

	@Override
	public ArrayList<Basket> getByBasket(Map<String, String> m1, Map<String, Integer> m2) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByBasket(m1, m2);
	}

	@Override
	public void editBasket(Basket b) {
		dao = sqlSession.getMapper(Dao.class);
		dao.update(b);
	}

	@Override
	public void delBasket(Basket b) {
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(b);
	}
}
