<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.aurora.blog.dao.Conn" %>
<%@ page import="org.aurora.blog.dto.Article" %>
<%
	String username = (String) session.getAttribute("usersession");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurora博客 - 我的博文</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  </head> 
  <link href="CSS/style.css" rel="stylesheet">
  <style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style> 
<script src="JS/menu.JS"></script>
<script src="JS/UBBCode.JS"></script>
<script language="javascript">
function check(){
	if(myform.txt_title.value==""){
		alert("博客主题名称不允许为空！");myform.txt_title.focus();return false;
	}
	if(myform.file.value==""){
		alert("文章内容不允许为空！");myform.file.focus();return false;
	}
}
</script>
 <body >
<div class=menuskin id=popmenu 
      onmouseover="clearhidemenu();highlightmenu(event,'on')" 
      onmouseout="highlightmenu(event,'off');dynamichide(event)"
	  style="Z-index:100;position:absolute;">
</div>
<TABLE width="757" cellPadding=0 cellSpacing=0 style="WIDTH: 755px" align="center"> 
  <TBODY> 
    <TR> <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3> <TABLE 
      style="BACKGROUND-IMAGE: url( images/F_head.jpg); WIDTH: 760px; HEIGHT: 154px" 
      cellSpacing=0 cellPadding=0> <TBODY> 
            <TR> 
              <TD height="110" colspan="6" 
          style="VERTICAL-ALIGN: text-top; WIDTH: 80px; HEIGHT: 115px; TEXT-ALIGN: right"></TD> 
            </TR> 
            <TR> 
              <TD height="34" align="center" valign="middle">
			  <TABLE style="WIDTH: 580px" VERTICAL-ALIGN: text-top; cellSpacing=0 cellPadding=0 align="center">
                  <TBODY>
                    <TR align="center" valign="middle">
					 <TD style="WIDTH: 100px; COLOR: red;">欢迎您:&nbsp;<%=username %>&nbsp;&nbsp;</TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"> </SPAN><a href="index.jsp">博客首页</a></TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,productmenu) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >文章管理</a></TD>
                      <TD style="WIDTH: 90px; COLOR: red;"><a  onmouseover=showmenu(event,myfriend) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >朋友圈管理</a>  </TD>
                      <TD style="WIDTH: 90px; COLOR: red;"><a  href="ToUpdateServlet">修改个人信息</a> </TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,myuser) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >管理员管理</a></TD> 
					  <TD style="WIDTH: 80px; COLOR: red;"><a href="logout.jsp">退出登录</a></TD>
                    </TR>
                  </TBODY>
              </TABLE>	
              </TD> 
            </TR> 
          </TBODY> 
        </TABLE></TD> 
    </TR> 
    <TR> 
      <TD colSpan=3 valign="baseline" style="BACKGROUND-IMAGE: url( images/bg.jpg); VERTICAL-ALIGN: middle; HEIGHT: 450px; TEXT-ALIGN: center"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="451" align="center" valign="top">
		  
		  <table width="600" height="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="130" align="center" valign="top">
			<table width="560" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF">
                <tr align="left" colspan="2" >
                  <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="tableBorder_LTR"> 查看我的文章 </span> </td>
                </tr>
                <tr>
                  <td height="31" align="center" valign="top" ><table width="500"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td><table width="498"  border="0" cellspacing="0" cellpadding="0" valign="top">
                          <tr>
                            <td width="498" align="left" valign="top"> &nbsp;&nbsp;&nbsp;
						<%
						int i=1;
					  	Connection conn=null;
					  	ResultSet rs=null;
					  	PreparedStatement pstmt=null;
						try {
						conn = Conn.getConnection();
						String sql = "select * from article where username='"+username+"' order by id desc ";
						pstmt= conn.prepareStatement(sql);
						rs= pstmt.executeQuery();
						while(rs.next()){
							String title = rs.getString(4);
							int id = rs.getInt(1);
						%>
						<a href="BrowArtServlet?id=<%=id %>"><%=i %>...............<%=title %></a><br>
						<%
						i = i+1;
						}
						} catch (SQLException e) {
						e.printStackTrace();
						}
						rs.close();
						pstmt.close();
					    conn.close();
						
					   %>			 
                            </td>
                          </tr>
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
              </table>
              <table width="560" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr bgcolor="#EFF7DE">
                </tr>
              </table></td>
          </tr>
        </table>
		  
		  </td>
    </tr>
</table></TD> 
    </TR> 
  </TBODY> 
</TABLE> 
<table bgcolor="#ffcc66" height="50px" width="760px" align="center">
<tr><td align="center">Aurora博客</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table>
</body>
</html>
