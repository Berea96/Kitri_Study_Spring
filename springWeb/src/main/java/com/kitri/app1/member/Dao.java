package com.kitri.app1.member;

import java.util.ArrayList;

public interface Dao {
	void insert(Member m);
	ArrayList<Member> selectAll();
	Member select(String id);
	void update(Member m);
	void delete(String id);
}
