<%@ Language=VBScript  %>

<% 
 Response.Buffer = true
 Response.Clear
 Response.Expires = 0 	
 %>

<!doctype html public "-//W3C//DTD HTML 3.2//EN">
<html dir=ltr>
<head>
	<title>ASP �̳�: Ad Rotator ʾ��</title>
	<META NAME="ROBOTS" CONTENT="NOINDEX">
<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// ���������Ƿ�Ϊ Microsoft
		if (TempString.indexOf ("4.") >= 0){
// ����Ƿ�Ϊ IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// ���������Ƿ�Ϊ Netscape
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
	}
	else
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
//-->
</script>  




<META HTTP-EQUIV="Content-Type" content="text/html; charset=GB2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>




<body bgcolor="#FFFFFF" >

<h1><a name="usingthebrowsercapabilitiescomponent">��2��: ��������������ʾ��</a></h1>
<p>


<%  
Set objBrowser = Server.CreateObject("MSWC.BrowserType") 
If objBrowser.browser = "IE"  and  objBrowser.majorver >= "4" Then 
%>

<p>���ڹۿ�һ����̬�� HTML ad rotator��</P> 

<CENTER>
<OBJECT ID="scriptlet" 
		STYLE="	position:relative;height:200;width:200"
        type="text/x-scriptlet"
		data="..\tutorial\rotate4.htm">
</OBJECT>
</CENTER>

<% Else %>

<p>����������������� Internet Explorer version 4.0 ����°汾. ����һ����̬�� HTML ad rotator, ʹ�� ASP Ad Rotator ����������Կ���һ����̬��ͼ�񡣣�ˢ��ҳ����Կ���һ���µ�ͼ�񡣣� </p>
<br>
<%  Set Ad = Server.CreateObject("MSWC.Adrotator") %>
<CENTER>
<%= Ad.GetAdvertisement("/iishelp/iis/htm/tutorial/adrot.txt") %>
</CENTER>
<% End If %>



<center>
<br>
<a href="/iishelp/iis/htm/asp/iiatmd2.asp#browscapdemo">���ص�ģ�� 2</a>
</center>

<br>
<br>



<center><hr color=#cccccc noshade size=1></center>
<p><font style="font-family:����; font-size:9pt"> �˴��ᵽ�Ĺ�˾����Ʒ����������ݶ����鹹������������������������κ���ʵ�ĸ��ˡ���˾����Ʒ���¼���</font></p>



</body>
</html>
