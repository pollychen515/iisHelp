<%@ Language=VBScript  %>

<% 
 Response.Buffer = true
 Response.Clear
 Response.Expires = 0 	
 %>

<!doctype html public "-//W3C//DTD HTML 3.2//EN">
<html dir=ltr>
<head>
	<title>ASP 教程: Ad Rotator 示范</title>
	<META NAME="ROBOTS" CONTENT="NOINDEX">
<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// 检查浏览器是否为 Microsoft
		if (TempString.indexOf ("4.") >= 0){
// 检查是否为 IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// 检查浏览器是否为 Netscape
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

<h1><a name="usingthebrowsercapabilitiescomponent">第2课: 浏览器性能组件的示范</a></h1>
<p>


<%  
Set objBrowser = Server.CreateObject("MSWC.BrowserType") 
If objBrowser.browser = "IE"  and  objBrowser.majorver >= "4" Then 
%>

<p>您在观看一个动态的 HTML ad rotator。</P> 

<CENTER>
<OBJECT ID="scriptlet" 
		STYLE="	position:relative;height:200;width:200"
        type="text/x-scriptlet"
		data="..\tutorial\rotate4.htm">
</OBJECT>
</CENTER>

<% Else %>

<p>您的网络浏览器不是 Internet Explorer version 4.0 或更新版本. 除了一个动态的 HTML ad rotator, 使用 ASP Ad Rotator 组件您还可以看到一个静态的图像。（刷新页面可以看到一个新的图像。） </p>
<br>
<%  Set Ad = Server.CreateObject("MSWC.Adrotator") %>
<CENTER>
<%= Ad.GetAdvertisement("/iishelp/iis/htm/tutorial/adrot.txt") %>
</CENTER>
<% End If %>



<center>
<br>
<a href="/iishelp/iis/htm/asp/iiatmd2.asp#browscapdemo">返回到模块 2</a>
</center>

<br>
<br>



<center><hr color=#cccccc noshade size=1></center>
<p><font style="font-family:宋体; font-size:9pt"> 此处提到的公司、产品、人物和数据都属虚构，除非另有声明，无意代表任何真实的个人、公司、产品或事件。</font></p>



</body>
</html>
