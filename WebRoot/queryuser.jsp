<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="org.aurora.blog.dto.*" %>
<%@ page import="org.aurora.blog.dao.*" %>
<%
	String username = (String) session.getAttribute("usersession");
 %>
 <% User user = (User) request.getAttribute("user"); %>
 <%
 if(!(username.equals("admin"))){
 %>
 <script language="javascript">
 alert("����Ȩ�鿴����ҳ�����ȷ��������ҳ����");
 window.location="index.jsp";
 </script> 
 <%
 }else{
  %>
<html>
  <head>    
    <title>Aurora���� - �û���ѯ</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="CSS/style.css" rel="stylesheet">
  </head>
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
    <TR> 
      <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3> 
      <TABLE style="BACKGROUND-IMAGE: url( images/F_head.jpg); WIDTH: 760px; HEIGHT: 154px" cellSpacing=0 cellPadding=0> 
          <TBODY> 
            <TR> 
              <TD height="110" colspan="6" 
          style="VERTICAL-ALIGN: text-top; WIDTH: 80px; HEIGHT: 115px; TEXT-ALIGN: right"></TD> 
            </TR> 
            <TR> 
              <TD height="29" align="center" valign="middle"><TABLE style="WIDTH: 610px" VERTICAL-ALIGN: text-top; cellSpacing=0 cellPadding=0 align="center"> 
                  <TBODY> 
                    <TR align="center" valign="middle"> 
                      <TD width="104" style="WIDTH: 100px; COLOR: red;">��ӭ��:&nbsp;<%=username %>&nbsp;&nbsp;</TD> 
                      <TD width="83" style="WIDTH: 80px; COLOR: red;"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"></SPAN><a href="index.jsp"> ������ҳ</a></TD> 
                      <TD width="83" style="WIDTH: 80px; COLOR: red;"> <a  onmouseover=showmenu(event,productmenu) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >���¹���</a></TD> 
                      <TD width="90" style="WIDTH: 90px; COLOR: red;"> <a  onmouseover=showmenu(event,myfriend) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ȧ����</a> </TD>
                      <TD style="WIDTH: 90px; COLOR: red;"><a  href="ToUpdateServlet">�޸ĸ�����Ϣ</a> </TD>
					 <TD width="92" style="WIDTH: 80px; COLOR: red;"> <a  onmouseover=showmenu(event,myuser) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ա����</a></TD> 
					  <TD width="80" style="WIDTH: 80px; COLOR: red;"> <a href="logout.jsp">�˳���¼</a></TD> 
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
                        <form  name="myform" method="post" action="QueryUserServlet"> 
                            <table width="560" border="0" cellpadding="3" cellspacing="1" bordercolor="#D6E7A5"> 
                              <tr> 
                                <td width="100%" height="28" align="center" class="i_table">��ѯ������
                                  <select name="sel_tj" id="sel_tj">
                                    <option value="name" selected>�û���</option>
                                    <option value="id">ID��</option> 
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
                        <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="tableBorder_LTR"> �û�����</span> </td> 
                      </tr> 
                      <td height="192" align="center" valign="top" ><table width="480" border="0" cellpadding="0" cellspacing="0"> 
                            <tr> 
                              <td align="center"> 
                              <%if(user != null){ %>
                               <table width="520" border="0" align="center" cellpadding=3 cellspacing=2 bordercolor="#FFFFFF" bgcolor="#FFFFFF" class=i_table> 
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width=15% align="center" valign=middle> �û�ID</td> 
                                    <td width=6% align="left"><%=user.getId() %></td> 
                                    <td width=10% align="center">�û���</td> 
                                    <td width=11% align="left"><%=user.getUsername() %></td> 
                                    <td width=15% align="center">��ʵ����</td> 
                                    <td width=14% align="left"><%=user.getName() %></td> 
                                    <td width=11% align="center">�� ��</td> 
                                    <td width=18% align="left"><%=user.getSex() %></td> 
                                  </tr> 
                                  <tr bgcolor="#FFFFFF"> 
                                    <td width=15% align="center" valign=middle>��������</td> 
                                    <td colspan="3" align="left"><%=user.getBirthdate() %></td> 
                                    <td align="center">�� &nbsp;��</td> 
                                    <td colspan="3" align="left"><%=user.getPassword() %></td> 
                                  </tr> 
                                  <tr bgcolor="#FFFFFF"> 
                                    <td align="center">���ڳ���</td> 
                                    <td colspan="3" align="left"><%=user.getCity() %></td> 
                                    <td align="center">E-mail</td> 
                                    <td colspan="3" align="left"><%=user.getEmail() %></td>
                                  </tr> 
								  <tr bgcolor="#FFFFFF">                                   
                                    <td align="left">
                                      <a href="DelUserServlet?id=<%=user.getId() %>"><img src="images/A_delete.gif" width="52" height="16" alt="ɾ��������Ϣ" onClick="return fri_chk();"></a>
									</td>
								  </tr> 
                                </table> 
                                <%} %>
    						</td> 
                            </tr> 
                          </table></td> 
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
<%} %>
</html>

