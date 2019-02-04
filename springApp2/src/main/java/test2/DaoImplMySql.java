package test2;

public class DaoImplMySql implements Dao {
	
	private DBConn conn;
	
	public void setConn(DBConn conn) {
		this.conn = conn;
	}

	@Override
	public void insert() {
		System.out.println("Mysql isnert");
	}

	@Override
	public void select() {
		System.out.println("Mysql select");
	}

	@Override
	public void update() {
		System.out.println("Mysql update");
	}

	@Override
	public void delete() {
		System.out.println("Mysql delete");
	}

}
