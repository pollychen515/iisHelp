<!DOCTYPE HTML PUBLIC "-//IETF//DTD HTML 3.0//EN" "html.dtd">
<HTML>
<HEAD>

<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
<META NAME="ROBOTS" CONTENT="NOINDEX">

<%
' **********关于快速自定义的说明**********
'
'此表单用于简单的自定义。它允许您通过
'修改一些文件和表单变量来修改
'页徽标、页背景、页标题以及简单查询参数。
'下面解释完成这些修改的过程。
'
'
' ***修改表单徽标：

'表单徽标名称为 is2logo.gif。要更改页徽标，只需
'命名徽标 is2logo.gif 并与此表单放在同一目录。
'如果徽标不是 GIF 文件，或者不想复制该文件，
'则更改下列行，使徽标变量包含指向徽标的 URL。

        FormLogo = "is2logo.gif"

'
' ***修改表单的背景图案。

'表单可以使用背景图案或背景颜色。
'如果要使用背景图案，需将文件 is2bkgnd.gif
'与此文件存储在同一目录，并从下面的行中
'删除注释字符（单引号字符）。然后将注释符号放到
'下面第二行。
'
'如果要使用白色之外的其他背景颜色，只需编辑
'下面的 bgcolor 行，将白色替换为您选择的颜色。

'       FormBG = "background = " & chr(34) & "is2bkgnd.gif" & chr(34)
        FormBG = "bgcolor = " & chr(34) & "#FFFFFF" & chr(34)


' ***修改表单标题文本。

'下面的行用来设置表单的标题文本。
%>

    <TITLE>搜索结果</TITLE>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
//检查是否为 Microsoft 的浏览器器
		if (TempString.indexOf ("4.") >= 0){
//检查浏览器是否为 IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
//检查是否为 Netscape 的浏览器器
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
	}
	else
		document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
//-->
</script>

<%
'
' ***修改表单搜索范围。
'
'表单将从 Web 服务器名称空间指定的根目录
'（如下所示，"/" 后面的路径）开始搜索。
'例如，如果要搜索服务器的子集，比如 PressReleases 目录，
'只需修改下面的范围变量并列出要搜索的虚拟路径。
'搜索将开始搜索您指定的目录及其所有子目录。

        FormScope = "/iishelp/iis"

'
' ***修改返回查询结果的数量。
'
'您可以使用下面的变量，设置
'单个页上返回的查询结果的数量。

        PageSize = 10

'
' ***设置区域。
'
'下面的行设置查询使用的区域。在多数情况下，
'它应与服务器的区域设置匹配。您可以设置下面的区域。

        SiteLocale = "ZH-CN"

' **********结束快速自定义部分***********
noise=",about,after,all,also,an,another,any,and,are,as,at,be,because,been,before,being,between,both,but,by,came,can,come,could,did,do,each,for,from,get,got,has,had,he,have,her,here,him,himself,his,how,if,in,into,is,it,like,make,many,me,might,more,most,much,must,my,never,near,now,of,on,only,or,other,our,out,over,said,same,see,should,since,some,still,such,take,than,that,the,their,them,then,there,these,they,this,those,through,to,too,under,up,very,was,way,we,well,were,what,where,which,while,who,with,would,you,your,a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,$,1,2,3,4,5,6,7,8,9,0,_,!,&,~,|,?,I,"

punc2="$,1234567890_!&~|? #+()"
punc="$,1234567890_!&~|?#@%^+"
%>

<%
'设置初始条件
    NewQuery = FALSE
    UseSavedQuery = FALSE
    SearchString = ""

'用户用按 SUBMIT 按钮执行表单吗？如果是，则获取表单变量。
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
        '注意：只有确实按下按钮，此处才为真。
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

	'删除搜索条件中的标点
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
	'删除搜索条件中无用的词语
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
	'删除搜索条件中无用的词语
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
	'删除搜索条件中无用的词语
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
	'删除搜索条件中无用的词语
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
      Response.Write "错误 - 没有保存查询"
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


<b>您搜索的是 <%=Session("SearchStringDisplay")%></b><br><br>
<b><font size="3">第 <%=NextRecordNumber%> - <%=KLastRecordOnPage%> 个结果，共 <%=RS.RecordCount%> 个结果</b></font><br>
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

        '这部分包含详细信息，如标题、说明、URL、大小、
    '以及修改日期。



TmpExt = Server.HTMLEncode( RS("filename") )
FullExt = Right(TmpExt, 3)

If FullExt <> "cnt" and FullExt <> "hhc" and FullExt <> "hpj" and FullExt <> "hlp" and FullExt <> "rtf" and FullExt <> "asf" and FullExt <> "gid" and FullExt <> "fts" and FullExt <> "wmp" and FullExt <> "hhk" and FullExt <> "txt" and FullExt <> "ass" and FullExt <> "idq" and FullExt <> "ncr" and FullExt <> "ncl" and FullExt <> "url" and FullExt <> "css" and FullExt <> "prp" and FullExt <> "htx" and FullExt <> "htw" and FullExt <> "tmp" and FullExt <> "mdb" and FullExt <> "xls" and FullExt <> "chm" Then





    '如果有标题，则显示标题，否则显示文件名。
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
          Response.Write "已查询完所有文档。<P>"
      end if

  end if ' NOT RS.EOF%>

<%
  if Q.QueryIncomplete then
'    如果因为查询需要列举（而不是使用索引）来解析查询、
'    但 AllowEnumeration 为 FALSE 而导致查询无法执行，
'    则通知用户%>

    <P>
    <B>查询无法完成。请重新提交查询。<BR>详细技术信息：AllowEnumeration 必须设置为 TRUE 才能完成此查询。</B><BR>
<%end if


  if Q.QueryTimedOut then
'    如果查询执行时间太长（例如，要执行大量工作才能解析查询），
'    则通知用户%>
    <P>
    <B>查询时间太长，无法完成。</B><BR>
<%end if%>


<TABLE>

<%
'    这是“上一页”按钮。
'    这将转到所查询文档的上一页。
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
            <input type="submit" value="<< 上一页">
        </form>
    </td>
        <%SaveQuery = TRUE%>
<%end if%>


<%
'    这是用于无排序查询的“下一页”按钮。
'    这将转到所查询文档的下一页。

  if Not RS.EOF then%>
    <td align=right>
        <form action="<%=QueryForm%>" method="get">
            <INPUT TYPE="HIDDEN" NAME="SearchString" VALUE="<%=SearchString%>">
                        <INPUT TYPE="HIDDEN" NAME="FreeText" VALUE="<%=FreeText%>">
	    <INPUT TYPE="HIDDEN" NAME="CiResultsSize" VALUE="<%=CiResultsSize%>">
            <INPUT TYPE="HIDDEN" NAME="sc" VALUE="<%=FormScope%>">
            <INPUT TYPE="HIDDEN" name="pg" VALUE="<%=CurrentPage+1%>" >
			<INPUT TYPE="HIDDEN" NAME = "RankBase" VALUE="<%=RankBase%>">

                <% NextString = "下一页 >>"%>
            <input type="submit" value="<%=NextString%>">
        </form>
    </td>
    <%SaveQuery = TRUE%>
<%end if%>

</TABLE>

<% '显示页码%>
 <%if RS.RecordCount = 0 then%>
        没有与“<%=SearchString%>”匹配的文档。<br><br>

	您可能需要：
	<UL><LI>将情况通知我们 <a href="mailto:iisdocs@microsoft.com?subject=<%=SearchString%>-search%20term%20not%20matched&body=The%20term%20'<%=SearchString%>'%20produced%20no%20matches.">(mailto:iisdocs@microsoft.com)</a>，以便我们在以后的版本中改进“搜索”。
	<LI>检查相关条件的索引。
	<LI>再检查一遍拼写和语法。
	<LI>尝试其他“搜索”选项（可使用标准搜索、精确词组、任意词、所有词以及逻辑搜索）。
	</UL>
    <%else%>

第 <%=CurrentPage%> 页
<%if RS.PageCount <> -1 then
     Response.Write "（共 " & RS.PageCount & " 页）"
  end if %>
<%end if%>

<%
    '如果显示“上一页”或“后退”按钮，则将查询
    '和 recordset 保存到会话变量中。
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


	'删除搜索条件中无用的词语
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

	'删除搜索条件中的标点
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
<b>索引服务无法处理您的查询。<p></b><br>

请改写查询然后重试。一些常用词（如“获取”和“许多”等）没有编入索引。而且，不要在查询中使用标点符号（逗号、句号等）。

<%else%>

没有启动索引服务<p>
*<%=CompSearch%>*
<br>


要对 IIS 文档执行搜索查询，必须首先启动索引服务。<br>
&nbsp;<p>
要启动索引服务，
<ol>
<li>在运行 IIS 的计算机上，右键单击“我的电脑”图标，然后单击“管理”。<p>
<li>在 MMC 中展开“服务和应用程序”节点。<p>
<li>选择“索引服务”。</p>
<li>单击“操作”菜单，然后单击“启动”。<p>
</ol>&nbsp;<p>
注意：索引服务可能需要几分钟来编制 IIS 文档目录。<p>
要在远程查看文档时使用“搜索”，则提供文档的计算机上必须在运行索引服务。如果不能启动索引服务，请与 Web 站点管理员联系。
<%end if%>
<% end if %>

