package member;

public interface Service {

	Member getMyInfo(String id);
	void join(Member m);
	void editMyInfo(Member m);
	boolean checkId(String id);
	boolean login(String id, String pwd);
	void delMember(String id);
}
