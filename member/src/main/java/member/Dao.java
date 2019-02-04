package member;

import member.dto.Member;

public interface Dao {
	void insert(Member m);
	void update(Member m);
	void delete(String id);
	Member selectMem(String id);
}
