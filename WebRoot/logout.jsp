<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>Aurora���� - �˳�ϵͳ</title>
  </head>  
  <body bgcolor="#ccc">
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
  <%session.invalidate(); %>
  <h3 align="center">���Ѿ��ɹ���ϵͳ</h3>
  <h3 align="center"><span id="jumpTo"><font color="red">5 </font></span>����Զ���ת����ҳ</h3>
	<script type="text/javascript">countDown(5,'index.jsp');</script> 
	<h3 align="center">���û����ת�����<a href="index.jsp">����</a></h3>
  </body>
</html>
