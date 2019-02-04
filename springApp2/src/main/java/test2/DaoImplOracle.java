package test2;

import java.sql.Connection;

public class DaoImplOracle implements Dao {
	
	private DBConn db;
	
	public void setDb(DBConn db) {
		this.db = db;
	}

	@Override
	public void insert() {
		System.out.println("Oracle insert");
	}

	@Override
	public void select() {
		System.out.println("Oracle select");
	}

	@Override
	public void update() {
		System.out.println("Oracle update");
	}

	@Override
	public void delete() {
		System.out.println("Oracle delete");
	}

}
