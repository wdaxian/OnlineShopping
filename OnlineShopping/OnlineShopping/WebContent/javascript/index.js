function checkForm()
{
	//使用document.getElementById()获取Id为username的输入域的值，判断其长度是否合法
	if(document.getElementById("username").value.length<3){
		//设置id为tips_username的<span>的HTML，显示错误信息
		document.getElementById("tips_username").innerHTML
		="<em style='color:#FF0000'>用户名不能少于3个字符组成</em>";
		
		document.getElementsByName("username").focus();
		
		return false;
	}
	else{
		document.getElementById("tips_username").innerHTML
		="<em style='color:#33FF33'>OK!</em>";
	}
	
	//正则表达式，由字母、数字和下划线组成
	var reg=/[^A-Za-z0-9_]+/;
	var regs=/^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
	
	//判断密码长度是否符合规则
	if(document.getElementById("password").value.length<8||
		document.getElementById("password").value.length>12||
		regs.test(document.getElementById("password").value)){
			document.getElementById("tips_password").innerHTML
			="<em style='color:#FF0000'>密码由8-12位字符组成,且必须包含字母、数字和标点符号</em>";
			
			document.getElementById("password").focus();
			
			return false;
	}
	else{
		document.getElementById("tips_password").innerHTML
		="<em style='color:#33FF33'>OK!</em>"
	}
	
	//校验两次密码输入是否一致
	if(document.getElementById("pwdrepeat").value
		!=document.getElementById("password").value){
			document.getElementById("tips_pwdrepeat").innerHTML
			="<em style='color:#FF0000'>两次输入的密码不一致</em>";
			
			document.getElementById("pwdrepeat").focus();
			
			return false;
	}
	else{
		document.getElementById("tips_pwdrepeat").innerHTML
		="<em style='color:#33FF33'>OK!</em>";
	}
	
	
}




















