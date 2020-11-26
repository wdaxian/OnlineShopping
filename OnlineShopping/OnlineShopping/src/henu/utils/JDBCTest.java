package henu.utils;
import henu.utils.DbUtil;
import java.sql.*;

public class JDBCTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Connection conn=DbUtil.getConnection();
		if(conn!=null) {
			System.out.println("测试，连接成功");
			
		}
		else {
			System.out.println("测试，连接失败");
		}
		
		PreparedStatement pst=null;

		String username="xiao";
		String password="123";
		conn=DbUtil.getConnection();
		String sql="inset into tb_user(username,password)values(?,?)";
		
		try{
			pst=conn.prepareStatement(sql);
			pst.setString(1,username);
			pst.setString(2,password);
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtil.close(pst, conn);
		}

	}

}
