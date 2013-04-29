<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>  
    <title>Aurora博客 - 注册</title>   
  </head> 
  <body style="MARGIN-TOP: 0px; VERTICAL-ALIGN: top; PADDING-TOP: 0px; TEXT-ALIGN: center">
  <TABLE width="757" cellPadding=0 cellSpacing=0 style="WIDTH: 755px" align="center"> 
    <TBODY> 
      <TR> <TD style="VERTICAL-ALIGN: bottom; HEIGHT: 6px" colSpan=3 background="images/F_head.jpg"> <table width="100%" height="149"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td height="51" align="right">
		  <br>
		  <table width="262" border="0" cellspacing="0" cellpadding="0">
            <tr align="left">
              <td width="26" height="20"><a href="index.jsp"></a></td>
              <td width="71" class="word_white"><a href="index.jsp"><span style="FONT-SIZE: 9pt; COLOR: #000000; TEXT-DECORATION: none">首  页</span></a></td>
              <td width="87"><a href="file.jsp"><span  style="FONT-SIZE: 9pt; COLOR: #000000; TEXT-DECORATION: none">我的博客</span></a></td>
              <td width="55"><a href="#"><span style="FONT-SIZE: 9pt; COLOR: #000000; TEXT-DECORATION: none">博客注册</span></a></td>
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
                <td width="10%" height="20" align="center" valign="baseline">&nbsp; </td>
                <td width="67%" align="left" valign="baseline" style="text-indent:10px;">
				用户名:<input  name=txt_user size="10">
				密&nbsp;码:<input  name=txt_pwd type=password style="FONT-SIZE: 9pt; WIDTH: 65px" size="6">&nbsp;
				<input style="FONT-SIZE: 9pt"  type=submit value=登录 name=sub_dl onClick="return f_check(form)">&nbsp;
				当前日期： 
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
        <TD colSpan=3 valign="middle" style="BACKGROUND-IMAGE: url( images/bg.jpg); VERTICAL-ALIGN: middle; HEIGHT: 450px; TEXT-ALIGN: center">
         <TABLE height="304" cellPadding=0 cellSpacing=0 style="WIDTH: 224px" align="center"> 
            <TBODY> 
              <TR> 
                <TD height="29" style="WIDTH: 368px; HEIGHT: 21px; TEXT-ALIGN: center" align="center">
                <STRONG><SPAN style="COLOR: #993300">用户注册协议</SPAN></STRONG></TD> 
              </TR> 
              <TR> 
                <TD style="WIDTH: 368px; HEIGHT: 302px" rowSpan=2> 
                <TABLE  style="BORDER-RIGHT: black thin solid; BORDER-TOP: black thin solid; BORDER-LEFT: black thin solid; WIDTH: 369px; BORDER-BOTTOM: black thin solid" align="center"> 
                    <TBODY> 
                      <TR> 
                        <TD style="HEIGHT: 15px; TEXT-ALIGN: left" colSpan=4 rowSpan=4 align="center">&nbsp;&nbsp;&nbsp;&nbsp;为维护网上公共秩序和社会稳定，请您自觉遵守以下条款：   <BR> 
				                          一、不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息： <BR> 
				                          （一）煽动抗拒、破坏宪法和法律、行政法规实施的； <BR> 
				                          （二）煽动颠覆国家政权，推翻社会主义制度的； <BR> 
				                          （三）煽动分裂国家、破坏国家统一的； <BR> 
				                          （四）煽动民族仇恨、民族歧视，破坏民族团结的； <BR> 
				                          （五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的； <BR> 
				                          （六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的； <BR> 
				                          （七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的； <BR> 
				                          （八）损害国家机关信誉的； <BR> 
				                          （九）其他违反宪法和法律行政法规的； <BR> 
				                          （十）进行商业广告行为的。 <BR> 
				                          二、互相尊重，对自己的言论和行为负责。
                        </TD> 
                      </TR> 
                      <TR></TR> 
                      <TR></TR> 
                      <TR></TR> 
                      <TR> 
                        <TD style="HEIGHT: 8px; TEXT-ALIGN: center" colSpan=4><INPUT id=Button1 style="FONT-SIZE: 9pt" type=submit value=同意以上条款 name=Button1 onClick="window.location.href='Register.jsp'"> &nbsp; 
                          <INPUT id=Button2 style="FONT-SIZE: 9pt" type=submit value=不同意 name=Button2 onClick="window.location.href='index.jsp'"></TD> 
                      </TR> 
                    </TBODY> 
                  </TABLE></TD> 
              </TR> 
              <TR></TR> 
            </TBODY> 
          </TABLE></TD> 
      </TR> 
    </TBODY> 
  </TABLE> 
  <table bgcolor="#ffcc66" height="50px" width="760px" align="center">
<tr><td align="center">Aurora博客</td></tr><tr><td align="center">2012.7.9-2012.7.13</td></tr>
</table>  
</BODY>
</HTML>
