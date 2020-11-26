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
<title>用户注册</title>
<link rel="stylesheet" type="text/css" href="css/index.css" />
<script src="javascript/index.js"></script>
</head>
<body>
	<div id="div-table">
		<h1 id="h1">用户注册</h1>
		<form action="Login.jsp" method="get">
			<table algin="left">
				<tr>
					<td class="table-text">用户名:</td>
					<td class="table-text-right">
						<input name="username" id="username" type="text" onBlur="return checkForm()" />
						<span id="tips_username">用户名不能少于3个字符</span></td>
				</tr>
				<tr>
					<td class="table-text">密码:</td>
					<td class="table-text-right">
						<input name="password" id="password" type="password" onBlur="return checkForm()" />
						<span id="tips_password">请输入8-12位密码，包含数字、字母和标点符号</span></td>
				</tr>
				<tr>
					<td class="table-text">确认密码:</td>
					<td class="table-text-right">
						<input name="pwdrepeat" id="pwdrepeat" type="password" onBlur="return checkForm()" />
						<span id="tips_pwdrepeat"></span></td>
					<!--  <td>两次密码不一致</td>  -->
				</tr>
				<tr>
					<td><input id="table-submit" type="submit" name="submit" value="提交" /></td>
					<td><input id="table-reset" type="reset" name="reset" value="重置" /></td>
				</tr>
			</table>
		</form>
		<button id="button">校验密码</button>
		<br>
		<a href="Login.jsp"><button id="button">已有账号?</button></a>
	</div>

</body>
</html>