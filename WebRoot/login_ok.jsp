<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String username = (String) session.getAttribute("usersession");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurota博客 - 登录成功</title>   
  </head>
 <script type="text/javascript">     
function countDown(secs,surl){     
 //alert(surl);     
 var jumpTo = document.getElementById('jumpTo');
 jumpTo.innerHTML=secs;  
 if(--secs>0){     
     setTimeout("countDown("+secs+",'"+surl+"')",1000);     
     }     
 else{       
     location.href=surl;     
     }     
 }     
</script>  
  <body bgcolor="#ccc">
  	<h3 align="center"><font color="red"><%=username %></font>登录成功<br></h3>
  	<h3 align="center"><span id="jumpTo">5</span>秒后自动跳转到首页</h3>
	<script type="text/javascript">countDown(5,'index.jsp');</script> 
	<h3 align="center">如果没有跳转，请点<a href="index.jsp">这里</a></h3>
  </body>
</html>
