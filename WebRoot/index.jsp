<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.aurora.blog.dao.*" %>
<%@ page import="org.aurora.blog.dto.*" %>
<%
	//Dept dept = (Dept)request.getAttribute("dept");//ǿ������ת��
	String username = (String) session.getAttribute("usersession");	
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>Aurora���� - ��ҳ</title>
<link href="CSS/style.css" rel="stylesheet"/>
</head>
<script src="JS/check.js" language="javascript">
</script>
<body onselectstart="return false">
<table width="757"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="right" valign="top">
    <td height="149" colspan="2" background="images/head.jpg">
	  <table width="100%" height="149"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="51" align="right">
		  <br>
		  <table width="262" border="0" cellspacing="0" cellpadding="0">
            <tr align="left">
              <td width="26" height="20"><a href="index.jsp"></a></td>
              <td width="71" class="word_white"><a href="index.jsp"><span style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">��  ҳ</span></a></td>
              <td width="87"><a href="file.jsp"><span  style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">�ҵĲ���</span></a></td>
              <td width="55">
              <span style="FONT-SIZE: 9pt; color:#ffffff; TEXT-DECORATION: none">
              <%if(username != null){ %>
				<a href="logout.jsp"><font color="#ffffff">��ȫ�˳�</font></a>
              <%}else{ %>
              	<a href="RegPro.jsp"><font color="#ffffff">����ע��</font></a> 
              <%} %>
              </span>
              </td>
              <td width="23">&nbsp;</td>
            </tr>
          </table>
		  <br></td>
        </tr>
        <tr>
          <td height="66" align="right"><p>&nbsp;</p></td>
        </tr>
        <tr>
		<form name="form" method="post" action="LogServlet">
          <td height="20" valign="baseline">
            <table width="100%"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="32%" height="20" align="center" valign="baseline">&nbsp; </td>                              	
                <td width="67%" align="left" valign="baseline" style="text-indent:10px;">
                <%if(username != null){%>                
                	��ӭ����<font color="red"><%=username %></font>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	��ǰʱ�䣺
                	<span id="showTime">				
                	<script language="JavaScript">
					var d=new Array("������","����һ","���ڶ�","������","������","������","������");
					var date = new Date();
					var showTime = document.getElementById("showTime");
					showTime.innerHTML=date.getFullYear()+"��"+(date.getMonth()+1)+"��"+date.getDate()+"��"+" "+d[date.getDay()];
					</script> 
					</span>
                	
                <%}else{ %>
				�û���:<input  name="txt_user" size="10" placeholder="�û���">
				��&nbsp;&nbsp;��:<input  name="txt_pwd" type="password" style="FONT-SIZE: 9pt; WIDTH: 65px" size="6" placeholder="����"> &nbsp;
				<input style="FONT-SIZE: 9pt"  type=submit value=��¼ name=sub_dl onClick="return f_check(form)">&nbsp; 
				&nbsp;&nbsp;��ǰʱ�䣺<span id="showTime">
				<font color="red">
				<script language="JavaScript">
					var d=new Array("������","����һ","���ڶ�","������","������","������","������");
					var date = new Date();
					var showTime = document.getElementById("showTime");
					showTime.innerHTML=date.getFullYear()+"��"+(date.getMonth()+1)+"��"+date.getDate()+"��"+" "+d[date.getDay()];
				</script> 
				</font>
				</span>
				<%} %>
				</td>
				
                <td width="1%" align="center" valign="baseline">&nbsp;</td>
              </tr>
            </table> 
			</td>
		 </form>
        </tr>
      </table>
	 </td>
  </tr>
  <tr>
  
  <!-- �󲿵����� -->
    <td width="236" height="501" background=" images/left.jpg">
		<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td height="145" align="center" valign="bottom" style="background-repeat:no-repeat">Aurora<br><br><img src="images/logo.jpg"></td>
		  </tr>
		  <tr>
			<td height="125" align="center" valign="top"><br>
	
			  <table width="200"  border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td><table width="201"  border="0" cellspacing="0" cellpadding="0" valign="top" style="margin-top:5px;">
					<tr>
					  <td width="201" align="left" valign="top">&nbsp;&nbsp;&nbsp;
					  <%
					  	Connection conn=null;
					  	ResultSet rs1 = null;
					  	ResultSet rs2 = null;
					  	PreparedStatement pstmt1 = null;
					  	PreparedStatement pstmt2 = null;	
						try {
						conn = Conn.getConnection();
						String sql1 = "select * from article order by id desc limit 1,6";
						String sql2 = "select * from pub order by id desc";
						pstmt1 = conn.prepareStatement(sql1);
						pstmt2 = conn.prepareStatement(sql2);
						rs1 = pstmt1.executeQuery();
						rs2 = pstmt2.executeQuery();
						while(rs1.next()){
							String title = rs1.getString(4);
							int id = rs1.getInt(1);
						%>
						<a href="BrowArtServlet?id=<%=id %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=title %></a><br>
						<%
						}
						%>				 					  
					  <a href="article.jsp?file_id=#" target="_blank"></a>
					  </td>
					</tr>
					<tr>
					  <td height="10" align="right"><a href="file_more.jsp"><img src=" images/more.gif" width="27" height="9" border="0">&nbsp;&nbsp;&nbsp;</a></td>
					</tr>
				  </table></td>
				</tr>
			</table></td></tr>
		  <tr>
			<td height="201" align="center" valign="top"><br>
			  <table width="145"  border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td><table width="201"  border="0" cellspacing="0" cellpadding="0" valign="top" style="margin-top:5px;">
					<tr>
					  <td width="9" rowspan="2"  align="center">&nbsp;</td>
					  <td width="147"  align="center">
					  <div><img src="images/image.jpg"  width="120" height="80" border="0"></div>                                                      
					  </td>
					  <td width="10" rowspan="2"  align="center">&nbsp;</td>
					</tr>
					<tr>
					  <td align="center">ͼƬչʾ</td>
					</tr>
			  		<tr>
					  <td colspan="3" height="10" align="right">
					  <a href="#"><img src=" images/more.gif" width="27" height="9" border="0">&nbsp;&nbsp;&nbsp;</a>
					  </td>
					</tr>
				</table></td>
			  </tr>
			</table>        
			</td>
		  </tr>
		</table>
	</td>	
	<!-- ��ҳ�ұ� ���¹��� -->
    <td width="521" height="500" align="center" background="images/right.jpg">
		<table width="100%" height="98%"  border="0" cellpadding="0" cellspacing="0">
      <tr >
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="450" align="center">
        <table style="width: 252px" cellspacing=0 cellpadding=0>
          <tbody>
            <tr>
              <td style="WIDTH: 429px; HEIGHT: 280px" colspan=3 rowspan=2>
				<marquee onMouseOver=this.stop()
                  style="WIDTH: 426px; HEIGHT: 280px" onMouseOut=this.start() 
                  scrollamount=2 scrolldelay=7 direction=up>
                <span style="FONT-SIZE: 9pt">
                <center>
                <%while(rs2.next()){
                %>
                <a href="BrowsePubServlet?id=<%=rs2.getString(1) %>"><%=rs2.getString(2) %></a><br>	
                <%
                }
                 %>
                  	<%
						} catch (SQLException e) {
						e.printStackTrace();
						}
						rs1.close();
						pstmt1.close();
					    conn.close();						
					   %>	
				</center>
                </span>
              </marquee>
              </td>
            </tr>
            <tr></tr>
          </tbody>
        </table>
        <td></td>
      </tr>
      <tr>
        <td height="10">&nbsp;<hr></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
<table bgcolor="#ffcc66" height="50px" width="755px" align="center">
<tr><td align="center">Aurora����</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table>
</body>
</html>
