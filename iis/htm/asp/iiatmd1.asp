<!-- saved from url=(0022)http://internet.e-mail -->
<!-- 从 url=(0022)http://internet.e-mail 保存下来 -->
<%@ Language=VBScript EnableSessionState=False %>
<%
  Response.Expires = 0
  LessonFile = Request.ServerVariables("SCRIPT_NAME")

  ScriptLanguagePreference = Request.Cookies("ScriptLanguagePreference")

  If ScriptLanguagePreference = "" Then
    ScriptLanguagePreference = Request.QueryString("ScriptLanguagePreference")
    If ScriptLanguagePreference = "" Then
      Response.Redirect "/iishelp/iis/htm/asp/iiselect.asp?LessonFile=" & Server.URLEncode(LessonFile)
    End If
  End If


'确定当前网页的物理路径，然后
'删除路径中的文件名（只留下目录）。
MainPath = Request.ServerVariables("PATH_TRANSLATED")
Length = Len(MainPath)
i = 0
Do Until (i  = 2)
  Do While (Mid(MainPath, Length, 1) <> "\")
    Length = Length - 1      
  Loop  
i = i + 1
MainPath = left(MainPath, (Length-1)) 
Loop
FilePath = left(MainPath, Length) + "\tutorial"


'确定当前网页的虚拟路径，然后删除
'路径中的文件名（只留下目录）。
MainPath = Request.ServerVariables("PATH_INFO")
 
Length = Len(MainPath)
i = 0
Do Until (i  = 2)
  Do While (Mid(MainPath, Length, 1) <> "/")
    Length = Length - 1      
  Loop  
i = i + 1
MainPath = left(MainPath, (Length-1)) 
Loop
VirtFilePath = left(MainPath, Length) + "/tutorial"

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html dir=ltr><head><title>模块 1：创建 ASP 页</title>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
//检查是否为 Microsoft 的浏览器器
		if (TempString.indexOf ("4.") >= 0){
//检查是否为 IE 4
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

<SCRIPT LANGUAGE="VBScript">
<!--
Sub Window_OnLoad()
   Dim frmContents
   On Error Resume Next
   If Not Parent Is Nothing Then
      Set frmContents = Parent.Contents
      If Not frmContents Is Nothing Then
            frmContents.Window.TOCSynch_Click
      End If
   End If
End Sub
//--></SCRIPT>

<META NAME="DESCRIPTION" CONTENT="这是一个 Active Server Pages (ASP) 教程，您可以通过创建自己的 ASP 页 (.asp 文件) 来学习一些 ASP 基础。">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>

<body bgcolor="#FFFFFF" text="#000000"><font face="宋体">


<h1><a name="module1">模块 1：创建 ASP 页</a></h1>


<p><a href="iiselect.asp?LessonFile=<%= Server.URLEncode(LessonFile)%>"><strong>选择本课程使用的脚本语言</strong></a></p>

<p>在此模块中，您将通过创建自己的 ASP 页（.asp 文件）来学习 ASP。这些课程所用的示例文件位于 <%= Request.ServerVariables("SERVER_NAME")%> Web 服务器的 Tutorial 目录 (<%=FilePath%>) 中。您创建的文件也将保存在 Tutorial 目录中。</p>

<p><strong><a name="note"><span style="color: #0000FF"><font color="#0000FF">要点</font> </span></a></strong>&nbsp;&nbsp;&nbsp;要在此模块中保存和查看您的工作，必须对 Web 服务器（已安装 Active Server Pages）上的<%= VirtFilePath %>虚拟目录<%= Request.ServerVariables("SERVER_NAME")%>启用“写”和“脚本”Web 服务器权限。详细信息，请参阅<a href="../core/iiwspsc.htm">设置 Web 服务器权限</a>。</p>

<hr>

<h2><a name="creatingasimpleactivexpage">课程 1：创建简单 ASP 页</a></h2>

<p>学习 ASP 页的最佳途径就是编写自己的网页。要创建 ASP 页，可以使用文本编辑器将脚本命令插入 HTML 页中。使用 .asp 文件扩展名保存文件以通知 ASP 处理脚本命令。要查看脚本结果，只需使用 HTTP 协议通过 Web 浏览器请求该网页即可，在本例中为 http://<%= Request.ServerVariables("SERVER_NAME")%><%= VirtFilePath %>/<em>filename.asp</em>。在此课程中，您可以将此指南中的 HTML 和 ASP 脚本命令复制到文本编辑器中，创建流行的 &#147;Hello World!&#148; 脚本。保存文本编辑器中的文件后，即可使用浏览器查看脚本输出。</p>

<p>下面 HTML 创建包含“Hello World!”（大字体）的简单网页：</p>

<pre>
&lt;HTML&gt;
  &lt;BODY&gt;
    &lt;FONT SIZE=7&gt; 
      Hello World!&lt;BR&gt; 
    &lt;/FONT&gt; 
  &lt;/BODY&gt;
&lt;/HTML&gt;</pre>

<p>假设您希望重复显示此文本，并且在每次显示时增大字体的大小。为此，您可以重复使用 font 标记和 HTML 文本，并且每次重复使用不同的字体大小。当浏览器打开 HTML 页时，这一行文字将多次重复显示。</p>

<p>另外，您可以使用 ASP 以更复杂的动态方式生成与此相同的内容。</p>

<h3><a name="createandsaveapage">创建和保存网页</a></h3>

<ol>
<li>启动文本编辑器（如记事本）。放置好该文本编辑器窗口和浏览器窗口，以便可以同时查看两个窗口的内容。</li>
<li>将下列 HTML 标记复制并粘贴到文件的顶部：</li>

<pre>&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;
&lt;HTML&gt;
  &lt;BODY&gt; </pre>

<p>注意，第一个标记是特殊的 ASP 标记，用来将默认脚本语言设置为 <%=ScriptLanguagePreference%>。必须确保在所有的 .asp 文件中将此标记添加到第一行。</p>

<li>将文档作为 Hello.asp 保存在 <%= Request.ServerVariables("SERVER_NAME")%>Web 服务器的 Tutorial 目录(<%=FilePath%>)中。如果您使用的是字处理程序（包括写字板），则必须以文本格式保存文件。ASP 页必须使用 .asp 扩展名才能正常工作。</li>

<p>如果其他用户已经创建了 Hello.asp 文件并完成指南中的这一部分，请用您新版本的 Hello.asp 文件替换旧版本文件。</p>

<li>在 <code>&lt;BODY&gt;</code> 标记后开始一新行，并复制和粘贴下面的脚本命令：
<%
  If ScriptLanguagePreference = "JScript" Then
%>
<pre>&lt;%
    for (i = 3; i <=7;  i++)
    {
%&gt; </pre>


<%Else%>
<pre>&lt;% For i = 3 To 7 %&gt; </pre>



<% End If %><p>脚本命令位于 <code>&lt;%</code> 和 <code>%&gt;</code> 字符（也称为分隔符）内部。分隔符内部的文本被当作脚本命令处理。结束分隔符后面的任何文本都在浏览器中显示为 HTML 文本。此脚本命令开始于 <%=ScriptLanguagePreference%> 循环，该循环控制短语 &#147;Hello World!&#148; 显示的次数。第一次循环结束后，计数器变量 (<code>i</code>) 设置为 3。循环重复第二次后，计数器设置为 4。循环将一直重复下去，直到计数器 <%
  If ScriptLanguagePreference = "JScript" Then
%>等于<%Else%>大于<% End If %> 7。</p>

<li>按 Enter 键，然后复制和粘贴下列行：</li>

<pre>&lt;FONT SIZE=&lt;% = i %&gt;&gt; </pre>

<p>每次执行循环时，字体大小分别设置为计数器变量 (<code>i</code>) 的当时值。这样，第一次显示文本时，字体大小为 3。第二次，字体大小为 4。最后一次，字体大小为 7。注意，脚本命令可以位于 HTML 标记内部。</p>

<li>按 Enter 键，然后复制和粘贴下列行：</li>

<pre>Hello World!&lt;BR&gt;
  &lt;/FONT&gt;
  <%  If ScriptLanguagePreference = "JScript" Then
%>&lt;% } %&gt;<%Else%>&lt;% Next %&gt;<% End If %>
  &lt;/BODY&gt;
&lt;/HTML&gt;</pre>

<p><%
  If ScriptLanguagePreference = "JScript" Then
%>JScript 大括号 ({ }) 内部包含循环中重复的内容（只要计数器小于等于 7 即重复）。<%Else%>VBScript“Next”命令重复循环（直到计数器大于 7）。<% End If %></p>



<li>完成的文件 (Hello.asp) 现在应包含下列文本：</li>

<pre>
&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;
&lt;HTML&gt;
  &lt;BODY&gt;
  <%
  If ScriptLanguagePreference = "JScript" Then
%>&lt;%
    for (i = 3; i <=7;  i++)
    {
  %&gt;<%Else%>&lt;% For i = 3 To 7 %&gt; <% End If %>
    &lt;FONT SIZE=&lt;% = i %&gt;&gt; 
     Hello World!&lt;BR&gt;
    &lt;/FONT&gt;
  <%  If ScriptLanguagePreference = "JScript" Then
%>&lt;% } %&gt;<%Else%>&lt;% Next %&gt;<% End If %>
  &lt;/BODY&gt;
&lt;/HTML&gt;</pre>


<li>保存更改。确保按文本格式以 .asp 为扩展名保存文件。</li>

<p>在“保存”对话框中选择“文本格式”时，一些文本编辑器会自动将扩展文件名更改为 .txt。如果出现这种情况，请在单击“保存”之前将 .txt 扩展名替换为 .asp 扩展名。</p>


<li>退出文本编辑器。浏览器可能无法请求正在文本编辑器中打开的 HTML 页。</li>

<li>要查看工作结果（查看后您可以单击浏览器中的“后退” 按钮返回到此指南中），可将浏览器指向 <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/hello.asp"> http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/hello.asp</a>。</li>

<p>您应该看到在网页中显示五次 &#147;Hello World!&#148; ，并且每次字体都会增大。</p>


</ol>

<p>恭喜！您已经完成第一个 ASP 页。如您所学的那样，创建 ASP 页的过程非常简单。您可以使用任何文本编辑器创建 HTML 内容和 ASP 脚本命令（包含在 <code>&lt;%</code> 和 <code>%&gt;</code> 分隔符内部），但文件必须使用 .asp 扩展名。要测试网页并查看结果，可以在 Web 浏览器中请求该页（或刷新先前打开的该页）。</p>

<hr>

<h2><a name="creatinganhtmlform">课程 2：创建 HTML 表单</a></h2>

<p>Intranet 和 Internet 服务器应用程序的一个常见用途就是处理由浏览器提交的表单。在以前，您需要编写程序来处理表单提交的数据。使用 ASP，您可以通过将以 <%=ScriptLanguagePreference%> 编写的脚本直接嵌入 HTML 文件来处理表单。ASP 处理脚本命令并将结果返回浏览器。</p>

<p>在本课程中，将处理用户通过 HTML 表单提交的数据。</p>

<p>要查看 .asp 文件如何工作，请填写下面的表单。可以使用 Tab 键在表单里移动。单击<a name="script1">提交</a>按钮将数据发送到 Web 服务器，由 ASP 进行处理。</p>

<hr>
<!--  #include virtual="/iishelp/iis/htm/tutorial/script1.asp" -->


<h4><a name="H4_37672054">创建表单</a></h4>

<p>我们已经创建了用来请求用户信息的表单；您可以在 Tutorial 目录中的 Form.htm 文件内找到该表单。(<%= VirtFilePath%>)：</p>

<pre>&lt;HTML&gt;
&lt;HEAD&gt;&lt;TITLE&gt;订单&lt;/TITLE&gt;&lt;/HEAD&gt;

  &lt;BODY&gt;
   &lt;H2&gt;订单表单范例&lt;/H2&gt;
   &lt;P&gt;
   请提供下列信息，然后单击"提交"：
		
   &lt;FORM METHOD="POST" ACTION="response.asp"&gt;
    &lt;P&gt;
    名字：&lt;INPUT NAME="FirstName" SIZE="26"&gt;
    &lt;P&gt;
    姓氏：&lt;INPUT NAME="LastName" SIZE="26"&gt;
    &lt;P&gt;
    称谓：&lt;INPUT NAME="Title" TYPE=RADIO VALUE="mr"&gt;先生
    &lt;INPUT NAME="称谓" TYPE=RADIO VALUE="ms"&gt;女士
		
    &lt;P&gt;&lt;INPUT TYPE=SUBMIT VALUE="提交"&gt;&lt;INPUT TYPE=RESET VALUE="重置"&gt;
   &lt;/FORM&gt;

  &lt;/BODY&gt;

&lt;/HTML&gt;</pre>


<p>与所有 HTML 表单一样，此表单将数据以变量与变量值对的形式发送到 Web 服务器。例如，用户在“名字”文本框键入的名字将被指派给变量 FirstName。ASP 提供内建的对象，可用来访问由表单提交的变量名和变量值。</p>

<h3><a name="createtheaspresponsepage">创建 ASP 响应页</a></h3>

<p>现在来学习 Web 服务器如何处理从 HTML 表单接收到的信息。对于此课程，我们也已经创建了名为 Response.asp 的 .asp 文件，在该文件中添加一些附加脚本命令后，即可用来操作和显示从 Form.asp 收到的数据。</p>

<ol>
<li>使用文本编辑器打开 <%= Request.ServerVariables("SERVER_NAME")%> Web 服务器 Tutorial 目录中的文件 Response.asp(<%=FilePath%>)。</li>

<li>搜索词语“定义脚本语言”，在此文本行下复制和粘贴下列脚本行：</li>

<pre><&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;</pre>

<p>请记住，必须将此标记作为第一个脚本行添加到 asp 文件中，以便 Web 服务器知道您使用何种语言编写脚本。</p>

<li>现在搜索词语“指南课程”。在此文本行下，复制和粘贴下列脚本行：</li>

<%
  If ScriptLanguagePreference = "JScript" Then
%><pre>&lt;% 
  if (Request.Form("Title").Count == 1)
  {
    strTitle = Request.Form("Title")(1)
  }</pre>


<%Else%><pre>&lt;% 
  strTitle = Request.Form("Title") </pre>

<% End If %>

<p>如果其他用户已经完成了本部分指南，则脚本命令已经存在于“指南课程”注释下面。粘贴已复制的脚本来替换现有脚本，或从 Template 目录中将未用过的 Response.asp 复制到 Tutorial 目录。</p>

<p>您的表单向 ASP 提交三个不同的变量或值：</p>

<ul>
<li><pre>FirstName</pre></li>
<li><pre>LastName</pre></li>
<li><pre>Title</pre></li>
</ul>

<p>ASP 将 HTML 表单提交的信息存储在 Request 对象的 Forms 集合中。关于表单和对象的详细信息，请参阅<a href="iiwaform.htm">处理用户输入</a>和<a href="iiwaobb.htm">内建的 ASP 对象</a>。</p>

<p>要从 Request 对象检索信息，脚本需要使用下列语法：
Request.collection-name ("property-name")。这样，Request.Form ("Title") 将检索 <code>mr</code> 或 <code>ms</code>，这取决于用户提交的值。</p>

</li>

<li>复制和粘贴下列脚本行，并放到您在步骤 3 中插入行的后面：</li>

<%
  If ScriptLanguagePreference = "JScript" Then
%><pre>  else
  {
    strTitle = ""
  }
  strLastName = Request.Form("LastName")
  if (strTitle == "mr")
    Response.Write(strLastName + "先生")
  else
  {
    if (strTitle == "ms")
      Response.Write(strLastName + "女士")
  </pre>



<%Else%><pre>  strLastName = Request.Form("LastName")
  If strTitle = "mr" Then 
  %&gt;  
  Mr. &lt;%= strLastName %&gt;  
  &lt;% ElseIf strTitle = "ms" Then %&gt; 
  Ms. &lt;%= strLastName %&gt; </pre>



<% End If %>

<p>如果其他用户已经完成了本部分指南，则这些脚本行已经存在。粘贴已复制的脚本行来替换现有脚本，或从 Template 子目录 <%=FilePath%>\template 中将未用过的 Response.asp 复制到 Tutorial 目录。</p>

<p> <%=ScriptLanguagePreference%>&nbsp;<%
  If ScriptLanguagePreference = "JScript" Then
%><strong>if...else</strong>



<%Else%><strong>If...Then..Else</strong>



<% End If %> 语句将执行三个不同的操作，取决于 <code>strTitle</code> 的值。如果 <code>strTitle</code> 为 <code>mr</code>，则用户姓氏后加上“先生”。如果 <code>strTitle</code> 为 <code>ms</code>，则用户姓氏后会加上“女士”。否则，将使用姓氏和名字来称呼用户。您可以使用表达式 &lt;%= variable-name %&gt; 来显示变量值。</p>

<li>如果要在用户没有选择称谓的情况下显示姓氏和名字，请复制和粘贴下列脚本行，并放到步骤 3 中插入行的后面：</li>

<%
  If ScriptLanguagePreference = "JScript" Then
%><pre>    else
      Response.Write(strLastName + " " + Request.Form("FirstName"))
  }
%&gt; </pre>



<%Else%><pre>>&lt;% Else %&gt;
&lt;%= strLastNameRequest.Form("FirstName") &amp; " " &amp;  Request.Form("FirstName")%&gt;
&lt;% End If %&gt; </pre>



<% End If %>

<p>同样地，如果其他用户已经完成了本部分指南，这些脚本行已经存在。粘贴已复制的脚本行来替换现有脚本，或从 Template 子目录 <%=FilePath%>\template 中将未用过的 Response.asp 复制到 Tutorial 目录。<br>

<p><%
  If ScriptLanguagePreference = "JScript" Then
%>加号 (<code>+</code>) 和



<%Else%>“and”(<code>&amp;</code>) 符号将<% End If %>变量的值合成一个字符串。<%
  If ScriptLanguagePreference = "JScript" Then
%>最后的<strong>}</strong>大括号



<%Else%><strong>End If 语句</strong>



<% End If %>用来结束条件语句。</p>

</li>

<li>保存对 Response.asp 的更改并退出文本编辑器。请确保文本编辑器没有替换掉 .asp 文件扩展名。</li>

<li>要验证您创建的表单是否工作，（验证后您可以单击浏览器中的“后退”按钮返回此指南），请将浏览器指向 <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/form.htm">http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/form.htm</a></li>

</ol>

<p>恭喜！您已经创建了自己的第一个 HTML 表单，可用来将结果发送到 .asp 文件。要学习 COM 组件，请转到<a href="iiatmd2.asp">模块 2：使用 COM 组件</a>。</p>

<hr class="iis" size="1">
<p align=center><a href="/iishelp/common/colegal.htm">&copy; 1997-1999 Microsoft Corporation 版权所有。保留所有权利。</a></p>

</font>
</body>
</html>
