<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurora���� - ������ѳɹ�</title>
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
  	<h3 align="center"><font color="red">������ѳɹ���</font><br></h3>
  	<h3 align="center"><span id="jumpTo">2</span>��󣬲鿴�ҵ�����</h3>
	<script type="text/javascript">countDown(2,'browse_fri.jsp');</script> 
	<h3 align="center">���û����ת�����<a href="browse_fri.jsp">����</a></h3>
  </body>
</html>
