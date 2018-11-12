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

public class ReservationDAO {
	private static ReservationDAO instance = new ReservationDAO();

	public static ReservationDAO getInstance() {
		return instance;
	}

	private ReservationDAO() {
	}

	private Reservation generateDataObject(ResultSet rs) throws SQLException {
		Reservation reservation = new Reservation();

		reservation.setReservation_id(rs.getInt("reservation_id"));
		reservation.setMember_id(rs.getString("member_id"));
		reservation.setMember_name(rs.getString("member_name"));
		reservation.setBook_id(rs.getInt("book_id"));
		reservation.setBook_title(rs.getString("book_title"));
		reservation.setReservation_registdate(new Date(rs.getTimestamp("reservation_registdate").getTime()));

		return reservation;
	}

	public ArrayList<Reservation> selectReservation(Connection conn, String member_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Reservation> reservations = new ArrayList<>();

		try {
			String query = "select * from reservation_view where member_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member_id);

			rs = pstmt.executeQuery();

			while (rs.next())
				reservations.add(generateDataObject(rs));

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}

		return reservations;
	}

	public Reservation selectReservation(Connection conn, int book_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reservation reservation = null;

		try {
			String query = "select * from reservation_view " + "where book_id = ? " + "order by reservation_id";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, book_id);

			rs = pstmt.executeQuery();

			if (rs.next())
				reservation = generateDataObject(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}

		return reservation;
	}

	public Reservation selectReservation(
			Connection conn, int book_id, String member_id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Reservation reservation = null;

		try {
			String query = 
					"select * from reservation_view " 
					+ "where book_id = ? and member_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, book_id);
			pstmt.setString(2, member_id);

			rs = pstmt.executeQuery();

			if (rs.next())
				reservation = generateDataObject(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(rs);
			DBCloser.close(pstmt);
		}

		return reservation;
	}

	public int insertReservation(Connection conn, Reservation reservation) {
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			String query = "insert into reservation (book_id, member_id, reservation_registdate) "
					+ "values (?,?, now())";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reservation.getBook_id());
			pstmt.setString(2, reservation.getMember_id());

			System.out.println(pstmt.toString());

			count = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBCloser.close(pstmt);
		}

		return count;
	}

	public int deleteReservation(Connection conn, int reservation_id) {
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			String query = "delete from reservation " + "where reservation_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, reservation_id);

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
	
	public int deleteReservationByBook_id(
				Connection conn, int book_id) {
		PreparedStatement pstmt = null;
		int count = 0;

		try {
			String query = "delete from reservation where book_id = ?";
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, book_id);

			System.out.println(pstmt.toString());

			// 0 �̸� ����, 1 �̸� ����
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
