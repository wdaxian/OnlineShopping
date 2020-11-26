package henu.utils;
import java.sql.*;

public class DbUtil {
	
	//声明连接数据库信息
	private static String driver="com.mysql.cj.jdbc.Driver";
	private static final String URL="jdbc:mysql://localhost:3306/userdb?characterEncoding=utf-8&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";
	private static final String USER="root";
	private static final String PASSWORD="wangdaxian";
	
	//声明JDBC的相关对象
	
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
	
	//创建数据库连接
	
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
	//执行INSERT、UPDATE、DELEVT语句
	
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
	
	//执行SELECT语句
	
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
	
	//执行动态SQL语句
	
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
	
	//事务回滚
	
	public static void rollback() {
		try {
			getConnection().rollback();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	*/
	
	//关闭数据库连接对象
	
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
