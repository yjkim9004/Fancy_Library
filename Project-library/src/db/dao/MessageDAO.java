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

public class MessageDAO {
	private static MessageDAO instance = new MessageDAO();

	public static MessageDAO getInstance() {
		return instance;
	}

	private MessageDAO() {
	}
	
	private Message generateDataObject(ResultSet rs) throws SQLException {
		Message message = new Message();
		
		message.setMessage_id(rs.getInt("message_id"));
		message.setSender_id(rs.getString("sender_id"));
		message.setSender_name(rs.getString("sender_name"));
		message.setReceiver_id(rs.getString("receiver_id"));
		message.setReceiver_name(rs.getString("receiver_name"));		
		message.setMessage_registdate(new Date(rs.getTimestamp("message_registdate").getTime()));
		message.setMessage_readdate(new Date(rs.getTimestamp("message_readdate").getTime()));
		message.setMessage_content(rs.getString("message_content"));

		return message;
	}
	
	public Message selectMessage(Connection conn, int message_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Message message = null;
		
		try {
			String query = 
					"select * from message_view where message_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, message_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())				 
				message = generateDataObject(rs);			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return message;
	}
	
	public int selectMessage(Connection conn, Member loginMember) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		
		try {
			String query = 
					"select count(*) from message_view where receiver_id = ? and message_readdate is null";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, loginMember.getMember_id());
			
			
			rs = pstmt.executeQuery();
			rs.next();
			count = rs.getInt(1);			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return count;
	}
	
	public ArrayList<Message> selectMessageUsingCondition(
			Connection conn, String target, String value, String target_id, Member loginMember) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Message> messages = new ArrayList<>();
		
		try {
			String query = 
					"select * from message_view "
					+ "where " + target + " like ? and "+ target_id + " = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + value + "%");
			pstmt.setString(2, loginMember.getMember_id());
			
			rs = pstmt.executeQuery();
			
			while(rs.next())				 
				messages.add(generateDataObject(rs));			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return messages;
	}
	
	public int insertMessage(Connection conn, Message message) {
		PreparedStatement pstmt = null;		
		int count = 0;
		
		try {
			String query = 
					"insert into message (send_member_id, receive_member_id, message_content,message_registdate) " 
					+ "values (?,?,?,now())";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, message.getSender_id());
			pstmt.setString(2, message.getReceiver_id());			
			pstmt.setString(3, message.getMessage_content());					
			
			System.out.println(pstmt.toString());
			
			count = pstmt.executeUpdate();			
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			DBCloser.close(pstmt);
		}
		
		return count;
	}
	
	public int updateMessage(Connection conn, int message_id) {
		PreparedStatement pstmt = null;		
		int count = 0;	
		
		try {
			String query = 
					"update message set message_readdate = now()"
					+ " where message_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, message_id);
			
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
}













