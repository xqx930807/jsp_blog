<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="org.aurora.blog.dao.*" %>
<%@ page import="org.aurora.blog.dto.*" %>
<%@ page import="org.aurora.blog.dto.*" %>
<%
	String username = (String) session.getAttribute("usersession");
 %>
<%
Article article = (Article) request.getAttribute("article");
 %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurora����-��ѯ����</title>
    
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
	alert("��ѡ���ѯ����!");myform.sel_key.focus();return false;
}
}
</script>
<body> 
<TABLE width="757" cellPadding=0 cellSpacing=0 style="WIDTH: 755px" align="center"> 
  <TBODY> 
    <TR> 
      <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3> <TABLE 
      style="BACKGROUND-IMAGE: url( images/F_head.jpg); WIDTH: 760px; HEIGHT: 154px" 
      cellSpacing=0 cellPadding=0> 
          <TBODY> 
            <TR> 
              <TD height="110" colspan="6" 
          style="VERTICAL-ALIGN: text-top; WIDTH: 80px; HEIGHT: 115px; TEXT-ALIGN: right"></TD> 
            </TR> 
            <TR> 
              <TD height="29" align="center" valign="middle"> <TABLE style="WIDTH: 580px" VERTICAL-ALIGN: text-top; cellSpacing=0 cellPadding=0 align="center"> 
                  <TBODY> 
                    <TR align="center" valign="middle"> 
                      <TD style="WIDTH: 100px; COLOR: red;">��ӭ��:&nbsp;&nbsp;<%=username %></TD> 
                      <TD style="WIDTH: 80px; COLOR: red;"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"></SPAN><a href="index.jsp"> ������ҳ</a></TD> 
                      <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,productmenu) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >���¹���</a></TD> 
                      <TD style="WIDTH: 90px; COLOR: red;"><a  onmouseover=showmenu(event,myfriend) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ȧ����</a> </TD> 
                      <TD style="WIDTH: 90px; COLOR: red;"><a  href="ToUpdateServlet">�޸ĸ�����Ϣ</a> </TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,myuser) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ա����</a></TD> 
                      <TD style="WIDTH: 80px; COLOR: red;"><a href="logout.jsp">�˳���¼</a></TD> 
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
              <br> 
              <table width="600" height="398"  border="0" cellpadding="0" cellspacing="0"> 
                <tr> 
                  <td height="32" align="center" valign="middle">
                  <table width="480" border="0" cellpadding="0" cellspacing="0"> 
                      <tr> 
                        <td> 
                        <form  name="myform" method="post" action="QueryArtServlet"> 
                            <table width="560" border="0" cellpadding="3" cellspacing="1" bordercolor="#D6E7A5"> 
                              <tr> 
                                <td width="100%" height="28" align="center" class="i_table">
                                                                                         ��ѯ������
                                  <select name="queryarticle" id="sel_tj"> 
                                    <option value="title" selected>��������</option> 
                                    <option value="author">����</option> 
                                  </select> 
                                  	�ؼ���
                                  <input name="key" type="text" id="sel_key" size="30" placeholder="��ѯ�ؼ���"> &nbsp; 
                                  <input type="submit" name="Submit" value="����" onClick="return check();">
                                 </td> 
                              </tr> 
                            </table> 
                          </form>
                          </td> 
                      </tr> 
                    </table>
                    </td> 
                </tr> 
                <tr> 
                  <td height="223" align="center" valign="top">
				 	 <%if(article == null) {%>
				 	 <fornt color="red">�Բ�������������Ϣ�����ڣ�</font>
				 	 <%}else{ %>
                    <table width="560" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF"> 
                      <tr align="left" colspan="2" > 
                        <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="tableBorder_LTR"> ��������</span> </td> 
                      </tr> 
                      <td align="center" valign="top" >
                      <table width="480" border="0" cellpadding="0" cellspacing="0"> 
                            <tr> 
                              <td height="100" valign="top">
                           <table width="100%"  border="0" cellpadding="1" cellspacing="1" bordercolor="#D6E7A5" bgcolor="#FFFFFF" class="i_table"> 
                            <tr bgcolor="#FFFFFF"> 
                              <td width="14%" align="center">����ID��</td> 
                              <td width="15%"><%=article.getId() %></td> 
                              <td width="11%" align="center">����</td> 
                              <td width="18%"><%=article.getUsername() %></td> 
                              <td width="12%" align="center">����ʱ��</td> 
                              <td width="30%">2012-7-11</td> 
                            </tr> 
                            <tr bgcolor="#FFFFFF"> 
                              <td align="center">��������</td> 
                              <td colspan="5">&nbsp;&nbsp;<%=article.getTitle() %></td> 
                            </tr> 
                            <tr bgcolor="#FFFFFF"> 
                              <td align="center">��������</td> 
                              <td colspan="4" width="300px"><%=article.getCons() %></td> 
                              <td>
                                 <a href="DelArtServlet?id=<%=article.getId() %>"><img src="images/A_delete.gif" width="52" height="16" alt="ɾ����������" onClick="return fri_chk();"></a> 
							  </td>
                            </tr>
                          </table>
							</td> 
                            </tr> 
                         </table>
                         <table>
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
                  <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE">&nbsp;<span class="tableBorder_LTR"> �鿴����</span> </td> 
                </tr>              
                <tr> 
                  <td height="57" align="center" valign="top" ><table width="480"  border="0" cellpadding="1" cellspacing="1" bordercolor="#D6E7A5" bgcolor="#FFFFFF" class="i_table"> 
                      <tr bgcolor="#FFFFFF"> 
                        <td width="14%" align="center">����ID��</td> 
                        <td width="15%"><%=rs.getInt(1) %></td> 
                        <td width="11%" align="center">������</td> 
                        <td width="18%"><%=rs.getString(2) %></td> 
                        <td width="12%" align="center">����ʱ��</td> 
                        <td width="30%"><%=rs.getString(3) %></td> 
                      </tr> 
                      <tr bgcolor="#FFFFFF"> 
                        <td align="center">��������</td> 
                        <td colspan="4"><%=rs.getString(4) %></td> 
                        <td>                       
                          <a href="DelComServlet?id=<%=rs.getInt(1) %>"><img src="images/A_delete.gif" width="52" height="16" alt="ɾ��������������" onClick="return d_chk();"></a>						
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
			<!--  ��������  -->
			<form name="myform" method="post" action="AddComServlet">
 			<table width="560" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF">
                      <tr align="left" colspan="2" >
                        <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="right_head"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"></SPAN></span>
                        <span class="tableBorder_LTR"> ��������</span> </td>
                      </tr>
 				   <td height="112" align="center" valign="top" >
       			     <input name="htxt_fileid" type="hidden" value="#">
       			     <table width="500"  border="0" cellpadding="1" cellspacing="0" bordercolor="#D6E7A5" bgcolor="#FFFFFF">
				    <tr>
					  <td align="center">��Ҫ����</td>
					  <td width="410">
					  <textarea name="txt_content" cols="66" rows="8" id="txt_content" ></textarea>
					  <input type="hidden" name="title" value="<%=article.getTitle() %>"> 
					  </td>
				    </tr>
				    <tr align="center">
					  <td colspan="2">
					  <input type="submit" name="submit" value="�ύ" onClick="return r_check();">&nbsp;
					   <input type="reset" name="submit2" value="����"></td>
				    </tr>
				  </table>			    
				  </td>
              </table>
			  </form>
<!---------------------------------------------------------------------------------------------------------------------->			
		    </td>
          </tr> 
            </table>
                          </td> 
                    </table> 
				<%} %>
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
