package henu.utils;
import java.sql.*;

public class DbUtil {
	
	//�����������ݿ���Ϣ
	private static String driver="com.mysql.cj.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/userdb?characterEncoding=utf-8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
	private static final String USER="root";
	private static final String PASSWORD="wangdaxian";
	
	//����JDBC����ض���
	
	protected static Statement s=null;
	protected static ResultSet rs=null;
	protected static Connection conn=null;
	
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//�������ݿ�����
	
	public static Connection getConnection() {
		try {
			conn=DriverManager.getConnection(URL, USER, PASSWORD);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return conn;
	}
	
	/*
	//ִ��INSERT��UPDATE��DELEVT���
	
	public static int executeUpdate(String sql) {
		int result=0;
		try {
			s=getConnection().createStatement();
			result=s.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
	
	//ִ��SELECT���
	
	public static ResultSet executeQuery(String sql) {
		try {
			s=getConnection().createStatement();
			rs=s.executeQuery(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return rs;
	}
	
	//ִ�ж�̬SQL���
	
	public static PreparedStatement execuPreparedStatement(String sql) {
		PreparedStatement ps=null;
		try {
			ps=getConnection().prepareStatement(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ps;
	}
	
	//����ع�
	
	public static void rollback() {
		try {
			getConnection().rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	*/
	
	//�ر����ݿ����Ӷ���
	
	public static void close(ResultSet rs,Statement s,Connection conn) {
		try {
			if(rs!=null) {
				rs.close();
			}
			if(s!=null) {
				s.close();
			}
			if(conn!=null) {
				conn.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	public static void close(PreparedStatement pst,Connection conn) {
		close(null,pst,conn );
		
	}
	
}
