package com.kitri.test.prodMem;

public interface Dao {
	void insert(ProdMem pm);
	ProdMem select(String id);
	void update(ProdMem pm);
	void delete(String id);
}
