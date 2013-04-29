<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String username = (String) session.getAttribute("usersession");
 %>
 <%if(username != null){ %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   
    <title>Aurora博客-发表博文</title>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="CSS/style.css" rel="stylesheet">
  </head>
<script src=" JS/menu.JS"></script>
<script src=" JS/UBBCode.JS"></script>
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
    <TR> <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3> 
    <TABLE style="BACKGROUND-IMAGE: url( images/F_head.jpg); WIDTH: 760px; HEIGHT: 154px" cellSpacing=0 cellPadding=0>
     <TBODY> 
            <TR> 
              <TD height="110" colspan="6" style="VERTICAL-ALIGN: text-top; WIDTH: 80px; HEIGHT: 115px; TEXT-ALIGN: right"></TD> 
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
      <TD colSpan=3 valign="baseline" style="BACKGROUND-IMAGE: url( images/bg.jpg); VERTICAL-ALIGN: middle; HEIGHT: 450px; TEXT-ALIGN: center">
      <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="451" align="center" valign="top"><table width="640"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="613" height="223" align="center"><br>
			  <table width="500" border="0" cellpadding="0" cellspacing="0">
                <tr>
                  <td>
                  
				  
                  <!-- 添加博文框 -->
				  <form  name="myform" method="post" action="AddArticleServlet">
				  <table width="630" border="0" cellpadding="3" cellspacing="1" bordercolor="#D6E7A5">
                      <tr>
                        <td class="i_table" colspan="2"> <span class="tableBorder_LTR">添加博客文章</span></td>
                      </tr>
                      <tr>
                        <td valign="top" align="right" width="14%">博客主题：<br></td>
                        <td width="86%"><input name="txt_title" type="text" id="txt_title" size="68"></td>
                      </tr>
                      <tr>
                        <td align="right" width="14%">编辑：</td>
                        <td width="86%"><img src=" images/UBB/B.gif" width="21" height="20" onClick="bold()">&nbsp;<img src=" images/UBB/I.gif" width="21" height="20" onClick="italicize()">&nbsp;<img src=" images/UBB/U.gif" width="21" height="20" onClick="underline()">
						字体
                        <select name="font" class="wenbenkuang" id="font" onChange="showfont(this.options[this.selectedIndex].value)">
                           <option value="宋体" selected>宋体</option>
                           <option value="黑体">黑体</option>
                           <option value="隶书">隶书</option>
                           <option value="楷体">楷体</option>
                         </select>
                                                               字号<span class="pt9">
						<select name=size class="wenbenkuang" onChange="showsize(this.options[this.selectedIndex].value)">
						  <option value=1>1</option>
						  <option value=2>2</option>
						  <option 
						        value=3 selected>3</option>
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
                        <td align="right" width="14%">文章内容：</td>
                        <td width="86%">
						   <div class="file">						  
						     <textarea name="file" cols="75" rows="20" id="file" style="border:0px;width:520px;"></textarea>
						   </div> 
						</td>
                      </tr>
                      <tr align="center">
                        <td colspan="2"><input name="btn_tj" type="submit" id="btn_tj" value="提交" onClick="return check();">  &nbsp;
                          <input name="btn_cx" type="reset" id="btn_cx" value="重写"></td>
                        </tr>
                  </table>
				  </form>
				  
				  
				  </td>
                </tr>
              </table></td>
          </tr>
          </table>            </td>
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
<%} else {%>
<script language="javascript">
alert("请先登录！");
window.location="index.jsp";
</script>
<%} %>
