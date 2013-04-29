<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>Aurora博客 - 注册 </title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<link href="CSS/style.css"  rel="stylesheet">
  </head>
 <script src="JS/check.js"  language="javascript"></script>
<script type="text/javascript" src="JS/calendar.js"></script>
<body style="MARGIN-TOP: 0px; VERTICAL-ALIGN: top; PADDING-TOP: 0px; TEXT-ALIGN: center;"> 

<TABLE width="757" cellPadding=0 cellSpacing=0 style="WIDTH: 755px" align="center"> 
  <TBODY> 
    <TR> <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3 background="images/F_head.jpg"> <table width="100%" height="149"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="51" align="right">
		  <br>
		  <table width="262" border="0" cellspacing="0" cellpadding="0">
            <tr align="left">
              <td width="26" height="20"></td>
              <td width="71" class="word_white"><a href="index.jsp"><span style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">首  页</span></a></td>
              <td width="87"><a href="index.jsp"><span  style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none">我的博客</span></a></td>
              <td width="55"><a href="#"><span style="FONT-SIZE: 9pt; COLOR: #ffffff; TEXT-DECORATION: none"></span></a></td>
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
                <td width="20%" height="20" align="center" valign="baseline">&nbsp; </td>
                <td width="67%" align="left" valign="baseline" style="text-indent:10px;">
				用户名:<input  name=txt_user size="10">
				密&nbsp;&nbsp;码:<input  name=txt_pwd type=password style="FONT-SIZE: 9pt; WIDTH: 65px" size="6">&nbsp;
				<input style="FONT-SIZE: 9pt"  type="submit" value="登录" name="sub_dl" onClick="return f_check(form)">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				当前时间： 
				<span id="showTime">				
                	<script language="JavaScript">
					var d=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");
					var date = new Date();
					var showTime = document.getElementById("showTime");
					showTime.innerHTML=date.getFullYear()+"年"+(date.getMonth()+1)+"月"+date.getDate()+"日"+" "+d[date.getDay()];
					</script> 
					</span>
				</td>
                <td width="1%" align="center" valign="baseline">&nbsp;</td>
              </tr>
            </table> 
			</td>
		  </form>
        </tr>
      </table></TD> 
    </TR> 
    <TR> 
      <TD colSpan=3 valign="baseline" style="BACKGROUND-IMAGE: url( images/bg.jpg); VERTICAL-ALIGN: middle; HEIGHT: 450px; TEXT-ALIGN: center"><br>
        <form  name="myform" action="RegServlet" method="post"> 
          <table width="85%" border="0" align=center cellpadding=3 cellspacing=2 bordercolor="#FFFFFF" bgcolor="#FFFFFF" class=i_table> 
            <tr align="left" bgcolor="#EFF7DE"> 
              <td height=22 colspan=2 bgcolor="#EFF7DE" class=right_head><span class="tableBorder_LTR">必填内容</span></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td width=22% align="right" valign=middle class='f_one'> 用户名</td> 
              <td width=78% align="left"  class='f_one'><input name='txt_regname' type="text" id="txt_regname" value='' size=20 maxlength=14> 
                 <font color=red>*</font> 
              <div id="check_info"></div></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" valign=middle > 真实姓名</td> 
              <td align="left" > <input name="txt_regrealname" type=text id="txt_regrealname" size=20 maxlength=75>                
              <font color=red>*</font></td> 
            </tr> 
            <tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" valign=middle > 密码</td> 
              <td align="left"> <input name="txt_regpwd" type="password" id="txt_regpwd" size=20 maxlength=75> 
             	 英文字母或数字等不少于3位<font color=red>*</font></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" valign=middle> 确认密码</td> 
              <td align="left" > <input name='txt_regpwd2' type=password id="txt_regpwd2" size=20 maxlength=75 onBlur="if(this.value!=this.form.txt_regpwd.value) {alert('您两次输入的密码不一致！');myform.txt_regpwd.focus();}"> 
              <font color=red>*</font></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" > 出生日期</td> 
              <td align="left" > <span class="word_grey"> 
                <input name="txt_birthday" type="text" id="control_date" size="10" maxlength="10" readonly="readonly"> 
                <input type="button" name="button" id="button" value="选择日期" onclick="new Calendar().show(this.form.control_date);" />（日期格式为：yyyy-mm-dd）
                <font color=red>*</font></span></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" valign=middle> Email</td> 
              <td align="left"  > <input name="txt_regemail" type="text" id="txt_regemail" value='' size=35 maxlength=75> 
              <font color='#000000'>公开邮箱 <font color=red>*</font></font> </td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right">所在城市</td> 
              <td align="left"> <SCRIPT src=" JS/initcity.js"></SCRIPT> 
                <select name="txt_province" id="txt_province" onchange="initcity();"> 
                  <SCRIPT>creatprovince();</SCRIPT> 
                </select> 
                <select name="txt_city" id="txt_city" > </select> 
              <font color="red">*</font> </td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" valign=middle  class='f_one'> 选择头像：</td> 
              <td align="left" class='f_one'><table width="106" cellpadding="0" cellspacing="0"> 
                  <tr> 
                    <td width="10" height="47"><script language="javascript">
						//通过下拉列表选择头像时应用该函数
						function showlogo(){
						document.images.img.src=" images/head/"+document.myform.txt_ico.options[document.myform.txt_ico.selectedIndex].value;
						}
            		</script>
					</td> 
                    <td width="80"><img src=" images/head/0.gif" name="img" width="60" height="60"></td> 
                    <td width="53" rowspan="2" align="center"><font color=red>*</font></td> 
                  </tr> 
                  <tr> 
                    <td>&nbsp;</td> 
                    <td> <select name="txt_ico" size="1" id="txt_ico" onChange="showlogo()"> 
                        <option value="0.gif" selected>头像1</option>
                        <option value="1.gif">头像2</option>
                        <option value="2.gif">头像3</option>
                        <option value="3.gif">头像4</option> 
                        <option value="4.gif">头像5</option> 
                        <option value="5.gif">头像6</option> 
                      </select> </td> 
                  </tr> 
              </table></td> 
            </tr> 
            <tr align="left" bgcolor="#EFF7DE"> 
              <td height=22 colspan=2 class=right_head><span class="tableBorder_LTR">选填内容</span></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" class='f_one'> 性别</td> 
              <td align="left" class='f_one'> <select name=txt_regsex id="txt_regsex"> 
                  <OPTION value=1>男</OPTION> 
                  <OPTION value=2>女</OPTION> 
                  <OPTION value=0 selected>保密</OPTION> 
              </select></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" class='f_one'>QQ</td> 
              <td align="left" class='f_one'><input name='txt_regqq' type=text id="txt_regqq" value='' size=20 maxlength=14></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" class='f_one'> 个人主页</td> 
              <td align="left" class='f_one'> <input name='txt_reghomepage' type=text id="txt_reghomepage" value='' size=40 maxlength=75></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" valign=middle class='f_one'>个性化签名</td> 
              <td align="left" class='f_one'><textarea name='txt_regsign' cols=50 rows='4' id="txt_regsign"></textarea></td> 
            </tr> 
            <tr bgcolor="#FFFFFF"> 
              <td align="right" class='f_one'> 自我简介</td> 
              <td align="left" class='f_one'><textarea name=txt_regintroduce cols=50 rows=4 id="txt_regintroduce"></textarea></td> 
            </tr> 
          </table> 
          <br> 
            <input type='submit' name='regsubmit' value='提 交'class="btn_grey" onClick="return check()"> &nbsp;
            <input name="Submit2" type="reset" class="btn_grey" value="重 填">
      </form></TD> 
    </TR> 
  </TBODY> 
</TABLE>
<table bgcolor="#ffcc66" height="50px" width="760px" align="center">
<tr><td align="center">Aurora博客</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table>  
</body>
</html>
