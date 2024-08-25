<!-- saved from url=(0022)http://internet.e-mail -->
<!-- saved from url=(0022)http://internet.e-mail -->
<!-- saved from url=(0022)http://internet.e-mail -->
<%@ Language=VBScript EnableSessionState=False %>
<%
  Response.Buffer = True
  Response.Clear
  Response.Expires = 0  	

  LessonFile = Request.ServerVariables("SCRIPT_NAME")

  ScriptLanguagePreference = Request.Cookies("ScriptLanguagePreference")

 If ScriptLanguagePreference = "" Then
    ScriptLanguagePreference = Request.QueryString("ScriptLanguagePreference")
    If ScriptLanguagePreference = "" Then
      Response.Redirect "/iishelp/iis/htm/asp/iiselect.asp?LessonFile=" & Server.URLEncode(LessonFile)
    End If
  End If

'确定当前页的物理路径，然后从路径中删除文件名（只留下目录）。
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


'确定当前页的虚拟路径，然后从路径中删除文件名（只留下目录）。
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
VirtFilePath = left(MainPath, Length) + "/Tutorial"


%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html dir=ltr><head><title>模块 2：使用 COM 组件</title>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// 检查是否为 Microsoft 的浏览器器
		if (TempString.indexOf ("4.") >= 0){
// 检查浏览器是否为 IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// 检查是否为 Netscape 的浏览器器
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

<META NAME="DESCRIPTION" CONTENT="这是一个 Active Server Pages (ASP) 教程，您可以学习到如何使用 COM 组件扩充您的脚本功能。在本模块中，您将使用包含在 ASP 中的 COM 组件来激活一个示例 Web 站点并查询数据库。">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>

<body bgcolor="#FFFFFF" text="#000000"><font face="宋体">



<h1><a name="module1">模块 2：使用 COM 组件</a></h1>

<p><a href="iiselect.asp?LessonFile=<%= Server.URLEncode(LessonFile) %>"><strong>选择此课程使用的脚本语言 </strong></a></p>


<p>COM 组件提供封装的、可重复使用的、安全的访问信息的方法，扩充了脚本的能力。例如，ASP 中的 Database Access 组件允许使用脚本查询数据库。这样，无论何时您想从脚本查询数据库，都没有必要编写复杂脚本来执行此项任务。您可以从任何脚本或编程语言（支持“自动化”）调用组件（COM 组件是“自动化”服务器）。在此模块中，您将使用 ASP 中包含的 COM 组件来激活一个示例 Web 站点。</p>

<p>如果您不熟悉编写 .asp 文件的基础知识，请完成此指南的<a href="iiatmd1.asp">模块 1</a>。</p>

<p><strong><a name="note"><span style="color: #0000FF"><font color="#0000FF">要点</a></font></span></strong></p>

<ul>
<li>要保存和查看您在此模块中完成的工作，必须对 <%= Request.ServerVariables("SERVER_NAME")%>Web 服务器（已安装 Active Server Pages）上的<%= VirtFilePath %>虚拟目录启用“写”和“脚本”Web 服务器权限。</li>

<li>课程 2 描述动态 HTML (DHTML) 脚本程序。此脚本程序显示一系列交互的广告图像，每幅图像动态转换。要运行脚本程序并查看其效果，您需要使用 Internet Explorer 4.0 或更高版本。关于 Internet Explorer 的详细信息，请访问 Microsoft Web 站点 <a href="http://www.microsoft.com/isapi/redir.dll?prd=msft&ar=home"  target="_blank" >http://www.microsoft.com/</a>。</li>
</ul>

 <hr>

<h2><a name="H2_37665281"></a>课程 1：使用 Ad Rotator 组件</h2>

<p>Internet Web 站点经常提供广告空间。要保持站点真实有趣并在有限的空间显示几个广告商的广告，您可能希望循环显示不同的广告。Ad Rotator 组件简化了轮流显示每个广告的任务，而且易于添加新广告。另外，您可以轻松添加或更新超级链接，这些超级链接允许用户单击广告然后访问广告商的 Web 站点。在此课程中， 您将创建调用 Ad Rotator 组件的脚本，以便轮换四个随机选定的广告。单击下面的“显示”按钮来查看您要显示的广告范例，然后重复单击此按钮来轮流显示其他<a name="usingtheadrotatorcomponent">广告</a>。<hr>
<!--#include virtual="/iishelp/iis/htm/tutorial/script4.asp" --></p>

<hr>

<h3><a name="createtheadfile">创建广告文件</a></h3>

<p>我们已经创建了一个假象的商务 Web 页，即我们的异国情调之旅，可以在其中插入 Ad Rotator 脚本。也可以创建简单文本文件来通知 Ad Rotator 组件插入哪些广告以及每个广告显示时间的百分比。我们已经创建了包含广告的文件。要查看该文件，请使用文本编辑器打开 <%= Request.ServerVariables("SERVER_NAME")%> Web 服务器 Tutorial 目录 (<%= FilePath %>) 中的文件 Adrot.txt。</p>

<p>文件的第一行设置了用户单击广告时将要调用的脚本；在这里是 Redirect.asp。您可以修改 Redirect.asp 文件以便在将用户链接到广告商 Web 站点之前执行特定的操作，如跟踪广告受欢迎程度。下面三行建立广告图像的宽度、高度和边宽。</p>

<pre>redirect /iishelp/iis/htm/tutorial/redirect.asp
width 180
height 180
border 1</pre>


<p>下一步，文件包含广告数据。对于每个广告，这些数据包括要使用的图像、用户单击广告后转到的 URL（在本例中，转到 Redirect.asp）、与图像相关的文本以及广告将要显示时间的百分比：</p>

<pre>/iishelp/iis/htm/tutorial/nyc.jpg
http://www.microsoft.com
Big Deals in the Big Apple
35</pre>


<p>在单独文件中维护广告信息，您所在组织中的其他组可以更新 Adrot.txt 文件，而不必要求您更新 ASP 页。不同的组可以维护站点各个部分的不同的广告文件。</p>

<h3><a name="createthescript">创建脚本</a></h3>

<ol>
<li>使用文本编辑器打开 <%= Request.ServerVariables("SERVER_NAME")%>Web 服务器 Tutorial 目录 (<%= FilePath %>) 中的文件 Exotic.asp。 
<br><br></li>
  <li>在 Exotic.asp 顶部，于任何其他 HTML 标记或 ASP 命令之前，粘贴下列脚本行：</li>

<pre>&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;</pre>
<p>此脚本是 ASP 命令语句，用来通知 Web 服务器脚本是用 <%=ScriptLanguagePreference%> 编写的。此命令语句必须位于 ASP 文件第一行。</p>

<li>搜索词语“指南课程：Ad Rotator”；您将在这里添加脚本。</li>

<li>创建 Ad Rotator 组件的实例，并将其赋给变量 Ad，方法是：复制下列脚本命令并粘贴到文本编辑器中（位于上步的文本行后面）：</li>

<pre>&lt;% <%
  If ScriptLanguagePreference = "JScript" Then

%><%Else%>Set<% End If %> Ad = Server.CreateObject("MSWC.Adrotator") %&gt; </pre>
<p>将组件实例赋给变量使您可以在以后的脚本中参考该组件。</p>

<p>如果其他用户已经完成了本部分指南，则此脚本命令已经存在。粘贴已复制的脚本来替换现有脚本，或者从 Template (<%=FilePath%>\template) 目录将未编辑过的 Exotic.asp 复制到 Tutorial 目录。</p>


<li>要显示新广告，您可以使用 Ad Rotator 组件的 GetAdvertisement 方法。将下列脚本命令添加到脚本中：</li>
<pre>&lt;%<%
  If ScriptLanguagePreference = "JScript" Then
%>Response.Write(Ad.GetAdvertisement("adrot2.txt"))<%Else%>= Ad.GetAdvertisement("adrot2.txt")<% End If %>%&gt; </pre>

<p>GetAdvertisement 方法有一个参数（包含广告信息的文件名，在这里是 Adrot2.txt，此文件已经配置并且与 Adrot.txt 不同）。根据此参数，该方法为相应广告返回已经完全格式化的 HTML &lt;IMG&gt; 标记。为 Ad Rotator 组件实例指派的变量名 Ad 位于方法 GetAdvertisement 和 Adrot2.txt 文件路径的前面。等号将方法返回的值（实际的广告）发送到用户浏览器。</p>


<li>以文本格式保存对 Exotic.asp 的更改，并退出文本编辑器。请确保文本编辑器没有替换 .asp 文件扩展名。</li>

<li>要验证您创建的 ASP 页是否工作（验证后您可以单击浏览器中的“后退”返回此指南），请将浏览器指向 <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/exotic.asp">http://<%= Request.ServerVariables("SERVER_NAME")%>/IISHelp/IIS/Help/Htm/Tutorial/Exotic.asp</a>。</li>
</ol>

<hr>

<h2><a name="usingthebrowsercapabilitiescomponent">课程 2：使用浏览器功能组件</a></h2>

<p>并不是所有浏览器都支持当今的所有 Internet 技术。ActiveX 控件、视频流、动态 HTML 以及 脚本程序 (scriptlets) 就是例证，部分浏览器支持这些特性而其他浏览器不支持。使用 ASP 的浏览器功能组件，您可以设计出“智能”的 Web 页，以便根据处理网页的浏览器的能力提供相应的内容格式。例如，您设计的 Web 页可以使用浏览器功能组件来确定用户浏览器是否支持网页中显示的 ActiveX 驱动的徽标。如果浏览器不支持，徽标将以其他形式显示，如静态图像。</p>

<p>在本课程中，您将改进在课程 1 中创建的 Ad Rotator 脚本，在其中增加激活 scriptlet 的脚本。 脚本程序 (scriptlets) 是包含脚本和 HTML 的简单 Web 页，Web 作者可将其作为能够重复使用的客户端对象。要在 Web 页中包含 scriptlet，只需插入包含 scriptlet 类型和位置信息的 HTML &lt;OBJECT&gt; 标记即可。在本课程中，您要包含在 Ad Rotator 脚本中的 scriptlet 将使用动态 HTML (DHTML) 创建动人的 ad rotator，以便动态转换图像。</p>

<p>目前，只有 Microsoft Internet Explorer 4.0 或更高版本支持 scriptlet 和某些 DHTML 特性。这意味着您的 Ad Rotator 脚本必须能够检测浏览器类型。如果用户浏览器是 Internet Explorer 4.0 或更高版本，用户应能看到动态转换的一组连续广告。如果用户浏览器不是 Internet Explorer 4.0 或更高版本，当用户刷新 Web 时应看到由 Ad Rotator 组件生成的交替的静态广告。</p>

<p><a name="browscapdemo">单击</a>“演示”按钮查看由 ad rotator 使用 scriptlet 生成的 DHTML 范例。（如果您的浏览器不是 Microsoft Internet Explorer 4.0 或更高版本，您将看到与<a href="#usingtheadrotatorcomponent">课程 1</a>中一样的静态广告。）</p>

<hr>
<CENTER>

<FORM  METHOD=POST ACTION="/iishelp/iis/htm/tutorial/DEMOROT.asp">
<INPUT TYPE=SUBMIT VALUE="演示">
</FORM>

</CENTER>
<hr>



<h3><a name="createthescriptb">创建脚本</a></h3>


<p><strong><span style="color: #0000FF"><font color="#0000FF">要点</font></span></strong>&nbsp;&nbsp;&nbsp;您必须完成<a href="#usingtheadrotatorcomponent">课程 1</a>才能继续此课程。</p>

<ol>
<li>启动文本编辑器并打开 Tutorial 目录 (<%= FilePath %>) 中的文件 Exotic.asp。</li>

<li>搜索词语“指南课程：启动浏览器功能”。在此文本行下面添加脚本。</li>

<li>创建一个浏览器功能组件实例，并将其指派给变量 <code>objBrowser</code>，方法是：复制下列脚本命令并粘贴到 Exotic.asp 中：<pre>&lt;% <%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%>Set<% End If %> objBrowser = Server.CreateObject("MSWC.BrowserType") %&gt;</pre>

<p>如果其他用户已经完成了此部分指南，则这些脚本行已经存在。粘贴已复制的脚本行来替换现有脚本，或从 Template 子目录 (<%=FilePath%>\template) 将未使用过的 Exotic.asp 复制到 Tutorial 目录。</p>

<li>
<% If ScriptLanguagePreference = "JScript" Then %>
使用 JScript <strong>if...else</strong>
<% Else %>
使用 VBScript <strong>If...Then...Else</strong>
<% End If %>
 语句来确定用户使用的浏览器是否为 Internet Explorer 4.0 或更高版本。如果是，将使用 scriptlet；如果浏览器不是 Internet Explorer 4.0 或更高版本，并且不支持 scriptlet，将使用服务器端 Ad Rotator 组件。要加入此逻辑，可复制下列脚本并粘贴到步骤 2 所插入语句 <pre>&lt;%&nbsp;<%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%>Set<% End If %>&nbsp;objBrowser...%&gt;</pre> 
的后面： 
<pre>&lt;% <%
  If ScriptLanguagePreference = "JScript" Then
%>if (objBrowser.browser == "IE"   &&  objBrowser.majorver == "4") { <%Else%>If objBrowser.browser = "IE"  and  objBrowser.majorver >= 4  Then<% End If %>

%&gt;
&lt;OBJECT ID="scriptlet" 
		STYLE = "	position:relative;height:200;width:200"
        		TYPE  = "text/x-scriptlet"
		DATA = "..\tutorial\rotate5.htm"&gt;
&lt;/OBJECT&gt;

&lt;% <%
  If ScriptLanguagePreference = "JScript" Then
%> }
  else {<%Else%>Else<% End If %> %&gt; </pre>


<p>如果其他用户已经完成了此部分指南，则这些脚本已经存在。粘贴已复制的脚本来替换现有脚本，或从 Template 子目录 (<%=FilePath%>\template) 将未使用过的 Exotic.asp 复制到 Tutorial 目录。</p>

<p>浏览器功能组件的 browser 和 majorver 属性确定浏览器是否为 Internet Explorer 4.0 或更高版本。脚本使用 HTML <code>&lt;OBJECT&gt;</code>< 标记将 scriptlet 插入 Web 页。此标记的属性指定 scriptlet 的类型 (x-scriptlet)、位置以及大小。实际的 scriptlet 源文件称为 Rotate5.htm。如果您感兴趣，此文件也位于 Tutorial 目录 (<%=FilePath%>) 中。您可以使用记事本或任何 HTML 编辑工具打开它。</p>

</li>

<li>搜索词语“指南课程 - 结束浏览器功能”；在此文本行下面，复制和粘贴下列脚本命令以便结束 
<strong><%
  If ScriptLanguagePreference = "JScript" Then
%>if<%Else%>If...Then...Else<% End If %></strong> 语句：

<pre>&lt;%<%
  If ScriptLanguagePreference = "JScript" Then
%>
}
<%Else%> End If <% End If %>%&gt; </pre>

<p>如果其他用户已经完成了此部分指南，则此脚本命令已经存在。粘贴已复制的脚本来替换现有脚本，或从 Template 子目录 (<%=FilePath%>\template) 将未使用过的 Exotic.asp 复制到 tutorial 目录。</p>
</li>

<li>以文本格式保存对 Exotic.asp 的更改，并退出文本编辑器。请确保文本编辑器没有替换 .asp 的文件扩展名。</li>

<li>要验证创建的 ASP 页是否工作（验证后可以单击浏览器中的“后退”返回此指南。），请将浏览器指向 <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/exotic.asp">http://<%= Request.ServerVariables("SERVER_NAME")%>/IISHelp/IIS/Help/Htm/Tutorial/Exotic.asp </a>。</li>
</ol>

<p><strong>注意</strong>&nbsp;&nbsp;&nbsp; 文件 Browscap.ini（默认情况下位于 Winnt\System32\Inetsrv）包含必要的数据，浏览器功能组件使用此数据来识别浏览器及其能力。如果开发出了新的浏览器，或者您使用了默认 Browscap.ini 文件中没有列出的与浏览器相关的特性，则需要向此文件中添加新数据。</p>

<hr>

<h2><a name="usingthedatabaseaccesscomponent">课程 3：使用数据库访问组件</a></h2>

<p>ASP 数据库访问组件使用 ActiveX 数据对象 (ADO) 来提供对 OLE DB 兼容数据源中所存储数据的便捷访问。OLE DB 是系统级编程接口，可用来连接各种数据源，包括数据库、电子表格或其他连续文件。OLE DB 定义一组展示数据库管理系统功能的标准 COM 接口。通过提供对这些 COM 接口的便捷访问，ADO 允许您使用脚本语言（如 VBScript 或 JScript）将数据库访问添加到 Web 应用程序。</P>


<P>在此课程中，您将使用 ADO 和 OLE DB 来查询 Microsoft&#174; Access 数据库文件，返回一组记录，然后在 HTML 表中显示此信息。要预览此功能，请单击“显示”按钮：</p>

<hr>
<!--#include virtual="/iishelp/iis/htm/tutorial/script6.asp" -->
<hr>

<h3><a name="identifythedatabase">标识数据库</a></h3>

<p>创建 ADO 数据库脚本的第一步就是为数据源指定准确的“连接字符串”。连接字符串包含一系列由分号分隔的变量，这些变量用来定义参数，如数据源驱动软件和数据库文件的位置。在此课程中，我们将访问 Microsoft&#174; Access 数据库文件 EECustmr.mdb，该文件由本指南提供。</p>

<ol>

<li>使用文本编辑器打开 <%= Request.ServerVariables("SERVER_NAME")%>Web 服务器 Tutorial 目录 ( <%= FilePath %>)中的文件 Database.asp。</li>

<li>搜索词语“定义脚本语言”，在此文本行下面，复制和粘贴下列脚本行：</li>

<pre>&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;</pre>
<p>必须始终确保将此标记作为第一行脚本添加到所有的 .asp 文件中。</p>

<li>搜索词语“指南课程 - ADO 连接”；在此文本行下，您将复制和粘贴脚本。</li>
<li>复制和粘贴下列语句：</li>

<pre>&lt;%
  strDBVirtualPath = "/iishelp/iis/htm/tutorial/EECustmr.mdb"
  strDBLocation = Server.Mappath(strDBVirtualPath)
  
<% If ScriptLanguagePreference = "JScript" Then %>
  strSource = "Provider=Microsoft.Jet.OLEDB.3.51;Data Source=" + strDBLocation<% Else%>  strSource = "Provider=Microsoft.Jet.OLEDB.3.51;Data Source=" & strDBLocation<% End If %></pre>

<P>前两条语句定义范例数据库的位置。我们使用 Server 对象的 MapPath 方法基于相对路径返回 EECustmrs.mdb 的物理位置。第三条语句包含两部分，用来定义实际的连接字符串。第一部分指定“data provider”，它是向 OLE DB 展示数据库功能的组件。在这里，我们指的是 Microsoft&#174;&nbsp;Jet 数据库引擎，它可以处理对 Microsoft Access 的所有请求。连接字符串的第二部分只表示数据源 &#151;EECustmr.mdb。</P>
</ol>

<h3><a name="createthecomponentinstance">创建一个 ADO Connection 对象实例</a></h3>
<ol>
<li>我们将使用 ADO Connection 对象来连接数据库。同样地，您需要创建此对象的实例才能使用此对象。复制和粘贴下列脚本命令：</li>
<pre> 
<%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%>Set<% End If %> objConnection = Server.CreateObject("ADODB.Connection")  </pre>

<p>如果其他用户已经完成了此部分指南，则此脚本命令已经存在于“指南课程”注释下面。粘贴已复制的脚本来替换现有脚本，或从 Template 子目录 (<%=FilePath%>\template) 将未使用过的 Database.asp 复制到 Tutorial 目录。</p>

<li>现在我们需要打开一个与数据库的连接。这里我们引用连接字符串。复制和粘贴下列脚本命令：</li>

<pre>objConnection.Open<%
  If ScriptLanguagePreference = "JScript" Then
%>(strSource)<%Else%> strSource<% End If %> </pre>

<li>使用 ADO 的 Execute 方法可以发送结构化查询语言 (SQL) 的 SELECT 命令给数据库，并在结果集 (<code>rsCustomersList</code>) 中存储返回的记录。在 <code>objConnection.Open</code> 语句下面复制和粘贴下列脚本命令：</li>

<%
  If ScriptLanguagePreference = "JScript" Then
%><pre>rsCustomersList = objConnection.Execute("SELECT * FROM Customers")
%&gt;</pre><%Else%><pre>SQLQuery = "SELECT * FROM Customers"  
Set rsCustomersList = objConnection.Execute(SQLQuery)
%&gt;</pre>



<% End If %>

<%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%><p>您可以合并这两行脚本，方法是将实际的 SQL 查询字符串直接传递给 Execute 方法，而不是先指派给变量 SQLQuery。不过，当 SQL SELECT 太长时，先将字符串赋给变量名（如 SQLQuery）、再将变量名传递给 Execute 方法会提高脚本的可读性。</p><% End If %>

</ol>

<h3><a name="displaythereturnedresultset">显示返回的结果集</a></h3>

<p>您可以将结果集当作一个表，其结构由 SQL SELECT 语句中指定的字段决定。因此，显示查询返回的行就如同对结果集的行执行循环一样容易。在此例中，返回的数据显示在 HTML 表的行中。</p>

<ol>

<li>在 Database.asp 中，查找词语“指南课程 - 显示 ADO 数据”；然后在注释下面复制和粘贴下列 VBScript <strong>Do...Loop</strong> 语句：</li>
<pre>&lt;% <%
  If ScriptLanguagePreference = "JScript" Then
%>while (!rsCustomersList.EOF) {<%Else%> Do Until rsCustomersList.EOF<% End If %>%&gt;

&lt;TR&gt;
  &lt;TD BGCOLOR="f7efde" ALIGN=center&gt;
    &lt;%= rsCustomersList("ContactFirstName")%&gt; &nbsp;
    &lt;%= rsCustomersList("ContactLastName") %&gt;
  &lt;/TD&gt;
  &lt;TD BGCOLOR="f7efde" ALIGN=center&gt;    
    &lt;a href="mailto:&lt;%= rsCustomersList("ContactLastName")%&gt;"&gt;
    &lt;%= rsCustomersList("ContactLastName")%&gt; &lt;/a&gt;
  &lt;/TD&gt;
  &lt;TD BGCOLOR="f7efde" ALIGN=center&gt;
    &lt;%= rsCustomersList("City")%&gt;
  &lt;/TD&gt;
  &lt;TD BGCOLOR="f7efde" ALIGN=center&gt;
    &lt;%= rsCustomersList("StateOrProvince")%&gt;
  &lt;/TD&gt;
&lt;/TR&gt; 
</pre>

<p>如果其他用户已经完成了此部分指南，则此脚本命令已经存在。粘贴已复制的脚本来替换现有脚本，或从 Template 目录将未使用过的 Exotic.asp 复制到 Tutorial 目录。</p>

<p><%=ScriptLanguagePreference%> <%
  If ScriptLanguagePreference = "JScript" Then
%> <strong>while</strong> loop<%Else%> <strong>Do...Loop</strong><% End If %> 语句当条件为真时重复执行语句块。重复的语句可以是脚本命令或 HTML 文本和标记。这样，每经历一次循环，就可以加入一个表行（使用 HTML）并插入返回的数据（使用脚本命令）。</p>

<li>要完成循环，可使用 <strong>MoveNext</strong> 方法将结果集的行指针向下移动一行。因为此语句仍在 <strong>Do...Loop</strong> 语句内部，所以一直重复直至到达文件结尾。在包含词语“指南课程 - 检索下一行”的注释下面复制和粘贴下列脚本行：</li>

<pre>&lt;% 
<%
  If ScriptLanguagePreference = "JScript" Then
%>  rsCustomersList.MoveNext()
}<%Else%>  rsCustomersList.MoveNext 
Loop<% End If %> 
%&gt;</pre>

<li>以文本格式保存对 Database.asp 的更改，并退出文本编辑器。请确保文本编辑器没有替换掉 .asp 文件扩展名。</li>

<li>要验证创建的脚本是否工作（验证之后可以单击浏览器中的“后退”返回此指南），请将浏览器指向 <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/database.asp"> http://<%= Request.ServerVariables("SERVER_NAME")%>/IISHelp/IIS/Help/Htm/Tutorial/Database.asp</a>。</li>
</ol>

<P>学会如何创建简单的数据访问脚本后，您可能希望学习更多知识。如果是初学者，请访问 Microsoft Universal Data Access (UDA) Web 站点 <A HREF="http://www.microsoft.com/isapi/redir.dll?prd=mdac" target="_blank">http://www.microsoft.com/data/</A> 来学习关于 ADO 以及许多其他 UDA 技术的知识。</P>

<p>现在您已学完了使用 COM 组件，可以继续学习<a href="iiatmd3.asp">模块 3：编写自己的组件</a>。</p>

<hr class="iis" size="1">
<p align=center><a href="/iishelp/common/colegal.htm">&copy; 1997-1999 Microsoft Corporation 版权所有。保留所有权利。</a></p>
</font>
</body>
</html>
