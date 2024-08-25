<%@ LANGUAGE = VBScript %>
<html dir=ltr><HEAD><TITLE>预期值计算</TITLE>

<META NAME="ROBOTS" CONTENT="NOINDEX"><META HTTP-EQUIV="Content-Type" content="text/html; charset=GB2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>
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




<body bgcolor="#FFFFFF" text="#000000"><font face="宋体">

<% 
' 检查是否输入了年利率 
If IsNumeric(Request("APR")) Then 
' 确保表单正确
If Request("APR") > 1 Then 
APR = Request("APR") / 100 
Else 
APR = Request("APR") 
End If 
Else 
APR = 0 
End If 

' 检查是否输入了付款值。 
If IsNumeric(Request("TotPmts")) Then 
TotPmts = Request("TotPmts") 
Else 
TotPmts = 0 
End If

' 检查是否输入了总付款值。
If IsNumeric(Request("Payment")) Then 
Payment = Request("Payment") 
Else 
Payment = 0 
End If 

' 检查是否输入了帐面值。
If IsNumeric(Request("PVal")) Then 
PVal = Request("PVal") 
Else 
PVal = 0 
End If

'检查用户是否想在月初或月末付款
If Request("PayType") = "Beginning" Then 
PayType = 1 ' 月初期间 
Else 
PayType = 0 ' 月末期间 
End If 

' 创建一个 Finance 对象实例 
 Set Finance = Server.CreateObject("MS.Finance") 

' 使用刚才的 Finance 对象实例来计算 
' 通过 HTML 表单和 CalcFV 方法 
' 提交的储蓄计划所期望得到的值 
FVal = Finance.CalcFV(APR / 12, TotPmts, -Payment, -PVal, PayType) 
%>

<h3><A NAME="H3_37661593"></A>您的储蓄将会值 <%= FormatCurrency(FVal )%>.</h3>



</FONT>
</BODY> 
</HTML> 
