<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 3.0//EN" "html.dtd">
<HTML>
<HEAD>

<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
<META NAME="ROBOTS" CONTENT="NOINDEX">

<%
' **********���ڿ����Զ����˵��**********
'
'�˱����ڼ򵥵��Զ��塣��������ͨ��
'�޸�һЩ�ļ��ͱ��������޸�
'ҳ�ձꡢҳ������ҳ�����Լ��򵥲�ѯ������
'������������Щ�޸ĵĹ��̡�
'
'
' ***�޸ı��ձ꣺

'���ձ�����Ϊ is2logo.gif��Ҫ����ҳ�ձֻ꣬��
'�����ձ� is2logo.gif ����˱�����ͬһĿ¼��
'����ձ겻�� GIF �ļ������߲��븴�Ƹ��ļ���
'����������У�ʹ�ձ��������ָ��ձ�� URL��

        FormLogo = "is2logo.gif"

'
' ***�޸ı��ı���ͼ����

'������ʹ�ñ���ͼ���򱳾���ɫ��
'���Ҫʹ�ñ���ͼ�����轫�ļ� is2bkgnd.gif
'����ļ��洢��ͬһĿ¼���������������
'ɾ��ע���ַ����������ַ�����Ȼ��ע�ͷ��ŷŵ�
'����ڶ��С�
'
'���Ҫʹ�ð�ɫ֮�������������ɫ��ֻ��༭
'����� bgcolor �У�����ɫ�滻Ϊ��ѡ�����ɫ��

'       FormBG = "background = " & chr(34) & "is2bkgnd.gif" & chr(34)
        FormBG = "bgcolor = " & chr(34) & "#FFFFFF" & chr(34)


' ***�޸ı������ı���

'��������������ñ��ı����ı���
%>

    <TITLE>�������</TITLE>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
//����Ƿ�Ϊ Microsoft ���������
		if (TempString.indexOf ("4.") >= 0){
//���������Ƿ�Ϊ IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
//����Ƿ�Ϊ Netscape ���������
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
	}
	else
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
//-->
</script>

<%
'
' ***�޸ı�������Χ��
'
'������ Web ���������ƿռ�ָ���ĸ�Ŀ¼
'��������ʾ��"/" �����·������ʼ������
'���磬���Ҫ�������������Ӽ������� PressReleases Ŀ¼��
'ֻ���޸�����ķ�Χ�������г�Ҫ����������·����
'��������ʼ������ָ����Ŀ¼����������Ŀ¼��

        FormScope = "/iishelp/iis"

'
' ***�޸ķ��ز�ѯ�����������
'
'������ʹ������ı���������
'����ҳ�Ϸ��صĲ�ѯ�����������

        PageSize = 10

'
' ***��������
'
'����������ò�ѯʹ�õ������ڶ�������£�
'��Ӧ�����������������ƥ�䡣�������������������

        SiteLocale = "ZH-CN"

' **********���������Զ��岿��***********
noise=",about,after,all,also,an,another,any,and,are,as,at,be,because,been,before,being,between,both,but,by,came,can,come,could,did,do,each,for,from,get,got,has,had,he,have,her,here,him,himself,his,how,if,in,into,is,it,like,make,many,me,might,more,most,much,must,my,never,near,now,of,on,only,or,other,our,out,over,said,same,see,should,since,some,still,such,take,than,that,the,their,them,then,there,these,they,this,those,through,to,too,under,up,very,was,way,we,well,were,what,where,which,while,who,with,would,you,your,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,$,1,2,3,4,5,6,7,8,9,0,_,!,&,~,|,?,I,"

punc2="$,1234567890_!&~|? #+()"
punc="$,1234567890_!&~|?#@%^+"
%>

<%
'���ó�ʼ����
    NewQuery = FALSE
    UseSavedQuery = FALSE
    SearchString = ""

'�û��ð� SUBMIT ��ťִ�б�������ǣ����ȡ��������
    if Request.ServerVariables("REQUEST_METHOD") = "POST" then
        SearchString = Request.Form("SearchString")
	SearchType=Request.QueryString("SearchType")
	if SearchString<>"" then
        Session("SearchStringDisplay")=SearchString
	end if
        FreeText = Request.Form("FreeText")
	QueryForm = "Query.Asp"
	CiResultsSize = Request.Form("CiResultsSize")
 	CiLimits = Request.Form("CiLimits")
        'ע�⣺ֻ��ȷʵ���°�ť���˴���Ϊ�档
        ' if Request.Form("Action") = "Search" then
            NewQuery = TRUE
	    if CiLimits = "on" then
			RankBase=50
	    else
			RankBase=1000
	    end if
        ' end if
    end if
    if Request.ServerVariables("REQUEST_METHOD") = "GET" then
        SearchString = Request.QueryString("SearchString")
	QueryForm = "Query.Asp"
	CiResultsSize = Request.QueryString("CiResultsSize")
                FreeText = Request.QueryString("FreeText")
                FormScope = Request.QueryString("sc")
				RankBase = Request.QueryString("RankBase")
        if Request.QueryString("pg") <> "" then
            NextPageNumber = Request.QueryString("pg")
            NewQuery = FALSE
            UseSavedQuery = TRUE
        else
            NewQuery = SearchString <> ""
        end if
    end if
%>

</HEAD>

<BODY <%=FormBG%>>

<%
  if NewQuery then
    set Session("Query") = nothing
    set Session("Recordset") = nothing
    NextRecordNumber = 1

	'ɾ�����������еı��
	for x = 1 to len(SearchString)
	   testpunc= mid(SearchString,x,1)
	   if instr(punc,testpunc) then
		SearchStringErr= SearchStringErr
	   else
		SearchStringErr = SearchStringErr + testpunc
	   end if
	next
	SearchString = SearchStringErr


  if SearchType=0 Then
	'ɾ���������������õĴ���
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
        CompSearch = "$CONTENTS " + SearchString
  end if
 
  if SearchType=1 Then
    CompSearch = chr(34) + SearchString + chr(34)
  end if

  if SearchType=2 Then
	'ɾ���������������õĴ���
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
	slen=len(SearchString)
	for k = 1 to slen
	slet = Mid(SearchString,k,1)
	  if slet <> " " then
            ss1=ss1+slet
	  else
	    ss1=ss1+ " AND "
	  end if
	Next
        CompSearch=ss1
	If Right(CompSearch,5) = " AND " Then CompSearch = Left(CompSearch,Len(CompSearch)-5)
  end if

 if SearchType=3 Then
	'ɾ���������������õĴ���
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
	slen=len(SearchString)
	for k = 1 to slen
	slet = Mid(SearchString,k,1)
	  if slet <> " " then
            ss1=ss1+slet
	  else
	    ss1=ss1+ " OR "
	  end if
	Next
        CompSearch=ss1
	If Right(CompSearch,4) = " OR " Then CompSearch = Left(CompSearch,Len(CompSearch)-4)
  end if

  if SearchType=4 Then
	'ɾ���������������õĴ���
	NCompare=""
	NewCompare=""
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare
    CompSearch = SearchString
  end if


    set Q = Server.CreateObject("ixsso.Query")
        set util = Server.CreateObject("ixsso.Util")

    Q.Query = CompSearch
    Q.Catalog = "Web" 
    Q.SortBy = "rank[d]"
    Q.Columns = "DocTitle, vpath, filename, size, write, characterization, rank"
	Q.MaxRecords = RankBase 

        if FormScope <> "/" then
                util.AddScopeToQuery Q, FormScope, "deep"
        end if

        if SiteLocale<>"" then
                Q.LocaleID = util.ISOToLocaleID(SiteLocale)
        end if
    On Error Resume Next
    set RS = Q.CreateRecordSet("nonsequential")

    RS.PageSize = PageSize
    Test = RS.PageSize
    ActiveQuery = TRUE



  elseif UseSavedQuery then
    if IsObject( Session("Query") ) And IsObject( Session("RecordSet") ) then
      set Q = Session("Query")
      set RS = Session("RecordSet")


      if RS.RecordCount <> -1 and NextPageNumber <> -1 then
        RS.AbsolutePage = NextPageNumber
        NextRecordNumber = RS.AbsolutePosition
      end if

      ActiveQuery = TRUE
    else
      Response.Write "���� - û�б����ѯ"
    end if
  end if


If Err<>424 Then

  if ActiveQuery then
    if not RS.EOF then
 %>

<p>
<HR WIDTH=80% ALIGN=center SIZE=3>
<%LastRecordOnPage = NextRecordNumber + RS.PageSize - 1
KLastRecordOnPage=LastRecordOnPage
If KLastRecordOnPage>RS.RecordCount Then KLastRecordOnPage=RS.RecordCount%>


<b>���������� <%=Session("SearchStringDisplay")%></b><br><br>
<b><font size="3">�� <%=NextRecordNumber%> - <%=KLastRecordOnPage%> ��������� <%=RS.RecordCount%> �����</b></font><br>
<p>

<%
        LastRecordOnPage = NextRecordNumber + RS.PageSize - 1
        CurrentPage = RS.AbsolutePage
        if RS.RecordCount <> -1 AND RS.RecordCount < LastRecordOnPage then
            LastRecordOnPage = RS.RecordCount
        end if

 %>

<%

%>

<% if Not RS.EOF and NextRecordNumber <= LastRecordOnPage then%>
		<table border=0>
<% end if %>

<%

Do While Not RS.EOF and NextRecordNumber <= LastRecordOnPage

        '�ⲿ�ְ�����ϸ��Ϣ������⡢˵����URL����С��
    '�Լ��޸����ڡ�



TmpExt = Server.HTMLEncode( RS("filename") )
FullExt = Right(TmpExt, 3)

If FullExt <> "cnt" and FullExt <> "hhc" and FullExt <> "hpj" and FullExt <> "hlp" and FullExt <> "rtf" and FullExt <> "asf" and FullExt <> "gid" and FullExt <> "fts" and FullExt <> "wmp" and FullExt <> "hhk" and FullExt <> "txt" and FullExt <> "ass" and FullExt <> "idq" and FullExt <> "ncr" and FullExt <> "ncl" and FullExt <> "url" and FullExt <> "css" and FullExt <> "prp" and FullExt <> "htx" and FullExt <> "htw" and FullExt <> "tmp" and FullExt <> "mdb" and FullExt <> "xls" and FullExt <> "chm" Then





    '����б��⣬����ʾ���⣬������ʾ�ļ�����
%>
    <p>
	<tr class="RecordTitle">
                	                
		
		
    	        <td><b><%=NextRecordNumber%>.</b></td>
		<b class="RecordTitle"> <td><b>
			<%if VarType(RS("DocTitle")) = 1 or RS("DocTitle") = "" then%>
				<a href="<%=RS("vpath")%>" class="RecordTitle"><%= Server.HTMLEncode( RS("filename") )%></a>
			<%else%>
				<a href="<%=RS("vpath")%>" class="RecordTitle"><%= Server.HTMLEncode(RS("DocTitle"))%></a>
			<%end if%>
		</b></b><br>
		
			<%if VarType(RS("characterization")) = 8 and RS("characterization") <> "" then%>
				<%= RS("characterization")%>
		
		<%end if%>
		<%if CiResultsSize = "on" then%>
                <%end if%>
		</td>
	</tr>
	<tr>
	</tr>



<%
else
   NextRecordNumber = NextRecordNumber-1
end if%>






<%
          RS.MoveNext
          NextRecordNumber = NextRecordNumber+1
      Loop
 %>

</table>

<P><BR>

<%
  else   ' NOT RS.EOF
      if NextRecordNumber <> 1 then
          Response.Write "�Ѳ�ѯ�������ĵ���<P>"
      end if

  end if ' NOT RS.EOF%>

<%
  if Q.QueryIncomplete then
'    �����Ϊ��ѯ��Ҫ�о٣�������ʹ����������������ѯ��
'    �� AllowEnumeration Ϊ FALSE �����²�ѯ�޷�ִ�У�
'    ��֪ͨ�û�%>

    <P>
    <B>��ѯ�޷���ɡ��������ύ��ѯ��<BR>��ϸ������Ϣ��AllowEnumeration ��������Ϊ TRUE ������ɴ˲�ѯ��</B><BR>
<%end if


  if Q.QueryTimedOut then
'    �����ѯִ��ʱ��̫�������磬Ҫִ�д����������ܽ�����ѯ����
'    ��֪ͨ�û�%>
    <P>
    <B>��ѯʱ��̫�����޷���ɡ�</B><BR>
<%end if%>


<TABLE>

<%
'    ���ǡ���һҳ����ť��
'    �⽫ת������ѯ�ĵ�����һҳ��
%>

<%SaveQuery = FALSE%>
<%if CurrentPage > 1 and RS.RecordCount <> -1 then %>
    <td align=left>
        <form action="<%=QueryForm%>" method="get">
            <INPUT TYPE="HIDDEN" NAME="SearchString" VALUE="<%=SearchString%>">
                        <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
	    <INPUT TYPE="HIDDEN" NAME="CiResultsSize" VALUE="<%=CiResultsSize%>">
            <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
            <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage-1%>" >
			<INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">
            <input type="submit" value="<< ��һҳ">
        </form>
    </td>
        <%SaveQuery = TRUE%>
<%end if%>


<%
'    ���������������ѯ�ġ���һҳ����ť��
'    �⽫ת������ѯ�ĵ�����һҳ��

  if Not RS.EOF then%>
    <td align=right>
        <form action="<%=QueryForm%>" method="get">
            <INPUT TYPE="HIDDEN" NAME="SearchString" VALUE="<%=SearchString%>">
                        <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
	    <INPUT TYPE="HIDDEN" NAME="CiResultsSize" VALUE="<%=CiResultsSize%>">
            <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
            <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage+1%>" >
			<INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">

                <% NextString = "��һҳ >>"%>
            <input type="submit" value="<%=NextString%>">
        </form>
    </td>
    <%SaveQuery = TRUE%>
<%end if%>

</TABLE>

<% '��ʾҳ��%>
 <%if RS.RecordCount = 0 then%>
        û���롰<%=SearchString%>��ƥ����ĵ���<br><br>

	��������Ҫ��
	<UL><LI>�����֪ͨ���� <a href="mailto:iisdocs@microsoft.com?subject=<%=SearchString%>-search%20term%20not%20matched&body=The%20term%20'<%=SearchString%>'%20produced%20no%20matches.">(mailto:iisdocs@microsoft.com)</a>���Ա��������Ժ�İ汾�иĽ�����������
	<LI>������������������
	<LI>�ټ��һ��ƴд���﷨��
	<LI>����������������ѡ���ʹ�ñ�׼��������ȷ���顢����ʡ����д��Լ��߼���������
	</UL>
    <%else%>

�� <%=CurrentPage%> ҳ
<%if RS.PageCount <> -1 then
     Response.Write "���� " & RS.PageCount & " ҳ��"
  end if %>
<%end if%>

<%
    '�����ʾ����һҳ���򡰺��ˡ���ť���򽫲�ѯ
    '�� recordset ���浽�Ự�����С�
    if SaveQuery then
        set Session("Query") = Q
        set Session("RecordSet") = RS
    else
        RS.close
        Set RS = Nothing
        Set Q = Nothing
        set Session("Query") = Nothing
        set Session("RecordSet") = Nothing
    end if
 %>
<% end if %>


</BODY>
</HTML>
<%else%>
<%


	'ɾ���������������õĴ���
	NCompare=""
	NewCompare=""
	SearchStringComp=SearchString+" "
	for x = 1 to len(SearchStringComp)
	if mid(SearchStringComp,x,1)=" " Then
		ncompare2 = ","+ncompare+","
		if instr(noise,ncompare2) = 0 then
			NewCompare=NewCompare+" "+ncompare
		End If
		ncompare=""
	else
		ncompare=ncompare+mid(SearchString,x,1)
	end if
	next    	
	x = len(NewCompare)
	if left(NewCompare,1) = " " Then
	   NewCompare = right(NewCompare,(x-1))
	end if
	SearchString=NewCompare

	'ɾ�����������еı��
	SearchStringErr = ""
	for x = 1 to len(SearchString)
	   testpunc= mid(SearchString,x,1)
	   if instr(punc2,testpunc) then
		SearchStringErr= SearchStringErr
	   else
		SearchStringErr = SearchStringErr + testpunc
	   end if
	next
	SearchString = SearchStringErr
	CompSearch=SearchString

%>


<%if SearchString = "" or instr(SearchString,"*") or instr(CompSearch,")") or instr(CompSearch,"(") or right(CompSearch,3)="OR " or right(CompSearch,4)="AND " then%>
<b>���������޷��������Ĳ�ѯ��<p></b><br>

���д��ѯȻ�����ԡ�һЩ���ôʣ��硰��ȡ���͡���ࡱ�ȣ�û�б������������ң���Ҫ�ڲ�ѯ��ʹ�ñ����ţ����š���ŵȣ���

<%else%>

û��������������<p>
*<%=CompSearch%>*
<br>


Ҫ�� IIS �ĵ�ִ��������ѯ����������������������<br>
&nbsp;<p>
Ҫ������������
<ol>
<li>������ IIS �ļ�����ϣ��Ҽ��������ҵĵ��ԡ�ͼ�꣬Ȼ�󵥻���������<p>
<li>�� MMC ��չ���������Ӧ�ó��򡱽ڵ㡣<p>
<li>ѡ���������񡱡�</p>
<li>�������������˵���Ȼ�󵥻�����������<p>
</ol>&nbsp;<p>
ע�⣺�������������Ҫ������������ IIS �ĵ�Ŀ¼��<p>
Ҫ��Զ�̲鿴�ĵ�ʱʹ�á������������ṩ�ĵ��ļ�����ϱ���������������������������������������� Web վ�����Ա��ϵ��
<%end if%>
<% end if %>

