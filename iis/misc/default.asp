<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">

<% @Language = "VBScript" %>

<html dir=ltr><head><title>Microsoft Internet ��Ϣ����&nbsp;5.0 �ĵ�</title>

<META NAME="ROBOTS" CONTENT="NOINDEX">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=GB2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>


<% Set OBJbrowser = Server.CreateObject("MSWC.BrowserType")
	BrsType = Request.ServerVariables("HTTP_User-Agent")
	MachType=Request.ServerVariables("HTTP_UA-CPU")
	If InStr(BrsType, "MSIE") Then
		If InStr(BrsType, "Windows") Then
			File="contents.asp" 
			Size="30"
			Scroll="Auto"
		Else
			File="coflat.htm"
			Size="34"
			Scroll="Yes"
		End If
		If MachType="Alpha" Then
			File="contalph.asp"
			Size="30"
			Scroll="Auto" 
		End If
	Else

		File="coflat.htm"
		Size="34"
		Scroll="Yes"
	End If
%>

 
<%
        If Request.QueryString("jumpurl") <> "" Then
                strMainUrl = Request.QueryString("jumpurl")
        Else
                strMainUrl = "../htm/core/iiwltop.htm" 
        End If
 %>


<!--frameset cols="275,*"-->


<frameset rows="<% =Size%>,*" FRAMEBORDER="0" FRAMESPACING="0">
	<frame src="navbar.asp" name="NavBar" scrolling="No" noresize marginheight="0" marginwidth="0" framespacing="0" frameborder="No">
	<frameset cols="284,*">
        	<frame src=<% =File%> name="contents"  scrolling=<% =Scroll%> FRAMEBORDER="0" FRAMESPACING="0">
        	<frame src=<% =strMainUrl%> name="main" FRAMEBORDER="0" FRAMESPACING="0">
	</frameset>
</frameset>


<noframes>


<body bgcolor="#FFFFFF" text="#000000"><font face="����">

<h1>Microsoft Internet ��Ϣ����&nbsp;5.0 �ĵ�</h1>

<p> Microsoft Internet ��Ϣ����&nbsp;5.0 �ĵ�������֧��֡��������鿴��Ҫ�鿴���ĵ����뵥�������ͼ���������°汾�� Microsoft&reg; Internet Explorer��</p>

<p><A HREF="http://www.microsoft.com/isapi/redir.dll?prd=ie&ar=inews" target="_top"><IMG SRC="../../common/bestwith.gif" ALT="�����˴���ʼ" ALIGN="BOTTOM" BORDER="0" VSPACE="7" WIDTH="88" HEIGHT="31" HSPACE="5"></A></p>

<hr class="iis" size="1">
<p align="center"><a href="../../common/colegal.htm">&copy; 1997-1998 Microsoft Corporation�� ��������Ȩ����</a></p>
</font>
</noframes>

</body>
</html>
