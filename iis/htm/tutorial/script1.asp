<H2><A NAME="H2_37673651"></A>��ʾ��</H2>

<p>������д������Ϣ��Ȼ���ٰ����ύ����ť��
<FORM METHOD="POST" ACTION="iiatmd1.asp#script1"><br>
���֣� <INPUT NAME="fname" SIZE="48"><br>
���ϣ� <INPUT NAME="lname" SIZE="48"><br>
��ν�� <INPUT NAME="title" TYPE=RADIO VALUE="mr">����
        <INPUT NAME="title" TYPE=RADIO VALUE="ms">Ůʿ
<br><input type="submit" name="Submit" value="�ύ"><input type="reset" name="Reset" value="����">
</p>

</FORM>
<% If Request.Form("lname")<>"" then %>
<br>
<center>
<table border=2><tr><td>
<H2><A NAME="H2_37674177"></A><CENTER>��л��</CENTER></H2>
<P ALIGN=CENTER>
��л���Ķ����� 
<%Title = Request.Form("title") 
	LastName = Request.Form("lname") 
	If Title = "mr" Then%> 
		Mr. <%=LastName%>, 
	<%ElseIf Title = "ms" Then%> 
		Ms. <%=LastName%>, 
	<%Else%>
		<%=Request.Form("fname") & " " & LastName %>
	<%End If%>
��<BR>
</td></tr></table></center></p>
<%End if %>


