<%@ LANGUAGE = VBScript %>
<html dir=ltr><HEAD><TITLE>Ԥ��ֵ����</TITLE>

<META NAME="ROBOTS" CONTENT="NOINDEX"><META HTTP-EQUIV="Content-Type" content="text/html; charset=GB2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>
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




<body bgcolor="#FFFFFF" text="#000000"><font face="����">

<% 
' ����Ƿ������������� 
If IsNumeric(Request("APR")) Then 
' ȷ������ȷ
If Request("APR") > 1 Then 
APR = Request("APR") / 100 
Else 
APR = Request("APR") 
End If 
Else 
APR = 0 
End If 

' ����Ƿ������˸���ֵ�� 
If IsNumeric(Request("TotPmts")) Then 
TotPmts = Request("TotPmts") 
Else 
TotPmts = 0 
End If

' ����Ƿ��������ܸ���ֵ��
If IsNumeric(Request("Payment")) Then 
Payment = Request("Payment") 
Else 
Payment = 0 
End If 

' ����Ƿ�����������ֵ��
If IsNumeric(Request("PVal")) Then 
PVal = Request("PVal") 
Else 
PVal = 0 
End If

'����û��Ƿ������³�����ĩ����
If Request("PayType") = "Beginning" Then 
PayType = 1 ' �³��ڼ� 
Else 
PayType = 0 ' ��ĩ�ڼ� 
End If 

' ����һ�� Finance ����ʵ�� 
 Set Finance = Server.CreateObject("MS.Finance") 

' ʹ�øղŵ� Finance ����ʵ�������� 
' ͨ�� HTML ���� CalcFV ���� 
' �ύ�Ĵ���ƻ��������õ���ֵ 
FVal = Finance.CalcFV(APR / 12, TotPmts, -Payment, -PVal, PayType) 
%>

<h3><A NAME="H3_37661593"></A>���Ĵ����ֵ <%= FormatCurrency(FVal )%>.</h3>



</FONT>
</BODY> 
</HTML> 
