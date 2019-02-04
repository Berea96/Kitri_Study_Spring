package member;

import member.dto.Member;

public class ServiceImpl implements Service {
	
	private Dao dao;
	
	public void setDao(Dao dao) {
		this.dao = dao;
	}

	@Override
	public void join(Member m) {
		dao.insert(m);
	}

	@Override
	public void editMember(Member m) {
		dao.update(m);
	}

	@Override
	public Member memberInfo(String id) {
		return dao.selectMem(id);
	}

	@Override
	public void outMember(String id) {
		dao.delete(id);
	}
}
