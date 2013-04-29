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
    <title>Aurora博客 - 博文</title>
  </head>
  <link href="CSS/style.css" rel="stylesheet"/>
  <script src="JS/check.js" language="javascript">
</script>  
 <body>
<table width="757"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="right" valign="top">
    <td height="149" colspan="2" background="images/head.jpg">
	  <table width="100%" height="149"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="51" align="right">
		  <br>
		  <table width="262" border="0" cellspacing="0" cellpadding="0">
            <tr align="left">
              <td width="26" height="20"><a href="index.php"></a></td>
              <td width="71" class="word_white"><a href="index.jsp"><span style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">首  页</span></a></td>
              <td width="87"><a href="file.jsp"><span  style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">我的博客</span></a></td>
              <td width="55"><a href="#">
              <span style="FONT-SIZE: 9pt; COLOR: #000000; TEXT-DECORATION: none">
              <a href="logout.jsp"><font color="#ffffff">安全退出</font></a>
              </span></a></td>
              <td width="23">&nbsp;</td>
            </tr>
          </table>
		  <br></td>
        </tr>
        <tr>
          <td height="66" align="right">&nbsp;</td>
        </tr>
        <tr>
		<form name="form" method="post" action="LogServlet">
          <td height="20" valign="baseline">
            <table width="100%"  border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td width="32%" height="20" align="center" valign="baseline">&nbsp; </td>
                <td width="67%" align="left" valign="baseline" style=" text-indent:10px;">
				<%if(username != null){%>                
                	欢迎您：<font color="red"><%=username %></font>
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                	 当前时间：
                	<span id="showTime">				
                	<script language="JavaScript">
					var d=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
					var date = new Date();
					var showTime = document.getElementById("showTime");
					showTime.innerHTML=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日"+" "+d[date.getDay()];
					</script> 
					</span>               	
                <%}else{ %>
				用户名:<input  name=txt_user size="10">
				密&nbsp;&nbsp;码:<input  name=txt_pwd type=password style="FONT-SIZE: 9pt; WIDTH: 65px" size="6"> &nbsp;
				<input style="FONT-SIZE: 9pt"  type=submit value=登录 name=sub_dl onClick="return f_check(form)">&nbsp; 
				&nbsp;&nbsp;当前时间：<font color="red"><%=System.currentTimeMillis() %></font>
				<%} %>
				</td>
                <td width="1%" align="center" valign="baseline">&nbsp;</td>
              </tr>
            </table> 
			</td>
		  </form>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td width="236" height="501" background=" images/left.jpg">
		<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td height="145" align="center" valign="bottom" style="background-repeat:no-repeat">Aurora<br><br><img src="images/logo.jpg"></td>
		  </tr>
		  <tr>
			<td height="125" align="center" valign="top"><br>
	
			  <table width="200"  border="0" cellspacing="0" cellpadding="0">
				<tr>
				  <td>
				  <table width="201"  border="0" cellspacing="0" cellpadding="0" valign="top" style="margin-top:5px;">
					<tr>
					  <td width="201" align="left" valign="top">
					  <%
					  	Connection conn=null;
					  	ResultSet rs=null;
					  	PreparedStatement pstmt=null;
						try {
						conn = Conn.getConnection();
						String sql = "select * from article order by id desc limit 1,6";
						pstmt= conn.prepareStatement(sql);
						rs= pstmt.executeQuery();
						while(rs.next()){
							String title = rs.getString(4);
						%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=title %><br>
						<%
						}
						} catch (SQLException e) {
						e.printStackTrace();
						}finally{
							//rs.close();
							//pstmt.close();
						}
							//rs.close();
							//pstmt.close();
					    	//conn.close();
						
					   %>				
					&nbsp;&nbsp;&nbsp;<a href="#" target="_blank"></a>
					  </td>
					</tr>
					<tr>
					  <td height="10" align="right"><a href="file_more.jsp"><img src=" images/more.gif" width="27" height="9" border="0">&nbsp;&nbsp;&nbsp;</a></td>
					</tr>
				  </table>
				  </td>
				</tr>
			</table></td></tr>
		  <tr>
			<td height="201" align="center" valign="top">          <br>
			  <table width="145"  border="0" cellspacing="0" cellpadding="0">
			  <tr>
				<td><table width="201"  border="0" cellspacing="0" cellpadding="0" valign="top" style="margin-top:10px;">
					<tr>
					  <td width="9" rowspan="2"  align="center">&nbsp;</td>
					  <td width="147"  align="center"><a href="#" target="_blank"><img src="#"></a>  
					  </td>
					  <td width="10" rowspan="2"  align="center">&nbsp;</td>
					</tr>
					<tr>
					  <td  align="center">图片：</td>
					</tr>
			  		<tr>
					  <td colspan="3" height="10" align="right"><a href="#"><img src=" images/more.gif" width="27" height="9" border="0">&nbsp;&nbsp;&nbsp;</a></td>
					</tr>
				</table></td>
			  </tr>
			</table>        </td>
		  </tr>
		</table>
	</td>
    <td width="521" height="501" align="center" background="images/flist.jpg">
		<table width="100%" height="98%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="372" align="center">
		<!-- 文章列表-->
		<table width="90%" height="100%"  border="0" cellpadding="0" cellspacing="0" style="margin-top:25px;">
          <tr>
            <td height="130" align="center" valign="top">
			<table width="80%" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF">
                <tr align="left" colspan="2" >
                  <td height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="tableBorder_LTR"> 查看全部博客文章 </span> </td>
                </tr>
                <tr>
                  <td height="31" align="left" valign="middle" ><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left" valign="middle">
                      <table border="0" cellspacing="0" cellpadding="0" valign="top">
                          <tr>
                            <td align="left" valign="middle"> 
                         <%
                        try {
						conn = Conn.getConnection();
						String sql = "select * from article order by id desc limit 1,20";
						pstmt= conn.prepareStatement(sql);
						rs= pstmt.executeQuery();
						while(rs.next()){
							String title = rs.getString(4);
							int id = rs.getInt(1);
							%>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="BrowArtServlet?id=<%=id %>"><%=title %></a><br>
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
                      </table></td>
                    </tr>
                  </table></td>
                </tr>
              </table>
              <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr bgcolor="#EFF7DE">
                  <td width="73%" align="left" valign="middle">&nbsp;&nbsp;页次：<?php echo $page;?>/<?php echo $page_count;?>页
                    		记录：<?php echo $message_count;?> 条&nbsp; </td>
                  <td width="27%" align="right" class="hongse01">                 
                  </td>
                </tr>
              </table></td>
          </tr>
        </table>
		<!----------------------------->
		
		</td>
      </tr>
      <tr>
        <td height="66">&nbsp;</td>
      </tr>
    </table>
	</td>
  </tr>
</table>
<table bgcolor="#ffcc66" height="50px" width="755px" align="center">
<tr><td align="center">Aurora博客</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table>
</body>
</html>
