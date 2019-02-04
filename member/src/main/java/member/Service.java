package member;

import member.dto.Member;

public interface Service {
	void join(Member m);
	void editMember(Member m);
	Member memberInfo(String id);
	void outMember(String id);
}
