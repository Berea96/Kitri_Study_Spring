package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;
import member.dto.Member;

public class DaoImpl implements Dao {
	
	private DBConnect db;
	private Connection conn;
	private PreparedStatement ps;
	
	private int result;
	
	public DaoImpl() {
		this.db = DBConnect.getInstance();
	}
	
	public void close(Connection conn, PreparedStatement ps) {
		try {
			ps.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void insert(Member m) {
		conn = db.getConnection();
		
		String sql = "insert into spring_mem values(?, ?, ?)";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, m.getId());
			ps.setString(2, m.getPwd());
			ps.setString(3, m.getName());
			
			result = ps.executeUpdate();
			
			if(result == 1) 
				System.out.println("가입성공");
			else 
				System.out.println("가입실패");
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, ps);
		}
	}

	@Override
	public void update(Member m) {
		conn = db.getConnection();
		
		String sql = "update spring_mem set pwd = ?, name = ? where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, m.getPwd());
			ps.setString(2, m.getName());
			ps.setString(3, m.getId());
			
			result = ps.executeUpdate();
			
			if(result == 1) 
				System.out.println("수정성공");
			else 
				System.out.println("수정실패");
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, ps);
		}
	}

	@Override
	public void delete(String id) {
		conn = db.getConnection();
		
		String sql = "delete spring_mem where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, id);
			
			result = ps.executeUpdate();
			
			if(result == 1) 
				System.out.println("삭제성공");
			else 
				System.out.println("삭제실패");
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, ps);
		}
	}

	@Override
	public Member selectMem(String id) {
		conn = db.getConnection();
		Member m = null;
		
		String sql = "select * from spring_mem where id = ?";
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()) 
				m = new Member(rs.getString(0), rs.getString(1), rs.getString(2));
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn, ps);
		}
		
		return m;
	}
}
