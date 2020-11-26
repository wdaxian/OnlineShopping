<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>个人主页</title>
<link rel="stylesheet" type="text/css" href="css/Login.css" />
</head>
<body>
	<div id="div-table">
		欢迎你登录留言板</br>
		<%=session.getAttribute("name") %></br>
		请开始你的留言</br>
		<form action="Messagebox.jsp" medthod="get">
			<table>
				<tr>
					<td class="table-text">留言主题：</td>
					<td><input name="messagename" type="text" /></td>
				</tr>
				<tr>
					<td class="table-text">留言内容：</td>
					<td><textarea name="message" row="5" cols="25"></textarea></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" id="table-submit" value="留言"></td>
				</tr>
				
			</table>
			
		</form>
		<a href="Messagebox.jsp">
			<input type="button" id="table-submit" value="查看留言板" />
		</a>
		<a href="Login.jsp">
			<input type="button" id="table-submit" value="注销账号" />
		</a>	
				
		
	</div>
	
</body>
</html>