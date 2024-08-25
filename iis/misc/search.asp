<HTML>
<HEAD>
    <TITLE>ASP 搜索表单</TITLE>

<META NAME="ROBOTS" CONTENT="NOINDEX">

<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">

<Script Language="JavaScript">
<!--
function ChangeList(y,z) {

top.contents.location.href="search.asp?Searchset="+(y)+"&SearchString="+(z);

}

//-->
</Script>

</HEAD>

<BODY bgcolor="#000000" onload="Activate()">
<font face="宋体">

<% MachType=Request.ServerVariables("HTTP_UA-CPU")
BrsType=Request.ServerVariables("HTTP_User-Agent")

If MachType="Alpha" Then
	ContHref="contalph.asp"
Else
	ContHref="Contents.asp"
End If

If InStr(BrsType, "MSIE") Then
	IndxHref="Index.asp"
Else
	ContHref="Coflat.htm"
	IndxHref="Inflat.htm"
End If
 %>

<SPAN STYLE="position:  relative; left: 0; top: 4">
<A HREF="<%= ContHref%>"><IMG SRC="NoCont.gif" border="0" alt="目录"></A><A HREF="<%= IndxHref%>"><IMG SRC="NoIndex.gif" border="0" alt="索引"></A><IMG SRC="Search.gif" border="0" alt="搜索">
</SPAN>

<Script Language="JavaScript">
<!--
function Activate() {
      document.iissrch.SearchString.focus();
}

//-->
</Script>
<TABLE bgcolor="#ffffff" width="262" height="82%" border="0">
<% SearchString=Request.QueryString("SearchString")%>
<% If SearchString="undefined" Then SearchString="" %>

<% SearchSet=Request.QueryString("SearchSet")%>
<% if SearchSet="" then SearchSet=0%>
<FORM ACTION="Query.asp?SearchType=<%=SearchSet%>" name="iissrch" id="iissrch" target="main" METHOD="POST">
<TR border="0" bgcolor="#ffffff" valign="top"><TD>
<IMG SRC="white.gif">
<font style="font-size:9pt">搜索：<br>
<INPUT TYPE="TEXTarea" NAME="SearchString" SIZE="27" MAXLENGTH="100" Value="<% =SearchString%>">
<table>
<tr><td width=65%></td><td>
<INPUT NAME="Action" TYPE="SUBMIT" VALUE="搜索"</td></tr><tr><td><font style="font-size:9pt">选择搜索类型:</font></td></tr></table>


<%If SearchSet=0 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Selected=True Value="1">标准搜索
<Option Value="2">精确词组
<Option Value="3">所有词
<Option Value="4">任意词
<Option Value="5">逻辑搜索
</Select>
<%End If%>

<%If SearchSet=1 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">标准搜索
<Option Selected=True Value="2">精确词组
<Option Value="3">所有词
<Option Value="4">任意词
<Option Value="5">逻辑搜索
</Select>
<%End If%>

<%If SearchSet=2 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">标准搜索
<Option Value="2">精确词组
<Option Selected=True Value="3">所有词
<Option Value="4">任意词
<Option Value="5">逻辑搜索
</Select>
<%End If%>

<%If SearchSet=3 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">标准搜索
<Option Value="2">精确词组
<Option Value="3">所有词
<Option Selected=True Value="4">任意词
<Option Value="5">逻辑搜索
</Select>
<%End If%>

<%If SearchSet=4 Then%>
<SELECT NAME="SearchType" ONCHANGE=ChangeList(SearchType.selectedIndex,SearchString.value)>
<Option Value="1">标准搜索
<Option Value="2">精确词组
<Option Value="3">所有词
<Option Value="4">任意词
<Option Selected=True Value="5">逻辑搜索
</Select>
<%End If%>




<%If SearchSet=0 Then%>
<div style="margin-left: -.25in">
<font style="font-size:9pt">
<ul>
<li>
键入一个词组或问题。
<li>
包含词的所有形式。
<li>通常命中率较高。
</div>

<br><b>示例:</b>
<div style="margin-left: .17in">
为多个站点服务<br>
设置目录权限<br>
iis 版本中的更改
</div>
</font>
<%End If%>

<%If SearchSet=1 Then%>
<div style="margin-left: -.25in">
<font style="font-size:9pt">
<ul>
<li>
按文字搜索。
<li>
不区分大小写，忽略大写。
</div>
<br><b>示例：</b>
<div style="margin-left: .17in">
身份验证<br>
ssl<br>
数据库 访问<br>
连接 池
</div>
</font>
<%End If%>

<%If SearchSet=2 Then%>
<div style="margin-left: -.25in">
<font style="font-size:9pt">
<ul>
<li>
词可以为任意顺序。
<li>
通常命中率不高。
</div>
<br><b>示例：</b>
<div style="margin-left: .17in">
名称 密码 帐号<br>
远程 管理 internet<br>
注册表 metabase 配置<br>
</div>
</font>
<%End If%>

<%If SearchSet=3 Then%>
<div style="margin-left: -.25in">
<font style="font-size:9pt">
<ul>
<li>
该词出现频率较高的主题将首先列出。
<li>
命中率通常较高。
</div>
<br><b>示例:</b>
<div style="margin-left: .17in">
安全 黑客 防火墙<br>
web 应用程序 脚本 asp<br>
用户 权利 权限 拒绝<br>
</div>
</font>

<%End If%>

<%If SearchSet=4 Then%>
<div style="margin-left: -.25in">
<font style="font-size:9pt">
<ul>
<li>
支持 AND、OR、NEAR 以及 NOT 运算符。
<li>
对纯文字字符串使用引号。
<li>
对复合条件使用括号。
</div>
<br><b>示例:</b>
<div style="margin-left: .17in">
证书 near 安装<br>
"iis 管理单元" and 管理<br>
(v-root or 虚拟) and (程序 or 应用程序)<br>
</div>
</font>

<%End If%>


<p>


<INPUT TYPE="hidden" NAME="CiResultsSize" value= "显示"><br>
<BR>

</TD></TR>
</FORM>
</TABLE>


</BODY>
</HTML>

