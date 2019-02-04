package member;

import org.apache.ibatis.session.SqlSession;

public class ServiceImpl implements Service{
	
	private SqlSession sqlSession;
	private Dao dao;
	
	public ServiceImpl(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		this.dao = sqlSession.getMapper(Dao.class);
	}

	@Override
	public Member getMyInfo(String id) {
		return dao.select(id);
	}

	@Override
	public void join(Member m) {
		dao.insert(m);
	}

	@Override
	public void editMyInfo(Member m) {
		dao.update(m);
	}

	@Override
	public boolean checkId(String id) {
		
		Member member = dao.select(id);
		
		if(member == null) {
			return true;
		}
		
		return false;
	}

	@Override
	public boolean login(String id, String pwd) {
		
		Member member = dao.select(id);
		
		if(member != null && member.getId().equals(id) && member.getPwd().equals(pwd)) {
			MemberMenuImpl.m = member;
			return true;
		}
		
		return false;
	}

	@Override
	public void delMember(String id) {
		dao.delete(id);
	}
}
