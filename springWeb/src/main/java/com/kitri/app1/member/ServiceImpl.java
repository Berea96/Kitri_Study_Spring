package com.kitri.app1.member;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("memService")
public class ServiceImpl implements Service{
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
//	public void setSqlSession(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}

	public Member getMyInfo(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		return dao.select(id);
	}
	
	@Override
	public ArrayList<Member> getAll() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}

	public void join(Member m) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.insert(m);
	}

	public void editMyInfo(Member m) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.update(m);
	}

	public boolean checkId(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		
		Member member = dao.select(id);
		
		if(member == null) {
			return true;
		}
		
		return false;
	}

	public boolean login(String id, String pwd) {
		this.dao = sqlSession.getMapper(Dao.class);
		
		Member member = dao.select(id);
		
		if(member != null && member.getId().equals(id) && member.getPwd().equals(pwd)) {
			return true;
		}
		
		return false;
	}

	public void delMember(String id) {
		this.dao = sqlSession.getMapper(Dao.class);
		dao.delete(id);
	}
}
