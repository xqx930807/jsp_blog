<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.aurora.blog.dao.*" %>
<%@ page import="org.aurora.blog.dto.*" %>
<%
	String username = (String) session.getAttribute("usersession");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>    
    <title>Aurora博客 - 浏览朋友</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
  </head>
 <script src=" JS/menu.JS"></script>
<script language="javascript">
function fri_chk(){
if(confirm("确定要删除选中的朋友吗？一旦删除将不能恢复！")){
	return true;
}else
	return false;   
}

</script> 
 <body> 
<div class=menuskin id=popmenu 
      onmouseover="clearhidemenu();highlightmenu(event,'on')" 
      onmouseout="highlightmenu(event,'off');dynamichide(event)"
	  style="Z-index:100;position:absolute;"> </div> 
<TABLE width="757" cellPadding="0" cellSpacing=0 style="WIDTH: 755px" align="center"> 
  <TBODY> 
    <TR> <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3> 
    <TABLE style="BACKGROUND-IMAGE: url( images/F_head.jpg); WIDTH: 760px; HEIGHT: 154px" cellSpacing=0 cellPadding=0> <TBODY> 
            <TR> 
              <TD height="110" colspan="6" 
          style="VERTICAL-ALIGN: text-top; WIDTH: 80px; HEIGHT: 115px; TEXT-ALIGN: right"></TD> 
            </TR> 
            <TR> 
              <TD height="29" align="center" valign="middle"> <TABLE style="WIDTH: 580px" VERTICAL-ALIGN: text-top; cellSpacing=0 cellPadding=0 align="center"> 
                  <TBODY> 
                    <TR align="center" valign="middle"> 
                      <TD style="WIDTH: 100px; COLOR: red;">欢迎您:&nbsp;<%=username %>&nbsp;&nbsp;</TD> 
                      <TD style="WIDTH: 80px; COLOR: red;"><a href="index.jsp">博客首页</a></TD> 
                      <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,productmenu) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >文章管理</a></TD> 
                      <TD style="WIDTH: 90px; COLOR: red;"><a  onmouseover=showmenu(event,myfriend) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >朋友圈管理</a> </TD>
                       <TD style="WIDTH: 90px; COLOR: red;"><a  href="ToUpdateServlet">修改个人信息</a> </TD>
					   <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,myuser) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >管理员管理</a></TD>
					  <TD style="WIDTH: 80px; COLOR: red;"><a href="logout.jsp">退出登录</a></TD> 
                    </TR> 
                  </TBODY> 
                </TABLE></TD> 
            </TR> 
          </TBODY> 
        </TABLE></TD> 
    </TR> 
    <TR> 
      <TD colSpan=3 valign="baseline" style="BACKGROUND-IMAGE: url( images/bg.jpg); VERTICAL-ALIGN: middle; HEIGHT: 450px; TEXT-ALIGN: center"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0"> 
          <tr> 
            <td height="451" align="center" valign="top"><br> 
              <table width="640"  border="0" cellpadding="0" cellspacing="0"> 
                <tr> 
                  <td width="613" height="16" align="right" valign="top">&nbsp;</td> 
                  <br> <!--<?php if ($page=="") {$page=1;}; ?>   -->
                </tr> 
                <tr> 
                  <td height="292" align="center" valign="top" bordercolor="#D6E7A5"> 
                    <table width="600" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF"> 
                      <tr align="left" colspan="2" > 
                        <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE">  <span class="i_table"><span class="tableBorder_LTR"> 浏览我的朋友</span></span> </td> 
                      </tr> 
					  <tr>
                      <td height="140" align="center" valign="top" >
                       <%
					  	Connection conn=null;
					  	ResultSet rs=null;
					  	PreparedStatement pstmt=null;
						try {
						conn = Conn.getConnection();
						String sql = "select * from friends where username='"+username+"' order by id desc";
						pstmt= conn.prepareStatement(sql);
						rs= pstmt.executeQuery();
						while(rs.next()){
							int id = rs.getInt(1);
						%>
						<table width="500" border="0" align=center cellpadding=3 cellspacing=2 bordercolor="#FFFFFF" bgcolor="#FFFFFF" class=i_table> 
                            <tr bgcolor="#FFFFFF"> 
                              <td width=13% align="center" valign=middle> 编号</td> 
                              <td width=8% align="left"><%=id %></td> 
                              <td width=10% align="center">姓名</td> 
                              <td width=13% align="left"><%=rs.getString(2) %></td> 
                              <td width=13% align="center"><span class="f_one">性 别</span><%=rs.getString(3) %></td> 
                              <td width=9% align="left">
                              </td> 
                              <td width=15% align="center">生日</td> 
                              <td width=19% align="left"><%=rs.getString(4) %></td> 
                            </tr> 
                            <tr bgcolor="#FFFFFF"> 
                              <td width=13% align="center" valign=middle>所在城市</td> 
                              <td colspan="3" align="left"><%=rs.getString(5) %></td> 
                              <td align="center">家庭住址</td> 
                              <td colspan="3" align="left"><%=rs.getString(6) %></td> 
                            </tr> 
                            <tr bgcolor="#FFFFFF"> 
                              <td align="center">e-mail</td> 
                              <td colspan="7" align="left"><%=rs.getString(7) %></td> 
                            </tr> 
                            <tr bgcolor="#FFFFFF"> 
                              <td align="center" valign=middle>手机号码</td> 
                              <td colspan="3" align="left"><%=rs.getString(8) %></td> 
                              <td align="center">QQ号</td> 
                              <td colspan="2" align="left"><%=rs.getString(9) %></td> 
                              <td align="left">
                              <a href="DelFriendServlet?id=<%=rs.getInt(1) %>"><img src="images/A_delete.gif" width="52" height="16" alt="删除朋友信息" onClick="return fri_chk();"></a>
							  </td>
                            </tr> 
                       </table> 
						<%
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
                    </table> 
                    <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr bgcolor="#EFF7DE">
                     </tr>
                    </table></td> 
                </tr> 
              </table> 
              <br></td> 
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

