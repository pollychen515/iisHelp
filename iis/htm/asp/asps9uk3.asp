 <% If Request("DontFrame")<>1 Then Response.Redirect "/iissamples/sdk/asp/docs/SampFram.asp?ovfile=/iishelp/iis/htm/asp/asps9uk3.asp&srcfile=Database/Update" %><!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2 Final//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" Content="text/html; charset=Windows-1252">
<TITLE>Update Records</TITLE>
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
<SCRIPT LANGUAGE="VBScript">
<!--
Sub Window_OnLoad()
   Dim frmContents
   On Error Resume Next
   If Not Parent Is Nothing Then
      Set frmContents = Parent.Contents
      If Not frmContents Is Nothing Then
            frmContents.Window.TOCSynch_Click
      End If
   End If
End Sub
//--></SCRIPT><META NAME="DESCRIPTION" CONTENT="Internet Information Services reference information">
<META HTTP-EQUIV="PICS-Label" CONTENT='(PICS-1.1 "<http://www.rsac.org/ratingsv01.html>" l comment "RSACi North America Server" by "inet@microsoft.com <mailto:inet@microsoft.com>" r (n 0 s 0 v 0 l 0))'>
<META NAME="MS.LOCALE" CONTENT="EN-US">
<META NAME="MS-IT-LOC" Content="Internet Information Services"> 
</HEAD>

<BODY BGCOLOR="#FFFFFF" TEXT="#000000">

<H2><A NAME="_update_records"></A>Update Records</H2>

<H6>Overview</H6>

<P>This example demonstrates how your application can use ADO to update existing records.</P>

<H6>Code Tour</H6>

<P><B>CreateObject</B> is used to create an instance of the <B>Connection</B> object, which in turn is used to open a connection to the OLE DB data provider. <B>CreateObject</B> is used again, this time to create an empty <B>Recordset</B> object. The <B>ActiveConnection</B> property is set to refer to the new <B>Connection</B> object.</P>

<P>The new recordset is then configured. The <B>Recordset.Execute </B>method takes a SQL command string as a parameter. This sample uses a SQL UPDATE command string to efficiently perform the update to the appropriate database records.</P>

<P><B><B>Important&nbsp;&nbsp;&nbsp;</B></B>OLE DB must be properly configured on the server for this sample to run properly.</P>
<hr class="iis" size="1">
<p align="center"><em><a href="../../../common/colegal.htm">&copy; 1997-1999 Microsoft Corporation. All rights reserved.</a></em></p>
</BODY>
</HTML>
