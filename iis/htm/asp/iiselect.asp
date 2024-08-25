<%@ EnableSessionState=False %>
<%
 
  LessonFile = Request.QueryString("LessonFile")  ' First time
  If LessonFile = "" Then  ' From this form on the second pass
    LessonFile = Request.Form("LessonFile") 
  End If

  ScriptingLanguage = Request.Form("ScriptingLanguage")

  If ScriptingLanguage <> "" Then
    Response.Cookies("ScriptLanguagePreference") = ScriptingLanguage
    Response.Cookies("ScriptLanguagePreference").Expires = "January 1, 2010"
    Response.Cookies("ScriptLanguagePreference").Path = "/"

    Response.Redirect LessonFile & "?ScriptLanguagePreference=" & Server.URLEncode(ScriptingLanguage)
  End If

  YourScriptingLanguage = Request.Cookies("ScriptLanguagePreference")

  Select Case YourScriptingLanguage
    Case "VBScript"
      VBScriptChecked = "Checked"
    Case "JScript"
      JScriptChecked = "Checked"
    Case Else
      VBScriptChecked = "Checked"
  End Select

%>

<html dir=ltr><head><title>Active Server Pages ָ��</title>


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
</SCRIPT> 
 
<META NAME="ROBOTS" CONTENT="NOINDEX"><META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>
<body bgcolor="#FFFFFF" text="#000000"><font face="����">	

<h1><a name="H1_37672957">Active Server Pages ָ��</a></h1>

<br>
<br>
<p>��ѡ��ű������Բ鿴 ASP ָ��:</p>


<form method=post action=iiselect.asp>
<input type=hidden name=LessonFile value="<%= LessonFile %>">
<input type=radio name=ScriptingLanguage value=VBScript <%= VBScriptChecked %>>VBScript<br>
<input type=radio name=ScriptingLanguage value=JScript <%= JScriptChecked %>>JScript<br><br>
<input type=submit value="ѡ��">
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<hr class="iis" size="1">
<p align=center><a href="../../../common/colegal.htm">&copy; 1997-1999 Microsoft ��˾����Ȩ���С�</a></p>

</form>

</font>
</body>
</html>
