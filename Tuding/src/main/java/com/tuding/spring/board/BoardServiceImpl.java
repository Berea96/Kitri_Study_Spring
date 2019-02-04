package com.tuding.spring.board;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("boardService")
public class BoardServiceImpl implements BoardService {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private BoardDao dao;

	@Override
	public void writeBoard(Board b) {
		dao = sqlSession.getMapper(BoardDao.class);
		dao.insert(b);
	}

	@Override
	public Board getByNum(int num) {
		dao = sqlSession.getMapper(BoardDao.class);
		dao.updateRead(num);
		return dao.selectByNum(num);
	}

	@Override
	public ArrayList<Board> getByWriter(String writer) {
		return dao.selectByWriter(writer);
	}

	@Override
	public ArrayList<Board> getByCategory(String category) {
		dao = sqlSession.getMapper(BoardDao.class);
		return dao.selectByCategory(category);
	}

	@Override
	public ArrayList<Board> getAll() {
		dao = sqlSession.getMapper(BoardDao.class);
		return dao.selectAll();
	}
	
	@Override
	public void likeBoard(int num, int count) {
		dao = sqlSession.getMapper(BoardDao.class);
		dao.updateLike(num, count);
	}

	@Override
	public void editBoard(Board b) {
		dao = sqlSession.getMapper(BoardDao.class);
		dao.update(b);
	}

	@Override
	public void delBoard(int num) {
		dao = sqlSession.getMapper(BoardDao.class);
		dao.delete(num);
	}
}
