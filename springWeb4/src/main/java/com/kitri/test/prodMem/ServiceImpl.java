package com.kitri.test.prodMem;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("prodMemService")
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
	@Override
	public void join(ProdMem pm) {
		dao = sqlSession.getMapper(Dao.class);
		dao.insert(pm);
	}

	@Override
	public ProdMem getMember(String id) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.select(id);
	}

	@Override
	public void editMember(ProdMem pm) {
		dao = sqlSession.getMapper(Dao.class);
		dao.update(pm);
	}

	@Override
	public void delMember(String id) {
		dao = sqlSession.getMapper(Dao.class);
		dao.delete(id);
	}
}
