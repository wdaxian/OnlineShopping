<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="henu.utils.DbUtil"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>留言板</title>
<link rel="stylesheet" type="text/css" href="Login.css" />
</head>
<body>
	<%
		String time=request.getParameter("time");
		Connection conn=DbUtil.getConnection();

		String sql="DELETE FROM message WHERE time='"+time+"'";
		int count=0;
		
		try{
			Statement st=conn.createStatement();
			count=st.executeUpdate(sql);

			st.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(count>0){
			response.sendRedirect("ShowMessage.jsp");
		}
		else{
			out.println("删除失败！");
		}
		
	%>	 

</body>
</html>