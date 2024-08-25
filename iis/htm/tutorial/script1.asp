<H2><A NAME="H2_37673651"></A>表单示例</H2>

<p>请先填写以下信息，然后再按“提交”按钮：
<FORM METHOD="POST" ACTION="iiatmd1.asp#script1"><br>
名字： <INPUT NAME="fname" SIZE="48"><br>
姓氏： <INPUT NAME="lname" SIZE="48"><br>
称谓： <INPUT NAME="title" TYPE=RADIO VALUE="mr">先生
        <INPUT NAME="title" TYPE=RADIO VALUE="ms">女士
<br><input type="submit" name="Submit" value="提交"><input type="reset" name="Reset" value="重置">
</p>

</FORM>
<% If Request.Form("lname")<>"" then %>
<br>
<center>
<table border=2><tr><td>
<H2><A NAME="H2_37674177"></A><CENTER>感谢您</CENTER></H2>
<P ALIGN=CENTER>
感谢您的订货， 
<%Title = Request.Form("title") 
	LastName = Request.Form("lname") 
	If Title = "mr" Then%> 
		Mr. <%=LastName%>, 
	<%ElseIf Title = "ms" Then%> 
		Ms. <%=LastName%>, 
	<%Else%>
		<%=Request.Form("fname") & " " & LastName %>
	<%End If%>
。<BR>
</td></tr></table></center></p>
<%End if %>


