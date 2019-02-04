package com.kitri.test.prodMem;

public interface Service {
	void join(ProdMem pm);
	ProdMem getMember(String id);
	void editMember(ProdMem pm);
	void delMember(String id);
}
