package com.kitri.app1.imgBoardRep;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("imgBoardRepService")
public class ServiceImpl implements Service {
	
	@Resource(name="sqlSession")
	private SqlSession sqlSession;
	private Dao dao;
	
	@Override
	public void addImgRep(ImgBoardRep ibr) {
		dao = sqlSession.getMapper(Dao.class);

		dao.insert(ibr);
	}

	@Override
	public ArrayList<ImgBoardRep> getAll(int img_num) {
		dao = sqlSession.getMapper(Dao.class);
		return dao.selectAll(img_num);
	}

	@Override
	public void editImgBoard(ImgBoardRep ibr) {
		dao = sqlSession.getMapper(Dao.class);

		dao.update(ibr);
	}

	@Override
	public void delImgBoard(int num) {
		dao = sqlSession.getMapper(Dao.class);

		dao.delete(num);
	}
}
