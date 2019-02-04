package com.kitri.app1.member;

import java.util.ArrayList;

public interface Service {
	Member getMyInfo(String id);
	ArrayList<Member> getAll();
	void join(Member m);
	void editMyInfo(Member m);
	boolean checkId(String id);
	boolean login(String id, String pwd);
	void delMember(String id);
}
