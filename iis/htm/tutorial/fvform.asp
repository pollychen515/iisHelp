<%
ScriptLanguagePreference = Request.Cookies("ScriptLanguagePreference")
 

LessonFile = Request.ServerVariables("SCRIPT_NAME")

  If ScriptLanguagePreference = "" Then
    ScriptLanguagePreference = Request.QueryString("ScriptLanguagePreference")
    If ScriptLanguagePreference = "" Then
      Response.Redirect "iiselect.asp?LessonFile=" & Server.URLEncode(LessonFile)
    End If
  End If

Response.Expires = 0

If ScriptLanguagePreference = "VBScript" Then
  finlesson = "finance.asp"
Else
  finlesson = "financej.asp"
End If

 %>

<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML//EN">
<html dir=ltr><HEAD>
<TITLE>预期值计算</TITLE> 
<META NAME="ROBOTS" CONTENT="NOINDEX">
<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// Check to see if browser is Microsoft
		if (TempString.indexOf ("4.") >= 0){
// Check to see if it is IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// Check to see if browser is Netscape
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
	}
	else
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
//-->
</script>

<META NAME="ROBOTS" CONTENT="NOINDEX"><META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head> 

<body bgcolor="#FFFFFF" text="#000000"><font face="宋体">

<H3><A NAME="H3_37661422">使用该表单计算储蓄计划的预期值。</A></H3> 

<FORM METHOD=POST ACTION="<%= finlesson %>"> 

<TABLE> 
<TR> 
<TD>每个月计划存入多少？</TD>
<TD><INPUT TYPE=TEXT NAME=Payment> </TD>
</TR>
<TR> <TD>输入预期的年度利息百分率。 </TD>
<TD><INPUT TYPE=TEXT NAME=APR> </TD>
</TR>
<TR> 
<TD>存几个月？</TD>
<TD><INPUT TYPE=TEXT NAME=TotPmts> </TD>
</TR>
<TR> 
<TD>每月月初还是月末支付？ </TD>
<TD><INPUT TYPE=RADIO NAME=PayType VALUE="Beginning" CHECKED>月初 
<INPUT TYPE=RADIO NAME=PayType VALUE="End">月末End </TD>
</TR>
<TR> 
<TD>该储蓄帐号里现在有多少钱？ </TD>
<TD><INPUT TYPE=TEXT NAME=PVal> </TD>
</TR>
<TR> 
<TD> </TD>
<TD><INPUT TYPE=SUBMIT VALUE=" 计算预期值 "></TD>
</TR>

</TABLE> 

</FORM> 



</FONT> 
</BODY> 
</HTML> 
