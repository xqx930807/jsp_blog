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
 alert("����Ȩ�鿴����ҳ�����ȷ��������ҳ����");
 window.location="index.jsp";
 </script> 
 <%
 }else{
  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurora���� - �������</title>
    
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
		alert("�����������Ʋ�����Ϊ�գ�");myform.txt_title.focus();return false;
	}
	if(myform.file.value==""){
		alert("�������ݲ�����Ϊ�գ�");myform.file.focus();return false;
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
					 <TD style="WIDTH: 100px; COLOR: red;">��ӭ��:&nbsp;<%=username %>&nbsp;&nbsp;</TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"> </SPAN><a href="index.jsp">������ҳ</a></TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,productmenu) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >���¹���</a></TD>
                      <TD style="WIDTH: 90px; COLOR: red;"><a  onmouseover=showmenu(event,myfriend) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ȧ����</a>  </TD>
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
          <td height="451" align="center" valign="top"><table width="640"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="613" height="223" align="center"><br>
			  <table width="500" border="0" cellpadding="0" cellspacing="0">
			    <tr>
					<td valign="middle" align="center">
					<!--�����б�-->
				<table width="630" border="0" align="center" cellpadding="3" cellspacing="1" bordercolor="#9CC739" bgcolor="#FFFFFF">
                <tr align="left" colspan="2" >
                  <td width="390" height="25" colspan="3" valign="top" bgcolor="#EFF7DE"> <span class="tableBorder_LTR"> �鿴ȫ������ </span> </td>
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
                              <a href="DelPubServlet?id=<%=rs.getInt(1) %>"><img src="images/A_delete.gif" width="52" height="16" alt="ɾ����������" onClick="return d_chk();"></a> 
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
                  <td width="33%">&nbsp;&nbsp;ҳ�Σ�1/1ҳ&nbsp;��¼�� ��&nbsp; </td>
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
                        <td class="i_table" colspan="2"> <span class="tableBorder_LTR">���ϵͳ����</span></td>
                      </tr>
                      <tr>
                        <td valign="top" align="right" width="14%">�������⣺<br></td>
                        <td width="86%"><input name="txt_title" type="text" id="txt_title" size="68"></td>
                      </tr>
                      <tr>
                        <td align="right" width="14%">���ֱ༭��</td>
                        <td width="86%"><img src=" images/UBB/B.gif" width="21" height="20" onClick="bold()">&nbsp;<img src=" images/UBB/I.gif" width="21" height="20" onClick="italicize()">&nbsp;<img src=" images/UBB/U.gif" width="21" height="20" onClick="underline()">
						����
                            <select name="font" class="wenbenkuang" id="font" onChange="showfont(this.options[this.selectedIndex].value)">
                              <option value="����" selected>����</option>
                              <option value="����">����</option>
                              <option value="����">����</option>
                              <option value="����">����</option>
                            </select>
						�ֺ�<span class="pt9">
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
						��ɫ
					<select onChange="showcolor(this.options[this.selectedIndex].value)" name="color" size="1" class="wenbenkuang" id="select">
					  <option selected>Ĭ����ɫ</option>
					  <option style="color:#FF0000" value="#FF0000">��ɫ����</option>
					  <option style="color:#0000FF" value="#0000ff">��ɫ����</option>
					  <option style="color:#ff00ff" value="#ff00ff">��ɫ����</option>
					  <option style="color:#009900" value="#009900">��ɫ�ഺ</option>
					  <option style="color:#009999" value="#009999">��ɫ��ˬ</option>
					  <option style="color:#990099" value="#990099">��ɫ�н�</option>
					  <option style="color:#990000" value="#990000">��ҹ�˷�</option>
					  <option style="color:#000099" value="#000099">��������</option>
					  <option style="color:#999900" value="#999900">�����Ʒ�</option>
					  <option style="color:#ff9900" value="#ff9900">�ֽ�����</option>
					  <option style="color:#0099ff" value="#0099ff">��������</option>
					  <option style="color:#9900ff" value="#9900ff">��������</option>
					  <option style="color:#ff0099" value="#ff0099">���İ�ʾ</option>
					  <option style="color:#006600" value="#006600">ī�����</option>
					  <option style="color:#999999" value="#999999">��������</option>
					</select>
					</span></td>
                      </tr>
                      <tr>
                        <td align="right" width="14%">�������ݣ�</td>
                        <td width="86%">
						   <div class="file">						  
						     <textarea name="file" cols="75" rows="20" id="file" style="border:0px;width:520px;"></textarea>
						   </div> 
						</td>
                      </tr>
                      <tr align="center">
                        <td colspan="2"><input name="btn_tj" type="submit" id="btn_tj" value="�ύ" onClick="return check();">                          &nbsp;
                          <input name="btn_cx" type="reset" id="btn_cx" value="��д"></td>
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
<tr><td align="center">Aurora����</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table>
</body>
</html>
<%}%>