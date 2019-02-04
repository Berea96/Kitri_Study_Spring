package com.tuding.spring.liked;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("likedService")
public class LikedServiceImpl implements LikedService {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private LikedDao dao;
	
	@Override
	public void addLiked(Liked l) {
		dao = sqlSession.getMapper(LikedDao.class);
		dao.insert(l);
	}

	@Override
	public Liked getByBoardNum(Liked l) {
		dao = sqlSession.getMapper(LikedDao.class);
		return dao.selectByBoardNum(l);
	}

	@Override
	public Liked getByMember(String id) {
		return dao.selectByMember(id);
	}

	@Override
	public void delLiked(Liked l) {
		dao = sqlSession.getMapper(LikedDao.class);
		dao.delete(l);
	}
}
