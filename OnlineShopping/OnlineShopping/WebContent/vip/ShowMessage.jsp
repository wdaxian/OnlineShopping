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
		<table border="1">
			<tr>
				<td>留言主题</td>
				<td>留言内容</td>
				<td>IP地址</td>
				<td>留言时间</td>
				<td>可用操作</td>
			</tr>
	<%
		Connection conn=DbUtil.getConnection();;

		String sqlSearch="SELECT * FROM message";
		
		try{
			Statement st=conn.createStatement();
			ResultSet rs=st.executeQuery(sqlSearch);
			while(rs.next()){
				String msgname=rs.getString("msgname");
				String msg=rs.getString("msg");
				String ip=rs.getString("ip");
				String time=rs.getString("time");				
	%>
			<tr>
				<td><%=msgname %></td>
				<td><%=msg %></td>
				<td><%=ip %></td>
				<td><%=time %></td>
				<td>
					<a href="DeleteMsg.jsp?time=<%=time%>">
						<span id="delete">删除留言</span>
					</a>
				</td>
			</tr>

	<%
			}
			rs.close();
			st.close();
			conn.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		
	%>	 
		</table>
		
		<br>
		<a href="Homepage.jsp">
			<input type="button" id="table-submit" value="继续留言" />
		</a>
		<a href="Login.jsp">
			<input type="button" id="table-submit" value="注销账号" />
		</a>	
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
			</table> --%>


</body>
</html>