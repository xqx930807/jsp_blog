<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.aurora.blog.dao.Conn" %>
<%@ page import="org.aurora.blog.dto.*" %>

<%
String username = (String) session.getAttribute("usersession");
Article article = (Article)request.getAttribute("article");
ArrayList<Com> list = (ArrayList<Com>)request.getAttribute("list_com");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>Aurora博客 - 浏览博客文章及评论</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
		<link href="CSS/style.css"  rel="stylesheet">
<script language="javascript">
function r_check(){
if (document.myform.txt_content.value==""){
	alert("评论内容不能为空!");myform.txt_content.focus();return false;
}
}
function d_chk(urlstr){
	if(confirm("确定要删除选中的项目吗？一旦删除将不能恢复！")){
		return true;
	}
	else
		return false;   
}
function fri_chk(){
if(confirm("确定要删除选中的项目吗？一旦删除将不能恢复！")){
		return true;
	}
	else
		return false;   
}
</script>
	</head>
	<body style="MARGIN-TOP: 0px; VERTICAL-ALIGN: top; PADDING-TOP: 0px; TEXT-ALIGN: center"> 
<TABLE width="757" cellPadding=0 cellSpacing=0 style="WIDTH: 755px" align="center"> 
  <TBODY> 
    <TR> 
      <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3>
	  <table width="100%" height="149"  border="0" cellpadding="0" cellspacing="0" background="images/F_head.jpg">
        <tr>
          <td height="51" align="right">
		  <br>
		  <table width="262" border="0" cellspacing="0" cellpadding="0">
            <tr align="left">
              <td width="26" height="20"><a href="index.php"></a></td>
              <td width="71" class="word_white"><a href="index.jsp"><span style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">首  页</span></a></td>
              <td width="87"><a href="file.jsp"><span  style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">我的博客</span></a></td>
              <td width="55"><a href="#">
              <span style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">
              <%if(username == null){ %>
              	博客注册 <%}else{ %> <a href="logout.jsp"><font color="#ffffff">安全退出</font></a><%} %>
              	</span></a></td>
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
                <td height="20" align="left" valign="baseline" style=" text-indent:50px;"> 
                <%if(username == null){ %>
				用户名: <input  name=txt_user size="10">
				密&nbsp;&nbsp;码:<input  name=txt_pwd type=password style="FONT-SIZE: 9pt; WIDTH: 65px" size="6">
				<input type="hidden" name="txt_hyan" id="txt_hyan" value="pic">
				<input style="FONT-SIZE: 9pt"  type=submit value=登录 name=sub_dl onClick="return f_check(form)">&nbsp; 
				<font color="red">登录用户名</font>&nbsp;&nbsp;当前时间：<font color="red">
				<span id="showTime">
				<script language="JavaScript">
					var d=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
					var date = new Date();
					var showTime = document.getElementById("showTime");
					showTime.innerHTML=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日"+" "+d[date.getDay()];
				</script> 
				</span>
				</font>
				<%}else{ %>
				欢迎：<font color="red"><%=username %></font>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span id="showTime">
				<script language="JavaScript">
					var d=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
					var date = new Date();
					var showTime = document.getElementById("showTime");
					showTime.innerHTML=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日"+" "+d[date.getDay()];
				</script> 
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
	</TD> 
    </TR> 
    <TR> 
      <TD colSpan=3 valign="baseline" style="BACKGROUND-IMAGE: url( images/bg.jpg); VERTICAL-ALIGN: middle; HEIGHT: 450px; TEXT-ALIGN: center"><br> 
        <br> 
        <table width="600" height="100%"  border="0" cellpadding="0" cellspacing="0" align="center"> 
          <tr> 
            <td height="130" align="center" valign="middle">
            <table width="560" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF"> 
                <tr align="left" colspan="2" > 
                  <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE">&nbsp;<span class="tableBorder_LTR"> 博客文章</span> </td> 
                </tr> 
                <td align="center" valign="top" ><table width="480" border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td> 
                          <table width="100%"  border="0" cellpadding="1" cellspacing="1" bordercolor="#D6E7A5" bgcolor="#FFFFFF" class="i_table"> 
                            <tr bgcolor="#FFFFFF"> 
                              <td width="14%" align="center">博客ID号</td> 
                              <td width="15%"><%=article.getId() %></td> 
                              <td width="11%" align="center">作者</td> 
                              <td width="18%"><%=article.getUsername() %></td> 
                              <td width="12%" align="center">发表时间</td> 
                              <td width="30%">2012-7-11</td> 
                            </tr> 
                            <tr bgcolor="#FFFFFF"> 
                              <td align="center">博客主题</td> 
                              <td colspan="5">&nbsp;&nbsp;<%=article.getTitle() %></td> 
                            </tr> 
                            <tr bgcolor="#FFFFFF"> 
                              <td align="center">文章内容</td> 
                              <td colspan="4"><%=article.getCons() %></td> 
                              <td>
                                 <a href="DelArtServlet?id=<%=article.getId() %>"><img src="images/A_delete.gif" width="52" height="16" alt="删除博客文章" onClick="return fri_chk();"></a> 
							  </td>
                            </tr> 
                          </table></td> 
                      </tr> 
                    </table></td> 
              </table></td> 
          </tr> 
          <tr> 
            <td height="106" align="center" valign="top">
             <%
					  	Connection conn=null;
					  	ResultSet rs=null;
					  	PreparedStatement pstmt=null;
						try {
						conn = Conn.getConnection();
						String sql = "select * from com  where title= '"+article.getTitle()+"' order by id desc";
						pstmt= conn.prepareStatement(sql);
						//pstmt.setString(1,article.getTitle());
						rs= pstmt.executeQuery();
						while(rs.next()){
							String title = rs.getString(4);
							int id = rs.getInt(1);
				%>
				<table width="560" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF"> 
                <tr align="left" colspan="2" > 
                  <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE">&nbsp;<span class="tableBorder_LTR"> 查看评论</span> </td> 
                </tr>              
                <tr> 
                  <td height="57" align="center" valign="top" ><table width="480"  border="0" cellpadding="1" cellspacing="1" bordercolor="#D6E7A5" bgcolor="#FFFFFF" class="i_table"> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="14%" align="center">评论ID号</td> 
                        <td width="15%"><%=rs.getInt(1) %></td> 
                        <td width="11%" align="center">评论人</td> 
                        <td width="18%"><%=rs.getString(2) %></td> 
                        <td width="12%" align="center">评论时间</td> 
                        <td width="30%"><%=rs.getString(3) %></td> 
                      </tr> 
                      <tr bgcolor="#FFFFFF"> 
                        <td align="center">评论内容</td> 
                        <td colspan="4"><%=rs.getString(4) %></td> 
                        <td>                       
                          <a href="DelComServlet?id=<%=rs.getInt(1) %>"><img src="images/A_delete.gif" width="52" height="16" alt="删除博客文章评论" onClick="return d_chk();"></a>						
						</td>
                      </tr> 
                    </table>
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
              
              <table width="560" border="0" align="center" cellpadding="0" cellspacing="0"> 
                <tr bgcolor="#EFF7DE"> 
                 </tr> 
              </table></td> 
          </tr>
          <tr>
            <td height="107" align="center" valign="top">
            
<!-- ---------------------------------------------------------------------------------------------------------------- -->
			<!--  发表评论  -->
			<form name="myform" method="post" action="AddComServlet">
 			<table width="560" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF">
                      <tr align="left" colspan="2" >
                        <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="right_head"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"></SPAN></span>
                        <span class="tableBorder_LTR"> 发表评论</span> </td>
                      </tr>
 				   <td height="112" align="center" valign="top" >
       			     <input name="htxt_fileid" type="hidden" value="#">
       			     <table width="500"  border="0" cellpadding="1" cellspacing="0" bordercolor="#D6E7A5" bgcolor="#FFFFFF">
				    <tr>
					  <td align="center">我要评论</td>
					  <td width="410">
					  <textarea name="txt_content" cols="66" rows="8" id="txt_content" ></textarea>
					  <input type="hidden" name="title" value="<%=article.getTitle() %>"> 
					  </td>
				    </tr>
				    <tr align="center">
					  <td colspan="2">
					  <input type="submit" name="submit" value="提交" onClick="return r_check();">&nbsp;
					   <input type="reset" name="submit2" value="重置"></td>
				    </tr>
				  </table>			    
				  </td>
              </table>
			  </form>
<!---------------------------------------------------------------------------------------------------------------------->			
		    </td>
          </tr> 
        </table>
        </TD> 
    </TR>  
  </TBODY> 
</TABLE> 
</body>
<table bgcolor="#ffcc66" height="50px" width="755px" align="center">
<tr><td align="center">Aurora博客</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table>
</html>

</html>
