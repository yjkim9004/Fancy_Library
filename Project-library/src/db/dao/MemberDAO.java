package db.dao;

// ������ �����ϱ� ���� sql ��Ű�� ����Ʈ
import java.sql.*;
// ������ ����� ��ȯ�ϱ� ���� util ��Ű�� ����Ʈ
// (�÷��� ��ü�� Ȱ��)
import java.util.*;
import java.util.Date;

// select ������ ������ �� ������ �����ϱ� ����
// �� Ŭ���� ����Ʈ
import db.model.*;
import db.util.*;

// DAO : Database Access Object
// �����ͺ��̽��� �����Ͽ� ������ �����ϰ�
// ����� ��ȯ�ϴ� Ŭ������ ��Ī�ϴ� ���
public class MemberDAO {
	// DAO Ŭ�������� ��ü�� ������ �����Ͽ� ����ϴ� ���
	// �����ͺ��̽��� ������ ������ �� �־�
	// ��ü���� ���� ���ϸ� ����ų �� �ֽ��ϴ�.
	// ��κ� DAO Ŭ�������� �̱��� ������ �����մϴ�.
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {}
	
	private Member generateDataObject(ResultSet rs) throws SQLException {
		Member member;
		member = new Member(
					rs.getString("member_id"), 
					rs.getString("member_password"), 
					rs.getInt("member_type"), 
					rs.getString("member_name"), 
					rs.getInt("member_age"), 
					rs.getString("member_tel"), 
					rs.getString("member_address"), 
					rs.getString("member_email"), 
					rs.getString("member_gender"), 
					rs.getString("member_photo"), 
					new Date(rs.getTimestamp("member_registDate").getTime()));
		return member;
	}
	
	public Member selectMember(Connection conn, String member_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		try {
			String query = 
					"select * from member where member_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next())				 
				member = generateDataObject(rs);			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return member;
	}
	
	public ArrayList<Member> selectMemberUsingCondition(
			Connection conn, String target, String value, Member loginMember) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Member> members = new ArrayList<>();
		
		try {
			String query = 
					"select * from member "
					+ "where " + target + " like ? and member_id != ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + value + "%");
			pstmt.setString(2, loginMember.getMember_id());
			
			rs = pstmt.executeQuery();
			
			while(rs.next())				 
				members.add(generateDataObject(rs));			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}
		
		return members;
	}
	
	public int insertMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;		
		int count = 0;
		
		try {
			String query = 
					"insert into member values (?,?, default,?,?,?,?,?,?,?, now())";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMember_id());
			pstmt.setString(2, member.getMember_password());			
			pstmt.setString(3, member.getMember_name());
			pstmt.setInt(4, member.getMember_age());
			pstmt.setString(5, member.getMember_tel());
			pstmt.setString(6, member.getMember_address());
			pstmt.setString(7, member.getMember_email());
			pstmt.setString(8, member.getMember_gender());
			pstmt.setString(9, member.getMember_photo());			
			
			System.out.println(pstmt.toString());
			
			count = pstmt.executeUpdate();			
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {			
			DBCloser.close(pstmt);
		}
		
		return count;
	}
	
	// �н����带 �����ϴ� �޼ҵ�
	public int updateMember(Connection conn, Member member, String newPassword) {
		PreparedStatement pstmt = null;		
		int count = 0;	
		
		try {
			String query = 
					"update member set member_password = ?"
					+ " where member_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, newPassword);
			pstmt.setString(2, member.getMember_id());
			
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
	
	public int updateMember(Connection conn, Member member) {
		PreparedStatement pstmt = null;		
		int count = 0;	
		
		try {
			String query = 
					"update member set member_name = ?, member_age = ?, " 
					+ " member_tel = ?, member_address = ?, member_email = ?, "
					+ " member_gender = ? "
					+ " where member_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMember_name());
			pstmt.setInt(2, member.getMember_age());
			pstmt.setString(3, member.getMember_tel());
			pstmt.setString(4, member.getMember_address());
			pstmt.setString(5, member.getMember_email());
			pstmt.setString(6, member.getMember_gender());
			pstmt.setString(7, member.getMember_id());
			
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
	
	/*
	public int deleteMember(Connection conn, Member member) {
		
	}
	*/
}


















