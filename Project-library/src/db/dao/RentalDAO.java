package db.dao;

//������ �����ϱ� ���� sql ��Ű�� ����Ʈ
import java.sql.*;
//������ ����� ��ȯ�ϱ� ���� util ��Ű�� ����Ʈ
//(�÷��� ��ü�� Ȱ��)
import java.util.*;
import java.util.Date;

//select ������ ������ �� ������ �����ϱ� ����
//�� Ŭ���� ����Ʈ
import db.model.*;
import db.util.*;

public class RentalDAO {
	private static RentalDAO instance = new RentalDAO();
	public static RentalDAO getInstance() {
		return instance;
	}
	private RentalDAO() {}
	
	private Rental generateDataObject(ResultSet rs) throws SQLException {
		Rental rental;		
		rental = new Rental(
					rs.getInt("rental_id"), 
					rs.getString("member_id"), 
					rs.getString("member_name"), 
					rs.getInt("book_id"), 
					rs.getString("book_title"), 
					rs.getDate("rental_registdate"), 
					rs.getBoolean("rental_isReturn"), 
					rs.getTime("rental_returndate"));
		return rental;
	}
	
	public boolean selectIsRental(
				Connection conn, int rental_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;		
		Rental rental = null;
		
		try {
			String query = 
					"select * from rental_view "
					+ "where rental_id = ?";
			pstmt = conn.prepareStatement(query);			
			pstmt.setInt(1, rental_id);
			rs = pstmt.executeQuery();
			
			if(rs.next())				 
				rental = generateDataObject(rs);	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return rental.isRental_isReturn();
	}
	
	public ArrayList<Rental> selectRental(Connection conn) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Rental> Rentals = new ArrayList<>();
		
		try {
			String query = 
					"select * from rental_view";
			pstmt = conn.prepareStatement(query);			
			
			rs = pstmt.executeQuery();
			
			while(rs.next())				 
				Rentals.add(generateDataObject(rs));	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return Rentals;
	}
	
	public ArrayList<Rental> selectRental(
			Connection conn, boolean isRental) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Rental> Rentals = new ArrayList<>();
		
		try {
			String query = 
					"select * from rental_view "
					+ "where rental_isReturn = ?";
			pstmt = conn.prepareStatement(query);			
			pstmt.setInt(1, isRental ? 0 : 1);
			rs = pstmt.executeQuery();
			
			while(rs.next())				 
				Rentals.add(generateDataObject(rs));	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return Rentals;
	}
	
	public ArrayList<Rental> selectRental(
			Connection conn, String member_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Rental> Rentals = new ArrayList<>();
		
		try {
			String query = 
					"select * from rental_view "
					+ "where member_id = ? and rental_isReturn = 0";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next())				 
				Rentals.add(generateDataObject(rs));	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return Rentals;
	}
	
	public Rental selectRental(
			Connection conn, int book_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Rental Rental = null;
		
		try {
			String query = 
					"select * from rental_view "
					+ "where book_id = ? and rental_isReturn = 0";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, book_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())				 
				Rental = generateDataObject(rs);	
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return Rental;
	}
	
	public int insertRental(Connection conn, Rental rental) {
		PreparedStatement pstmt = null;		
		int count = 0;
		 
		try {
			String query = 
					"insert into rental (book_id, member_id, rental_registdate, rental_isReturn) " 
					+ " values (?,?, now(), default)";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rental.getBook_id());
			pstmt.setString(2, rental.getMember_id());
			
			System.out.println(pstmt.toString());
			
			count = pstmt.executeUpdate();			
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			DBCloser.close(pstmt);
		}
		
		return count;
	}
	
	public int updateRental(Connection conn, Rental rental) {
		PreparedStatement pstmt = null;		
		int count = 0;	
		
		try {
			String query = 
					"update rental set rental_isReturn = 1, "
					+ " rental_returndate = now() "
					+ "where rental_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, rental.getRental_id());
			
			System.out.println(pstmt.toString());
			
			// 0 �̸� ����, 1 �̸� ����
			count = pstmt.executeUpdate();		
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			DBCloser.close(pstmt);
		}
		
		return count;
	}
	
	public int deleteRental(Connection conn, int book_id) {
		PreparedStatement pstmt = null;		
		int count = 0;	
		
		try {
			String query = 
					"delete from rental where book_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, book_id);
			
			System.out.println(pstmt.toString());
			
			// 0 �̸� ����, 0 �� �ƴϸ� ����
			count = pstmt.executeUpdate();		
				
		} catch (SQLException e) {
			e.printStackTrace();
			count = -1;
		} finally {			
			DBCloser.close(pstmt);
		}
		
		return count;
	}
}














