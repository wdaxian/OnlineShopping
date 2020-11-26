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
<link rel="stylesheet" type="text/css" href="css/Login.css" />
</head>
<body>
	<%
		String msgname=request.getParameter("messagename");
		String msg=request.getParameter("message");
		String ip=request.getRemoteAddr();
		String time=(new Date()).toLocaleString();
		
		if(msg==null){
			msg="null";
		}
		
		PreparedStatement pst=null;
		Connection conn=null;
		
		conn=DbUtil.getConnection();
		String sql="INSERT INTO message(msgname,msg,ip,time) VALUES(?,?,?,?)";
		
		try{
			pst=conn.prepareStatement(sql);
			pst.setString(1,msgname);
			pst.setString(2,msg);
			pst.setString(3,ip);
			pst.setString(4, time);
			
			int result=pst.executeUpdate();
			
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			DbUtil.close(pst, conn);
		}
		
		response.sendRedirect("ShowMessage.jsp");
	%>
		
		<%-- 
		ResultSet rs=null;
		Statement st=null;

		String sqlSearch="SELECT * FROM message";


		try{
			st=conn.createStatement();
			rs=st.executeQuery(sqlSearch);
			
			System.out.println(rs);
	%>
			<table border="1">
			<tr>
				<td>留言主题</td>
				<td>留言内容</td>
				<td>IP地址</td>
				<td>留言时间</td>
			</tr>
	<%
			while(rs.next()){
				out.println("<tr>");
				out.println("<td>"+rs.getString("msgname")+"</td>");
				out.println("<td>"+rs.getString("msg")+"</td>");
				out.println("<td>"+rs.getString("ip")+"</td>");
				out.println("<td>"+rs.getString("time")+"</td>");
				out.println("</tr>");
				
	%>
			</table>
	<%
			}
			rs.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		 
		
		
	%>	 
		
	<%-- 	
		
		Vector v=(Vector)application.getAttribute("v");
		if(v==null){
			v=new Vector();
		}

		String s=msgname+"#"+msg+"#"+ip+"#"+time;
		v.add(s);
		application.setAttribute("v",v);
		
		
		
		
		%>
		<table>
			<tr>
				<td>留言用户</td>
				<td>留言内容</td>
				<td>IP地址</td>
				<td>留言时间</td>
			</tr>
		<%
		for(int i=0;i<v.size();i++){
			out.print("<tr>");
			String st=(String)v.elementAt(i);
			String ss[]=st.split("#");
			for(int j=0;j<ss.length;j++){
				out.print("<td>"+ss[j]+"</td>");
			}
			out.print("</tr>");
		}

		%>
			</table> 
	<a href="Homepage.jsp"><input type="button" id="table-submit" value="继续留言" /></a>
	<a href="Login.jsp"><input type="button" id="table-submit" value="注销账号" /></a>	
		--%>
</body>
</html>