<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="org.aurora.blog.dao.*" %>
<%@ page import="org.aurora.blog.dto.*" %>
<%@ page import="org.aurora.blog.servlet.*" %>
<%
	String username = (String) session.getAttribute("usersession");
 %>
<%
	Friend friend = (Friend) request.getAttribute("friend");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurora���� - ��ѯ������Ϣs</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
<link href="CSS/style.css" rel="stylesheet">  
<div class=menuskin id=popmenu 
      onmouseover="clearhidemenu();highlightmenu(event,'on')" 
      onmouseout="highlightmenu(event,'off');dynamichide(event)"
	  style="Z-index:100;position:absolute;"></div>
<script src=" JS/menu.JS"></script>
<script language="javascript">
function check(form){
if (document.myform.sel_key.value==""){
	alert("�������ѯ����!");myform.sel_key.focus();return false;
}
}
function fri_chk(){
if(confirm("ȷ��Ҫɾ��ѡ�е�������һ��ɾ�������ָܻ���")){
	return true;
}else
	return false;   
}
</script>
<body> 
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
              <TD height="29" align="center" valign="middle"> <TABLE style="WIDTH: 580px" VERTICAL-ALIGN: text-top; cellSpacing=0 cellPadding=0 align="center"> 
                  <TBODY> 
                    <TR align="center" valign="middle"> 
                      <TD style="WIDTH: 100px; COLOR: red;">��ӭ��:&nbsp;<%=username %>&nbsp;&nbsp;</TD> 
                      <TD style="WIDTH: 80px; COLOR: red;"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"></SPAN> <a href="index.jsp">������ҳ</a></TD> 
                      <TD style="WIDTH: 80px; COLOR: red;"> <a  onmouseover=showmenu(event,productmenu) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >���¹���</a></TD> 
                      <TD style="WIDTH: 90px; COLOR: red;"> <a  onmouseover=showmenu(event,myfriend) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ȧ����</a> </TD>
                      <TD style="WIDTH: 90px; COLOR: red;"><a  href="ToUpdateServlet">�޸ĸ�����Ϣ</a> </TD>
					   <TD style="WIDTH: 80px; COLOR: red;"> <a  onmouseover=showmenu(event,myuser) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ա����</a></TD> 
					  <TD style="WIDTH: 80px; COLOR: red;"> <a href="logout.jsp">�˳���¼</a></TD> 
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
            <td height="451" align="center"><table width="600" height="360"  border="0" cellpadding="0" cellspacing="0"> 
                <tr> 
                  <td height="32" align="center" valign="middle"><table width="480" border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td> 
                        <form  name="myform" method="post" action="QueryFriServlet"> 
                            <table width="560" border="0" cellpadding="3" cellspacing="1" bordercolor="#D6E7A5"> 
                              <tr> 
                                <td width="100%" height="28" align="center" class="i_table">��ѯ������
                                  <select name="sel_tj" id="sel_tj"> 
                                    <option value="name" selected>����</option> 
                                    <option value="id">���</option> 
                                  </select> 
                                  	�ؼ���
                                  <input name="sel_key" type="text" id="sel_key" size="30"> &nbsp; 
                                  <input type="submit" name="Submit" value="����" onClick="return check();"></td> 
                              </tr> 
                            </table> 
                          </form></td> 
                      </tr> 
                    </table></td> 
                </tr> 
                <tr> 
                  <td height="325" align="center" valign="top">
                    <table width="560" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF"> 
                      <tr align="left" colspan="2" > 
                        <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="tableBorder_LTR"> ��ѯ���</span> </td> 
                      </tr> 
                      <td height="192" align="center" valign="top" >
                      <table width="480" border="0" cellpadding="0" cellspacing="0"> 
                            <tr> 
                              <td align="center"> 
                             <%if(friend == null){%>
                             	�Բ�������û�иú���
                             <% }else{%> 
                                <table width="500" border="0" align=center cellpadding=3 cellspacing=2 bordercolor="#FFFFFF" bgcolor="#FFFFFF" class=i_table> 
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width=13% align="center" valign=middle> ���</td> 
                                    <td width=8% align="left"><%=friend.getId() %></td> 
                                    <td width=10% align="center">����</td> 
                                    <td width=13% align="left"><%=friend.getName() %></td> 
                                    <td width=13% align="center"><span class="f_one">�Ա�</span></td> 
                                    <td width=9% align="left"><%=friend.getSex() %></td> 
                                    <td width=15% align="center">����</td> 
                                    <td width=19% align="left"><%=friend.getBir() %></td> 
                                  </tr> 
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width=13% align="center" valign=middle>���ڳ���</td> 
                                    <td colspan="3" align="left"><%=friend.getCity() %></td> 
                                    <td align="center">��ͥסַ</td> 
                                    <td colspan="3" align="left"><%=friend.getAddr() %></td> 
                                  </tr> 
                                  <tr bgcolor="#FFFFFF"> 
                                    <td align="center">e-mail</td> 
                                    <td colspan="7" align="left"><%=friend.getMail() %></td> 
                                  </tr> 
                                  <tr bgcolor="#FFFFFF"> 
                                    <td height="45" align="center" valign=middle>�ֻ�����</td> 
                                    <td colspan="3" align="left"><%=friend.getTel() %></td> 
                                    <td align="center">QQ��</td> 
                                    <td colspan="2" align="left"><%=friend.getQq() %></td> 
                                    <td align="center">
									<a href="DelFriendServlet?id=<%=friend.getId() %>"><img src="images/A_delete.gif" width="52" height="16" alt="ɾ��������Ϣ" onClick="return fri_chk();"></a>
								    </td> 
                                  </tr> 
                                </table> 
                                <%} %>                                                              
      						</td> 
                            </tr> 
                          </table>
                          </td> 
                    </table> 
				 </td> 
                </tr> 
              </table></td> 
          </tr> 
        </table></TD> 
    </TR> 
  </TBODY> 
</TABLE>
<table bgcolor="#ffcc66" height="50px" width="760px" align="center">
<tr><td align="center">Aurora����</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table> 
</body>
</html>

