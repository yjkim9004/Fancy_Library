package db.dao;

//쿼리를 수행하기 위한 sql 패키지 임포트
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import db.model.Book;
import db.util.DBCloser;
import book.model.Writer;
import Util.jdbcUtil;
import article.model.Article;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;

public class BookDAO {
	private static BookDAO instance = new BookDAO();
	public static BookDAO getInstance() {
		return instance;
	}
	public BookDAO() {}
	
	private Book generateDataObject(ResultSet rs) throws SQLException {
		Book book = new Book();
		
		book.setBook_id(rs.getInt("book_id"));
		book.setBook_title(rs.getString("book_title"));
		book.setBook_author(rs.getString("book_author"));
		book.setBook_publisher(rs.getString("book_publisher"));
		book.setBook_price(rs.getDouble("book_price"));
		book.setBook_image(rs.getString("book_image"));
		book.setBook_registdate(new Date(rs.getTimestamp("book_registdate").getTime()));
		
		return book;
	}
	
	public ArrayList<Book> selectAllBook(Connection conn, int startRow, int size) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement("select * from book" 
					+ " order by book_no desc limit ?,?");
			
			pstmt.setInt(1,  startRow);
			pstmt.setInt(2,  size);
			rs = pstmt.executeQuery();
			ArrayList<Book> result = new ArrayList<>();
			while (rs.next()) {
				books.add(generateDataObject(rs));		
			} 
			
			return result;
		}finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			
		}
	}
	
	public Book selectBook(Connection conn, int book_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Book book = null;
		
		try {
			String query = 
					"select * from book where book_id = ?";
			pstmt = conn.prepareStatement(query);	
			pstmt.setInt(1, book_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())				
				book = generateDataObject(rs);			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return book;
	}
	
	public int selectCount(Connection conn) throws SQLException {
		
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from book");
			
			if (rs.next()) {
				return rs.getInt(1);
			}
			return 0;
			
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(stmt);
		}
	}
	
	
	public ArrayList<Book> selectBookUsingCondition(
			Connection conn, String target, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList<>();
		
		try {
			String query = 
					"select * from book where " + target + 
					" like ?";
			pstmt = conn.prepareStatement(query);	
			pstmt.setString(1, "%" + value + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next())				
				books.add(generateDataObject(rs));			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return books;
	}
	
	public ArrayList<Book> selectBookUsingCondition(
				Connection conn, String value) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList<>();
		
		try {
			String query = 
					"select * from book where book_title like ? "
					+ " or book_author like ? or "
					+ " book_publisher like ?";
			pstmt = conn.prepareStatement(query);	
			pstmt.setString(1, "%" + value + "%");
			pstmt.setString(2, "%" + value + "%");
			pstmt.setString(3, "%" + value + "%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next())				
				books.add(generateDataObject(rs));			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return books;
	}
	
	public int insertBook(Connection conn, Book book) {
		PreparedStatement pstmt = null;		
		int count = 0;
		
		try {
			String query = 
					"insert into book (book_title, book_author, book_publisher, book_price, book_image, book_registdate) " 
					+ " values (?,?,?,?,?,now())";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, book.getBook_title());
			pstmt.setString(2, book.getBook_author());
			pstmt.setString(3, book.getBook_publisher());
			pstmt.setDouble(4, book.getBook_price());
			pstmt.setString(5, book.getBook_image());			
			
			System.out.println(pstmt.toString());
			
			count = pstmt.executeUpdate();			
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			DBCloser.close(pstmt);
		}
		
		return count;
	}
	
	public int updateBook(Connection conn, Book book) {
		PreparedStatement pstmt = null;		
		int count = 0;
		
		Book original = selectBook(conn, book.getBook_id());
		
		if( original.equals(book) )
			return -1;
		
		try {
			String query = 
					"update book set book_title = ?, book_author = ?, " 
					+ " book_publisher = ?, book_price = ? "
					+ " where book_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, book.getBook_title());
			pstmt.setString(2, book.getBook_author());
			pstmt.setString(3, book.getBook_publisher());
			pstmt.setDouble(4, book.getBook_price());
			pstmt.setInt(5, book.getBook_id());			
			
			System.out.println(pstmt.toString());
			
			count = pstmt.executeUpdate();			
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			DBCloser.close(pstmt);
		}
		
		return count;
	}
	
	public int deleteBook(Connection conn, int book_id) {
		PreparedStatement pstmt = null;		
		int count = 0;		
		
		try {
			String query = 
					"delete from book where book_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, book_id);			
			
			System.out.println(pstmt.toString());
			
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











