<%@ LANGUAGE = JScript %>
<html dir=ltr><HEAD><TITLE>Ԥ��ֵ����</TITLE>

<META NAME="ROBOTS" CONTENT="NOINDEX"><META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
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





<body bgcolor="#FFFFFF" text="#000000"><font face="Verdana,Arial,Helvetica">


<% 
// ����Ƿ�������������  
var rate = Request("APR")(1);
if (rate.substring(0,1) == "." )
  rate = "0" + rate;
var v = IsNumeric(rate);
if  (v == true)
   {
    if (rate > 1) 
    {
    var APR = rate / 100; 
     }
  else 
    var APR = rate;    
  }
else 
  var APR = 0; 

// ����Ƿ��������ܸ���ֵ��
var totpmnt = Request("TotPmts")(1);
var tp = IsNumeric(totpmnt);
if (tp == true) 
   {
  var TotPmts = totpmnt;
    }
else 
  var TotPmts = 0; 


// ����Ƿ��������ܸ���ֵ��
var pymnt = Request("Payment")(1);
var ts = IsNumeric(pymnt);
if (ts == true) 
   {
  var Payment = pymnt; 
   }
else 
var Payment = 0; 


//  ����Ƿ�����������ֵ��
var payval = Request("PVal")(1);
var tx = IsNumeric(payval);
if (tx== true) {
var PVal = payval;  
}
else 
var PVal = 0;

//����û��Ƿ������³�����ĩ����
var ptype = Request("PayType")(1);
if (ptype == "�³��ڼ�") 
  {
  var PayType = 1;  
  }
else 
  var PayType = 0;

// ����һ�� Finance ����ʵ�� 
Finance = Server.CreateObject("MS.Finance.Java");   

    
//ʹ�øղŵ� Finance ����ʵ��������
//ͨ�� HTML ���� CalcFV ����
//�ύ�Ĵ���ƻ��������õ���ֵ 

FVal = Finance.CalcFV(APR / 12, TotPmts, -Payment, -PVal, PayType) 

var Savings = NumFormat(FVal);

//����ȷ����ֵ�����ֵĺ�����
function IsNumeric(str) {
  for (var i=0; i < str.length; i++){
    var ch = str.substring(i, i+1)          
    if( ch < "0" || ch>"9" || str.length == null){
      return false;
    }
  }
  return true;
}

//�������ƽ�ֵ���ص�С�������λ�ĺ�����
function NumFormat(str) {
        str = "" + str + "00";      
        return (str.substring (0, str.indexOf (".") + 3));
    }


%>

<h3><A NAME="H3_37662227"></A>���Ĵ����ֵ $ <%= Savings%>.</h3>



</FONT>

</BODY> 
</HTML> 
