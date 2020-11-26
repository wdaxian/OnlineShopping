<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.cj.xdevapi.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="henu.utils.DbUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="css/Login.css" />
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		PreparedStatement pst=null;
		Connection conn=null;
		
		conn=DbUtil.getConnection();
		String sql="INSERT INTO user(username,password) VALUES (?,?)";
		
		
		try{
			pst=conn.prepareStatement(sql);
			pst.setString(1,username);
			pst.setString(2,password);
			

			int result=pst.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtil.close(pst, conn);
		}
		
	
		
	%>	
	
	<div id="div-table">
		<h1 id="h3">用户登录</h1>
		<form action="Check" method="get">
			<table algin="left">
				<tr>
					<td class="table-text">用户：</td>
					<td><input name="username" type="text" /></td>
					
				</tr>
				<tr>
					<td class="table-text">密码：</td>
					<td><input name="password" type="password" /></td>
				</tr>
				<tr>
					<td><input name="submit" id="table-submit" type="submit" 
						value="登录" /></td>
					<td><a href="index.jsp"><input type="button" id="table-submit" value="注册" /></a></td>
				</tr>
			</table>
		</form>
	</div>
	

</body>
</html>