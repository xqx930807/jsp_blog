<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%
	String username = (String) session.getAttribute("usersession");
 %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
  	<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
    <title>Aurora���� - ����Ȧ���</title>
  </head>
 <link href="CSS/style.css" rel="stylesheet"> 
 <script src=" JS/menu.JS"></script>
 <script type="text/javascript" src="JS/calendar.js"></script>
 <body>
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
              <TD height="29" align="center" valign="middle">
			  <TABLE style="WIDTH: 580px" VERTICAL-ALIGN: text-top; cellSpacing=0 cellPadding=0 align="center">
                  <TBODY>
                    <TR align="center" valign="middle">
					 <TD style="WIDTH: 100px; COLOR: red;">��ӭ��:&nbsp;<%=username %>&nbsp;&nbsp;</TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><SPAN  style="FONT-SIZE: 9pt; COLOR: #cc0033"> </SPAN><a href="index.jsp">������ҳ</a></TD>
                      <TD style="WIDTH: 80px; COLOR: red;"><a  onmouseover=showmenu(event,productmenu) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >���¹���</a></TD>
                      <TD style="WIDTH: 90px; COLOR: red;"><a  onmouseover=showmenu(event,myfriend) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ȧ����</a>  </TD> 
                      <TD style="WIDTH: 90px; COLOR: red;"><a  href="ToUpdateServlet">�޸ĸ�����Ϣ</a> </TD>
                      <TD width="92" style="WIDTH: 80px; COLOR: red;"> <a  onmouseover=showmenu(event,myuser) onmouseout=delayhidemenu() class='navlink' style="CURSOR:hand" >����Ա����</a></TD>  
					  <TD style="WIDTH: 80px; COLOR: red;"><a href="safe.jsp">�˳���¼</a></TD>
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
          <td height="451" align="center" valign="top"><br>
            <table width="640"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="613" height="23" align="right" valign="top">&nbsp;</td><br>
            </tr>
            <tr>
              <td height="223" align="center" valign="top">			  
              <form  name="myform" action="AddFriendServlet" method="post">
                <table width="85%" border="0" align=center cellpadding=3 cellspacing=2 bordercolor="#FFFFFF" bgcolor="#FFFFFF" class=i_table>
                  <tr align="left" bgcolor="#EFF7DE">
                    <td height=22 colspan=2 class=right_head> <span class="tableBorder_LTR">����Ȧ���</span></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td width=22% align="right" valign=middle> ����</td>
                    <td width=78% align="left">
                    <input name='txt_name' type=text id="txt_name" value='' size=20 maxlength=14>                    </td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right" valign=middle ><span class="f_one">�Ա�</span> </td>
                    <td align="left" ><span class="f_one">
                      <select name='txt_sex' id="txt_sex">
                        <option value=1>��</option>
                        <option value=2>Ů</option>
                        <option value=0 selected>����</option>
                      </select>
                    </span> </td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right" > ����</td>
                    <td align="left" > <span class="word_grey">
                      <input name="txt_bir" type="text"  id="control_date"size="10" maxlength="10" readonly="readonly">
                      <input type="button" name="button" id="button" value="ѡ������" onclick="new Calendar().show(this.form.control_date);" />
        			�����ڸ�ʽΪ��yyyy-mm-dd��</span></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right" valign=middle>���ڳ��� </td>
                    <td align="left"  ><SCRIPT src=" JS/initcity.js"></SCRIPT> 
					<select name="txt_province" id="select" onChange="initcity();">
                  <SCRIPT>creatprovince();</SCRIPT> 
					</select>
                      <select name="txt_city" id="select2" >
                      </select></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">��ͥסַ </td>
                    <td align="left">
                      <input name='txt_address' type=text id="txt_address2" value='' size=40 maxlength=75>
                          </td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right">e-mail</td>
                    <td align="left"><input name='txt_email' type=text id="txt_reghomepage3" value='' size=40 maxlength=75></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right" valign=middle>�ֻ�����</td>
                    <td align="left">
                    <input name='txt_handset' type=text id="txt_regoicq2" value='' size=20 maxlength=14></td>
                  </tr>
                  <tr bgcolor="#FFFFFF">
                    <td align="right"> QQ�� </td>
                    <td align="left"><input name='txt_QQ' type=text id="txt_regoicq3" value='' size=20 maxlength=14></td>
                  </tr>
                </table>
                <br>
                <input type='submit' name='regsubmit' value='�� ��'class="btn_grey" onClick="return check()">
				<input name="Submit2" type="reset" class="btn_grey" value="�� ��">
              </form></td>
          </tr>
          </table>            
          </td>
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
