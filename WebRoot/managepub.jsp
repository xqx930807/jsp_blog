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
<%
 if(!(username.equals("admin"))){
 %>
 <script language="javascript">
 alert("您无权查看该网页！点击确定返回主页……");
 window.location="index.jsp";
 </script> 
 <%
 }else{
  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurora博客 - 公告管理</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="CSS/style.css" rel="stylesheet">
  </head>
<script src=" JS/menu.JS"></script>
<script src=" JS/UBBCode.JS"></script>
<script language="javascript">
function check(){
	if(myform.txt_title.value==""){
		alert("公告主题名称不允许为空！");myform.txt_title.focus();return false;
	}
	if(myform.file.value==""){
		alert("公告内容不允许为空！");myform.file.focus();return false;
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
              </TABLE></TD> 
            </TR> 
          </TBODY> 
        </TABLE></TD> 
    </TR> 
    <TR> 
      <TD colSpan=3 valign="baseline" style="BACKGROUND-IMAGE: url( images/bg.jpg); VERTICAL-ALIGN: middle; HEIGHT: 450px; TEXT-ALIGN: center"><table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="451" align="center" valign="top"><table width="640"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="613" height="223" align="center"><br>
			  <table width="500" border="0" cellpadding="0" cellspacing="0">
			    <tr>
					<td valign="middle" align="center">
					<!--公告列表-->
				<table width="630" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF">
                <tr align="left" colspan="2" >
                  <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="tableBorder_LTR"> 查看全部公告 </span> </td>
                </tr>
                <tr>
                  <td height="31" align="center" valign="top" ><table width="500"  border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td>
                      <table width="498"  border="0" cellspacing="0" cellpadding="0" valign="top"> 
                      <%
							  	Connection conn=null;
							  	ResultSet rs=null;
							  	PreparedStatement pstmt=null;
								try {
								conn = Conn.getConnection();
								String sql = "select * from pub order by id desc";
								pstmt= conn.prepareStatement(sql);
								rs= pstmt.executeQuery();
								while(rs.next()){
									String title = rs.getString(2);
									int id = rs.getInt(1);
						%>                      
                          <tr>
                            <td width="200px" align="left" valign="middle"> &nbsp;&nbsp;&nbsp;<a href="#"></a> 		                      
								<a href="ShowPubServlet?id=<%=id %>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=title %></a><br>								
                            </td>
                            <td>
							<%=rs.getString(4) %>
							</td>
                            <td width="50px" align="left" valign="middle">
                              <a href="DelPubServlet?id=<%=rs.getInt(1) %>"><img src="images/A_delete.gif" width="52" height="16" alt="删除博客文章" onClick="return d_chk();"></a> 
							</td>								
                          </tr>
                       <%
						}
						} catch (SQLException e) {
						e.printStackTrace();
						}
						rs.close();
						pstmt.close();
					    conn.close();
						
					   %>	
                      </table>
                      </td>
                    </tr>
                  </table>
				</td>
                </tr>
              </table>
              <table width="630" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr bgcolor="#EFF7DE">
                  <td width="33%">&nbsp;&nbsp;页次：1/1页&nbsp;记录： 条&nbsp; </td>
                  <td width="67%" align="right" class="hongse01">
                  </td>
                </tr>
              </table>
					</td>
				</tr>
				<tr>
					<td height="20">&nbsp;</td>
				</tr>
                <tr>
                  <td>
				  <form  name="myform" method="post" action="AddPubServlet">
				  <table width="630" border="0" cellpadding="3" cellspacing="1" bordercolor="#D6E7A5">
                      <tr>
                        <td class="i_table" colspan="2"> <span class="tableBorder_LTR">添加系统公告</span></td>
                      </tr>
                      <tr>
                        <td valign="top" align="right" width="14%">公告主题：<br></td>
                        <td width="86%"><input name="txt_title" type="text" id="txt_title" size="68"></td>
                      </tr>
                      <tr>
                        <td align="right" width="14%">文字编辑：</td>
                        <td width="86%"><img src=" images/UBB/B.gif" width="21" height="20" onClick="bold()">&nbsp;<img src=" images/UBB/I.gif" width="21" height="20" onClick="italicize()">&nbsp;<img src=" images/UBB/U.gif" width="21" height="20" onClick="underline()">
						字体
                            <select name="font" class="wenbenkuang" id="font" onChange="showfont(this.options[this.selectedIndex].value)">
                              <option value="宋体" selected>宋体</option>
                              <option value="黑体">黑体</option>
                              <option value="隶书">隶书</option>
                              <option value="楷体">楷体</option>
                            </select>
						字号<span class="pt9">
					<select 
					      name=size class="wenbenkuang" onChange="showsize(this.options[this.selectedIndex].value)">
					  <option value=1>1</option>
					  <option value=2>2</option>
					  <option value=3 selected>3</option>
					  <option value=4>4</option>
					  <option value="5">5</option>
					  <option value="6">6</option>
					  <option value="7">7</option>
					</select>
						颜色
					<select onChange="showcolor(this.options[this.selectedIndex].value)" name="color" size="1" class="wenbenkuang" id="select">
					  <option selected>默认颜色</option>
					  <option style="color:#FF0000" value="#FF0000">红色热情</option>
					  <option style="color:#0000FF" value="#0000ff">蓝色开朗</option>
					  <option style="color:#ff00ff" value="#ff00ff">桃色浪漫</option>
					  <option style="color:#009900" value="#009900">绿色青春</option>
					  <option style="color:#009999" value="#009999">青色清爽</option>
					  <option style="color:#990099" value="#990099">紫色拘谨</option>
					  <option style="color:#990000" value="#990000">暗夜兴奋</option>
					  <option style="color:#000099" value="#000099">深蓝忧郁</option>
					  <option style="color:#999900" value="#999900">卡其制服</option>
					  <option style="color:#ff9900" value="#ff9900">镏金岁月</option>
					  <option style="color:#0099ff" value="#0099ff">湖波荡漾</option>
					  <option style="color:#9900ff" value="#9900ff">发亮蓝紫</option>
					  <option style="color:#ff0099" value="#ff0099">爱的暗示</option>
					  <option style="color:#006600" value="#006600">墨绿深沉</option>
					  <option style="color:#999999" value="#999999">烟雨蒙蒙</option>
					</select>
					</span></td>
                      </tr>
                      <tr>
                        <td align="right" width="14%">公告内容：</td>
                        <td width="86%">
						   <div class="file">						  
						     <textarea name="file" cols="75" rows="20" id="file" style="border:0px;width:520px;"></textarea>
						   </div> 
						</td>
                      </tr>
                      <tr align="center">
                        <td colspan="2"><input name="btn_tj" type="submit" id="btn_tj" value="提交" onClick="return check();">                          &nbsp;
                          <input name="btn_cx" type="reset" id="btn_cx" value="重写"></td>
                        </tr>
                  </table>
				  </form>
				  </td>
                </tr>
              </table></td>
          </tr>
          </table>  </td>
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
<%}%>