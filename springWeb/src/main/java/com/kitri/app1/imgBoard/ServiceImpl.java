package com.kitri.app1.imgBoard;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import com.kitri.app1.imgBoard.Dao;

@Component("imgBoardService")
public class ServiceImpl implements Service {

	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
	@Override
	public int getNum() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.getNum();
	}
	
	@Override
	public void addImg(ImgBoard ib) {
		dao = sqlSession.getMapper(Dao.class);
		System.out.println("진행");
		dao.insert(ib);
	}

	@Override
	public ArrayList<ImgBoard> getAll() {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll();
	}
	
	@Override
	public ArrayList<ImgBoard> getByWriter(String writer) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByWriter(writer);
	}

	@Override
	public ImgBoard getByNum(int num) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectByNum(num);
	}

	@Override
	public void editImgBoard(ImgBoard ib) {
		dao = sqlSession.getMapper(Dao.class);

		dao.update(ib);
	}

	@Override
	public void delImgBoard(int num) {
		dao = sqlSession.getMapper(Dao.class);

		dao.delete(num);
	}
}
