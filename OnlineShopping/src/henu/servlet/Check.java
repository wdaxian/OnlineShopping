package henu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

import henu.utils.DbUtil;

public class Check extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Connection conn=null;
		Statement st=null;
		ResultSet rs=null;
		
		if(username!=""&&password!=""){
			
		
			String sql="SELECT * FROM user WHERE username='"+username+"'";
		
			conn=DbUtil.getConnection();
			try{
				st=conn.createStatement();
				rs=st.executeQuery(sql);
				while(rs.next()){
					if(rs.getString("password").equals(password)){
	
						out.print("你好！登录成功！<br /> ");
						out.print("姓名："+username+"<br /> ");
						out.print("界面将在 3s后自动跳转");
	
						response.setHeader("Refresh","3;URL=Homepage.jsp");
	
					}
					else{
						out.print("密码错误！<br />");
						out.print("请重新输入用户名和密码！<br />");
	
						response.setHeader("Refresh","3;URL=Login.jsp");
					}
					
				}
			
				rs.close();
				conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			
			}
		
		}
		else{
			out.print("用户名和密码不能为空！");
			response.setHeader("Refresh","3;URL=Login.jsp");
		}
	
	}
	
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws IOException, ServletException {
		super.doGet(request, response);
	}
}
