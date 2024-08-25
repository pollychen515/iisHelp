<%@ LANGUAGE = JScript %>
<html dir=ltr><HEAD><TITLE>预期值计算</TITLE>

<META NAME="ROBOTS" CONTENT="NOINDEX"><META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
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





<body bgcolor="#FFFFFF" text="#000000"><font face="Verdana,Arial,Helvetica">


<% 
// 检查是否输入了年利率  
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

// 检查是否输入了总付款值。
var totpmnt = Request("TotPmts")(1);
var tp = IsNumeric(totpmnt);
if (tp == true) 
   {
  var TotPmts = totpmnt;
    }
else 
  var TotPmts = 0; 


// 检查是否输入了总付款值。
var pymnt = Request("Payment")(1);
var ts = IsNumeric(pymnt);
if (ts == true) 
   {
  var Payment = pymnt; 
   }
else 
var Payment = 0; 


//  检查是否输入了帐面值。
var payval = Request("PVal")(1);
var tx = IsNumeric(payval);
if (tx== true) {
var PVal = payval;  
}
else 
var PVal = 0;

//检查用户是否想在月初或月末付款
var ptype = Request("PayType")(1);
if (ptype == "月初期间") 
  {
  var PayType = 1;  
  }
else 
  var PayType = 0;

// 创建一个 Finance 对象实例 
Finance = Server.CreateObject("MS.Finance.Java");   

    
//使用刚才的 Finance 对象实例来计算
//通过 HTML 表单和 CalcFV 方法
//提交的储蓄计划所期望得到的值 

FVal = Finance.CalcFV(APR / 12, TotPmts, -Payment, -PVal, PayType) 

var Savings = NumFormat(FVal);

//用于确定表单值是数字的函数。
function IsNumeric(str) {
  for (var i=0; i < str.length; i++){
    var ch = str.substring(i, i+1)          
    if( ch < "0" || ch>"9" || str.length == null){
      return false;
    }
  }
  return true;
}

//用于限制将值返回到小数点后两位的函数。
function NumFormat(str) {
        str = "" + str + "00";      
        return (str.substring (0, str.indexOf (".") + 3));
    }


%>

<h3><A NAME="H3_37662227"></A>您的储蓄将会值 $ <%= Savings%>.</h3>



</FONT>

</BODY> 
</HTML> 
