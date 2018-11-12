package db.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import book.model.BookContent;
import Util.jdbcUtil;

public class BookContentDao {

	public BookContent insert(Connection conn, BookContent content) throws SQLException {
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("insert into book_content" + " (book_no, content) values(?,?)");
			pstmt.setLong(1, content.getNumber());
			pstmt.setString(2, content.getContent());
			int insertedCount = pstmt.executeUpdate();
			if(insertedCount > 0 ) {
				return content;
				
			} else {
				return null;
			} 
			
		} finally {
			jdbcUtil.close(pstmt);
		}
	}
	 
	public BookContent selectById(Connection conn, int no) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("select * from book_content where Book_no = ?");
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			BookContent content = null;
			if(rs.next()) {
				content = new BookContent(rs.getInt("book_no"), rs.getString("content"));
			}
			return content;
		} finally {
			jdbcUtil.close(rs);
			jdbcUtil.close(pstmt);
			
		}
	}
	
	public int update(Connection conn, int no, String content) throws SQLException {
		
		try ( PreparedStatement pstmt = conn.prepareStatement("update book_content set content = ?" + " where book_no = ?")) {
			
		pstmt.setString(1, content);
		pstmt.setInt(2, no);
		return pstmt.executeUpdate();
	}
		}
	
	
}
