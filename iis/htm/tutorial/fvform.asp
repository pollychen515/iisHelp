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
<TITLE>Ԥ��ֵ����</TITLE> 
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

<body bgcolor="#FFFFFF" text="#000000"><font face="����">

<H3><A NAME="H3_37661422">ʹ�øñ����㴢��ƻ���Ԥ��ֵ��</A></H3> 

<FORM METHOD=POST ACTION="<%= finlesson %>"> 

<TABLE> 
<TR> 
<TD>ÿ���¼ƻ�������٣�</TD>
<TD><INPUT TYPE=TEXT NAME=Payment> </TD>
</TR>
<TR> <TD>����Ԥ�ڵ������Ϣ�ٷ��ʡ� </TD>
<TD><INPUT TYPE=TEXT NAME=APR> </TD>
</TR>
<TR> 
<TD>�漸���£�</TD>
<TD><INPUT TYPE=TEXT NAME=TotPmts> </TD>
</TR>
<TR> 
<TD>ÿ���³�������ĩ֧���� </TD>
<TD><INPUT TYPE=RADIO NAME=PayType VALUE="Beginning" CHECKED>�³� 
<INPUT TYPE=RADIO NAME=PayType VALUE="End">��ĩEnd </TD>
</TR>
<TR> 
<TD>�ô����ʺ��������ж���Ǯ�� </TD>
<TD><INPUT TYPE=TEXT NAME=PVal> </TD>
</TR>
<TR> 
<TD> </TD>
<TD><INPUT TYPE=SUBMIT VALUE=" ����Ԥ��ֵ "></TD>
</TR>

</TABLE> 

</FORM> 



</FONT> 
</BODY> 
</HTML> 
