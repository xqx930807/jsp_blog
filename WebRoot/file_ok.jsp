<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head> 
  	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
    <title>Aurora���� - ����ɹ�</title>
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
  	<h3 align="center"><font color="red">����ɹ���</font><br></h3>
  	<h3 align="center"><span id="jumpTo">2</span>��󣬲鿴�ҵĲ���</h3>
	<script type="text/javascript">countDown(2,'myfiles.jsp');</script> 
	<h3 align="center">���û����ת�����<a href="myfiles.jsp">����</a></h3>
  </body>
</html>
