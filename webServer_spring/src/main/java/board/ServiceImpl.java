package board;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;

public class ServiceImpl implements Service {
	
	private SqlSession sqlSession;
	private Dao dao;
	
	public ServiceImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public void addArticle(Article a) {
		dao.insert(a);
	}

	@Override
	public ArrayList<Article> GetAll() {
		return dao.selectAll();
	}

	@Override
	public Article getByNum(int num) {
		return dao.selectByNum(num);
	}

	@Override
	public ArrayList<Article> getByWriter(String writer) {
		return dao.selectByWriter(writer);
	}

	@Override
	public ArrayList<Article> getTitle(String title) {
		return dao.selectByTitle(title);
	}

	@Override
	public void editArticle(Article a) {
		dao.update(a);
	}

	@Override
	public void delArticle(int num) {
		dao.delete(num);
	}
}
