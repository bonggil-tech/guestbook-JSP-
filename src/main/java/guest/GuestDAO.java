package guest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.DriverManager;
//import java.util.ArrayList;

public class GuestDAO {
	
	private Connection conn;
	private ResultSet rs;
	private PreparedStatement pstmt;
	
	public GuestDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost/igh05001";
			String dbID = "igh05001";
			String dbPwd = 히히 비밀
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPwd);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//��¥ ���ϱ�
	public String getDate() {
		String SQL = "SELECT DATE(NOW())";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}			
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return "";
	}
	//��� ���� �ҷ�����
	public ArrayList<Guest> getguestbook() {
		String SQL = "SELECT * FROM guestbook ORDER BY guestNum";
		ArrayList<Guest> list = new ArrayList<Guest>();
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Guest guest=new Guest();
				guest.setguestNum(rs.getInt(1));
				guest.setguestTitle(rs.getString(2));
				guest.setguestDate(rs.getString(3));
				guest.setguestContent(rs.getString(4));
				list.add(guest);
			}
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return list;
	}
	//��� ���� �Լ�.................���߿� jsp�ϼ��Ǹ� �ڹ� ����Ͽ� list.get().getguest(�ش��Լ�)����Ͽ� ����ǥ��
	public Guest getguest(int guestNum) {
		String SQL = "SELECT * FROM guestbook WHERE guestNum=? ORDER BY guestNum DESC";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, guestNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				Guest guest=new Guest();
				guest.setguestNum(rs.getInt(1));
				guest.setguestTitle(rs.getString(2));
				guest.setguestDate(rs.getString(3));	
				guest.setguestContent(rs.getString(4));			
				return guest;
			}
		}catch (Exception e) {
			e.printStackTrace();			
		}
		return null;
	}
	//��Ϻҷ�����
	public int nextguestNum() {
		String SQL = "SELECT guestNum FROM guestbook ORDER BY guestNum ASC";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;	
			}else {
				return 1;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	return -1;
	}
	//�ۼ�
	public int guestWrite(String guestTitle,String guestContent,String guestPass) {
		String SQL = "insert into guestbook(guestTitle,guestContent,guestDate,guestFlag,guestPass) values(?,?,?,?,?);";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, guestTitle);
			pstmt.setString(2, guestContent);
			pstmt.setString(3, getDate());
			pstmt.setInt(4, 1);
			pstmt.setString(5, guestPass);
			return pstmt.executeUpdate();			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	//����


	public int delete(int guestNum,String guestPass) {
		String SQL = "DELETE FROM guestbook WHERE guestNum=? AND guestPass=?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, guestNum);
			pstmt.setString(2, guestPass);			
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;//�����ͺ��̽� ����
	}

	public int delete2(int guestNum,String guestPass) {
		String SQL = "SELECT guestPass FROM guestbook WHERE guestNum=?";
		try {
			pstmt=conn.prepareStatement(SQL);//DB���� SQL�����غ�
			pstmt.setInt(1, guestNum);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(guestPass)) {
					return 1;
				}else {
					return -1;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return -3;//�����ͺ��̽� ����
	}
			

}
