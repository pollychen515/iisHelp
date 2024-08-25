<!-- saved from url=(0022)http://internet.e-mail -->
<!-- saved from url=(0022)http://internet.e-mail -->
<%@ Language=VBScript EnableSessionState=False %>
<%
  
  ComponentPref =  Request.Form("ComponentPref")     
  If ComponentPref  = "" Then ComponentPref = Request.Cookies("ComponentPreference")

   Select Case ComponentPref
   Case "VB5"
      VB5Checked = "Checked"
   Case "JavaComp"
      JavaChecked = "Checked"
   Case Else
       VB5Checked = "Checked"       
       ComponentPref = "VB5"
   End Select

  Response.Cookies("ComponentPreference") = ComponentPref
  Response.Cookies("ComponentPreference").Expires = "January 1, 2020"
  Response.Cookies("ComponentPreference").Path = "/"


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
VirtFilePath = left(MainPath, Length) + "/tutorial"

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html dir=ltr><head><title>模块 3：编写自己的组件</title>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// 检查是否为 Microsoft 的浏览器
		if (TempString.indexOf ("4.") >= 0){
// 检查浏览器是否为 IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// 检查是否为 Netscape 的浏览器
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

<META NAME="ROBOTS" CONTENT="NOINDEX">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>

<body bgcolor="#FFFFFF" text="#000000"><font face="宋体">
 
<h1><a name="module3writingyourownactivexservercomponents">模块 3：编写自己的组件</a></h1>

<p><a href="iiselect.asp?LessonFile=<%= Server.URLEncode(LessonFile)%>">选择此课程使用的脚本语言</strong></a></p>

<p>在<a href="iiatmd2.asp">模块 2</a>中，您已经熟悉了 Active Server Pages (ASP) 提供的组件，现在可以考虑创建满足自己特殊要求的组件。</p>

<p>假设您需要创建一个 ASP 应用程序，以便向用户提供对特定财务功能的 Web 访问。虽然 ASP 没有明确地提供这样的功能，但您可以通过创建自己的 COM 或 Java 组件，将此功能添加到您的应用程序中，您在此模块中将完成此项工作。<p>

<p>开始之前，请使用下列表单选择一个组件，以便学习如何创建和执行组件：</p>

<hr>

<h3><A NAME="H3_22047542">选择在此课程中要创建的组件：</A></h3>

<form method=post action="iiatmd3.asp#location">
<input type=radio name=ComponentPref value=VB5 <%= VB5Checked  %>>Visual Basic&nbsp;5.0，或更高版本的 COM 组件<br>
<input type=radio name=ComponentPref value=JavaComp <%= JavaChecked %>>Visual&nbsp;J++&nbsp;1.1 或更高，Java&#153 中编写的 COM 组件<br><br>
<input type=submit value="选择">
</form>

<hr>

<p><strong><span style="color: #0000FF"><font color="#0000FF"><a name="location">要点</e></font></span></strong></p>

<ol>
<li>要保存和查看您在此模块中完成的工作，您需要： 

<ul>
<li>对 <%= Request.ServerVariables("SERVER_NAME")%> Web 服务器（已安装 Active Server Pages）上的<%= VirtFilePath %>虚拟目录具有“编写”和“脚本”Web 服务器权限。详细信息，请参阅<a href="/iishelp/iis/htm/core/iiwspsc.htm">设置 Web 服务器权限</a>。</li>


<li>您的 Windows 帐号必须具有 NTFS 权限，以便允许您读、写、以及运行

<%
  If ComponentPref = "JavaComp" Then
%> <em>DriveLetter</em>:\Winnt\Java 目录及其子目录中的程序，此处 <em>DriveLetter</em> 是映射到 <%= Request.ServerVariables("SERVER_NAME")%> Web 服务器所在驱动器的字母。</li><%Else%><em>DriveLetter</em>:\Winnt\System32\Inetsrv\，在这里要将 <em>DriveLetter</em> 替换为映射到 <%= Request.ServerVariables("SERVER_NAME")%> Web 服务器所在驱动器的字母。（如果您不接受默认安装目录，可将 \Winnt\System32 替换成您自己的安装目录名称。）</li>
<% End If %>

</ul>

<li>要完成此模块，必须在 <%= Request.ServerVariables("SERVER_NAME") %> Web 服务器上安装：</li>

<ul>
 <li><% If ComponentPref = "JavaComp" Then
%>Microsoft&#174;  Visual&nbsp;J++&#153;&nbsp;1.1 或更高版本。
<%Else%>32 位版本的 Microsoft&#174; Visual Basic&nbsp;5.0 或更高之专业版； Visual Basic&nbsp;5.0 或更高之企业版开发系统。
<% End If %></li>
</ul>

<li>如果您禁用了 Web 浏览器运行 Java 程序的能力，要继续本指南，请先启用该功能。</li>

</ol>

<hr>

<h2><a name="creatingthefinancecomponent">课程 1：创建 <%
  If ComponentPref = "JavaComp" Then
%>Java
<%Else%>COM
<% End If %> 财务组件</a></h2>



<%  If ComponentPref = "JavaComp" Then%>


<p>假设您需要创建一个 Web 应用程序，用来访问无法通过 <%= ScriptLanguagePreference %> 自身函数实现的功能。因为 <%= ScriptLanguagePreference %> 不提供财务功能，所以您必须明确地定义和创建封装此功能的脚本程序。必要时可以从应用程序脚本中调用这样的过程。</p>

<P>一般情况下，这种方法是封装自定义功能的完全解决方案。但是，如果您创建的 Web 应用程序要服务于成千上万的用户，您的逻辑能封装私人拥有的功能吗？在此情况下，以组件形式封装功能是一种更好的方法。组件比脚本可以提供更好的安全性和性能。</P> 

<P>在指南的本课程中，您将学习如何创建和封装一个功能组件，该组件可用来根据固定利率和周期性的固定报酬来计算投资的未来价值。</p>


<h3><A NAME="H3_22050303">启动 Visual J++</A></h3>

<ol>
<li>单击“开始”，指向“程序”，然后指向“Microsoft Visual&nbsp;J++&nbsp;1.1”。</li>
<li>单击子菜单中的“Microsoft Developer Studio”，运行设计环境。</li>
</ol>

<h3><a name="nametheproject">启动和命名工程</a></h3>

<ol>
<li>单击“文件”。</li>
<li>选择“新建”。</li>
<li>单击“工程”选项卡。</li>
<li>选择“Java 工程”。</li>
<li>在“工程名”框中，键入“Finance”，然后单击“确定”。</li>
</ol>

<h3><A NAME="H3_22050969">将 Finance 类添加到工程</A></h3>

<ol>
<li>在“插入”菜单中，选择“新类”。</li>
<li>在“名称”框中，键入“Finance”，然后单击“确定”。文本编辑器中将显示：</li>

<pre>class Finance {


}
</pre>

<p><strong>注意</strong>&nbsp;&nbsp;&nbsp;类名称必须与 Java 服务器组件的工程名相同。</p>
</ol>

<h3><A NAME="H3_22051481">将 CalcFV 函数添加到 Finance 类</A></h3>

<ol>	
<li>选择“ClassView”选项卡（默认选中）。</li>
<li>展开树控件中的“Finance 类”项目。</li>
<li>右键单击“Finance”类，然后选择“添加方法”。</li>
<li>在“返回类型”框中，键入“public double”。</li>
<li>在“方法声明”框中，将下面的复制并粘贴上去：</li>

<code>CalcFV(double dblRate, double dblNPer, double dblPMT, double dblPv, boolean bType)</code>  

<p>通过此声明，您定义了用来计算投资未来价值的财务函数，该函数属于 Finance 类。 <br>

<li>单击“确定”。Visual J++ 文本编辑器中应显示：</li>

<pre>class Finance 
   {
	public double CalcFV(
	double dblRate, 
	double dblNPer, 
	double dblPMT, 
	double dblPv, 
	boolean bType) 
	  {     


	   }
    }
</pre>
 
<li>在括号集的最里面，复制和粘贴下列 Java 代码到文本编辑器中：</li>

<pre>double	dblRet, dblTemp, dblTemp2, dblTemp3;

if (dblRate == 0.0) {
dblRet = -dblPv - dblPMT * dblNPer;
} 
else {
dblTemp = (bType ? 1.0 + dblRate : 1.0);
dblTemp3 = 1.0 + dblRate;
dblTemp2 = Math.pow(dblTemp3, dblNPer);  
dblRet = -dblPv * dblTemp2 - dblPMT * dblTemp * (dblTemp2 - 1.0) / dblRate;
}

return dblRet;
</pre>

<p>不要畏惧这些代码，它只是定义了必要的数学方程（使用 Java 语法），以便计算投资的未来价值。如果感兴趣，您几乎可以在所有财务数学或会计课本中找到关于这个常用方程的信息。</p>

<p><strong>注意</strong>&nbsp;&nbsp;&nbsp;Java 区分大小写，如果您决定将前面的代码行键入文本编辑器，请确保键入的 Java 语法和变量完全与上面的一样。</p>
	
</ol>

<h3><A NAME="H3_22053702">建立 Finance 组件</A></h3>

<ol>
<li>在“Build”菜单中，选择“Build Finance”。</li>
<li>在“Build”窗口（位于 ClassView 和文本编辑窗口下面）中，请确保建立过程中没有生成任何错误或警告。</li>
</ol>

<h3><A NAME="H3_22054061">将 Finance 组件复制到 Trustlib 目录</A></h3>

<ol>
<li>单击 Windows“开始”按钮，指向“程序”，然后单击“Windows 资源管理器”。</li>
<li>将 Finance.class 组件从 Program Files\DevStudio\MyProjects\Finance\ 目录复制到<%= Request.ServerVariables("SERVER_NAME") %> Web 服务器的 Winnt\Java\Trustlib 目录。</li>
</ol>

<h3><a name="registerthefinanceservercomponent">注册 Finance Java 类</a></h3>

<p>必须注册 Finance Java 类，否则 JScript 以及计算机上的其他所有 OLE 兼容语言都无法调用它。</p>

<ol>
<li>打开命令提示窗口。</li>
<li>在命令提示下键入 <strong>cd <em>Drive Letter</em>:\<%= Request.ServerVariables("SERVER_NAME")%>\Program Files\DevStudio\VJ\Bin\</strong>，其中 <em>Drive Letter</em> 是映射到计算机上相应驱动器的字母。（如果不接受默认安装目录，可使用您的安装目录名称来替换 \Program Files\DevStudio\VJ\Bin\。）</li>
<li>按 Enter 键。</li>
<li>键入 <strong>javareg /register /class:Finance /progid:MS.Finance.Java</strong>。</li>
<li>按 Enter 键。</li>
<li>当出现对话框并显示“Successfully Registered Java class "Finance" as CLSID”时，单击“确定”按钮。</li>
<li>关闭命令提示窗口。</li>
</ol>

<%Else%>
<p>假设您需要创建一个 Web 应用程序，用来访问无法通过 <%= ScriptLanguagePreference %> 自身函数实现的功能。因为 <%= ScriptLanguagePreference %> 不提供财务函数，所以您必须明确地定义和创建封装此功能的脚本程序。必要时可以从应用程序脚本中调用这样的过程。</p>

<P>一般情况下，这种方法是封装自定义功能的完全解决方案。但是，如果您创建的 Web 应用程序要服务于成千上万的用户，您的逻辑能封装私人拥有的功能吗？在此情况下，以组件形式封装功能是更好的方法。组件比脚本可提供更好的安全性和性能。</P> 

<P>在指南的本课程中，您将学习如何创建和封装一个函数组件，该组件可用来根据固定利率和周期性的固定报酬来计算投资的未来价值。</p>
<br>

<h3><a name="startvisualbasic">启动 Visual Basic</a></h3>

<ol>
<li>单击“开始”，指向“程序”，然后指向“Microsoft Visual Basic&nbsp;5.0”。</li>
<li>单击子菜单中的“Visual Basic&nbsp;5.0”，运行设计环境。</li>
</ol>

<h3><a name="nametheproject">启动和命名工程</a></h3>

<ol>
<li>在“新建工程”对话框中，双击“ActiveX DLL”。</li>
<li>在“工程”菜单上，单击“工程 1 属性”。</li>
<li>在“通用”属性页上的“工程名”框中，键入“MS”。</li>
<li>选择“执行无用户界面”。 </li>

<p><strong>注意</strong>&nbsp;&nbsp;&nbsp;选中此选项后，工程运行时将不需要用户干预，也不显示用户界面元素。</p>

<li>单击“确定”。</li>
</ol>

<p>此工程已命名为 MS。以后，您可以从 ASP 脚本中通过 <code>MS.Finance</code> 引用 Finance 服务器组件。</p>

<h3><a name="addthefinanceclasstotheproject">将 Finance 类添加到工程</a></h3>

<p>在 Visual Basic 中，要创建包含一组可调用函数的组件，您可以定义“类”。类集中了许多方法和属性。在您的工程中，类包含了您指定的财务方法。</p>

<ol>
<li>按 F4 打开类模块的“属性”窗口，然后双击“名称”属性并键入“Function”，然后按 Enter 键。</li>
<li>双击“Instancing”。</li>
<li>单击箭头，然后选择“5 - MultiUse”。</li>
</ol>

<h3><a name="learnmoreaboutvisualbasicfinancefunctions">进一步学习 Visual Basic Finance 函数</a></h3>

<p>Visual Basic 帮助系统讲述了可用的财务函数。</p>

<ol>
<li>单击“帮助”。</li>
<li>选择“Microsoft Visual Basic 帮助主题”。</li>
<li>选择“索引”选项卡，然后键入“财务函数”作为搜索词语。</li>
<li>双击“财务函数”索引项。</li>
<li>单击“FV 函数”查看详细信息。</li>
<li>当完成查看财务函数时，关闭“Visual Basic 帮助”对话框。</li>
</ol>

<h3><a name="addthecalcfvfunctiontothefinanceclass">将 CalcFV 函数添加到 Finance 类</a></h3>

<p>Finance 服务器组件需要一些编程代码。此代码使得 Visual Basic 内建的未来价值函数适用于那些利用组件的语言。</p>

<p>将下列行复制和粘贴到 Finance 类代码窗口中：</p>

<pre>Public Function CalcFV(rate, nper, pmt, Optional pv, Optional whendue) 
CalcFV = FV(rate, nper, pmt, pv, whendue)
End Function</pre>

<h3><a name="addthecomponentsentrypoint">添加组件的入口点</a></h3>

<p>所有服务器组件都需要一个入口（起始）点。这是对象首次对语言可用时将要调用的代码。在 VBScript 中，当您使用 Server.CreateObject 时，将创建一个对象的实例。执行 Server.CreateObject 语句时，将调用服务器组件（使用 Visual Basic 创建的组件）中的 Sub Main 过程。</p>

<p>调用财务组件时，它不需要专门做任何事情来初始化自身。因此，您可以提供一个空的（没有 Visual Basic 语句）Sub Main 过程。</p>

<ol>
<li>在“工程”菜单中，选择“添加模块”。</li>
<li>在“模块&nbsp;1”对话框中，双击模块图标。</li>
<li>在模块 1 代码窗口中，键入“Sub Main”。</li>
<li>按 Enter 键。</li>
</ol>

<p>这样将自动输入下列代码：</p>

<pre>Sub Main()
End Sub</pre> 

<h3><a name="savethefinanceproject">保存 Finance 工程</a></h3>

<p>当保存所做工作时，会要求您保存 Visual Basic 工程的所有三个部分。这些部分包括工程文件、类模块以及代码模块。</p>

<ol>
<li>打开“文件”菜单。</li>
<li>选择“保存工程”。</li>
<li>在“文件名”文本框中，键入 Finance。选择 <%= Request.ServerVariables("SERVER_NAME")%> Web 服务器上的下列路径： <strong><em>Drive Letter</em>:\Winnt\System32\Inetsrv\</strong>，其中  <em>Drive Letter</em> 是映射到相应驱动器的字母。（如果不接受默认安装目录，请用您的安装目录名称来替换 \Winnt\System32。）</li>
<li>单击“保存”按钮。</li>
<p>如果已经有用户完成此部分指南，将有消息提示您文件已经存在。保存您的文件版本来替换旧版本。</p>
<li>双击选定“文件名”文本框中的值“Project1”。</li>
<li>键入名称“Finance”作为工程文件 (.vbp)。</li>
<li>单击“保存”按钮保存工程。</li>
<p>如果已经有用户完成此部分指南，将有消息提示您文件已经存在。保存您的文件版本来替换旧版本。</p>
</ol>

<h3><a name="makethecomponentaninprocesscomponent">将组件作为进程内组件</a></h3>

<p>Visual Basic 允许您创建进程内 COM 组件（以前称为 OLE 自动化服务器）和进程外 COM 组件。进程内 COM 组件是由调用进程加载的动态链接库（文件扩展名为 .dll）。进程外 COM 组件是可执行文件（文件扩展名为 .exe），它作为调用应用程序之外的单独进程来运行。因为进程内组件与调用程序位于同一进程空间，所以比进程外组件提供更好的性能。</p>

<p>要使 Finance 服务器组件成为进程内 COM 组件</p>

<ol>
<li>打开“文件”菜单。</li>
<li>选择“生成 Finance.dll”。</li>
<li>单击“选项”按钮。</li>
<li>选择“自动升级”复选框。</li>
<li>单击“确定”。</li>
<li>键入 <strong><em>Drive Letter</em>:\<%= Request.ServerVariables("SERVER_NAME")%>\Winnt\System32\Inetsrv\Finance</strong>，其中 <em>Drive Letter</em> 是映射到计算机上相应驱动器的字母。（如果不接受默认安装目录，请用您的安装目录名称来替换 \Winnt\System32。）<br>
如果已经有用户完成此部分指南，将有消息提示您文件已经存在。保存的您的文件版本来替换旧版本</li>
<li>退出 Visual Basic。</li>
</ol>

<h3><a name="registerthefinanceservercomponent">注册 Finance 服务器组件</a></h3>

<p>所有服务器组件都必须注册。Windows 利用系统注册表来跟踪可用的服务器组件。通过注册 Finance 服务器组件，VBScript 和计算机上的其他所有 OLE 兼容语言都可以调用该组件。</p>

<ol>
<li>打开命令提示窗口。</li>
<li>在命令提示下键入 <strong>cd <em>Drive Letter</em>:\<%= Request.ServerVariables("SERVER_NAME")%>\Winnt\System32\Inetsrv</strong>，其中 <em>Drive Letter</em> 是映射到计算机上相应驱动器的字母（如果不接受默认安装目录，请用您的安装目录名称来替换 \Winnt\System32。）</li>
<li>按 Enter 键。</li>
<li>键入“regsvr32 Finance.dll”。</li>
<li>按 Enter 键。</li>
<li>当出现对话框并显示“DllRegisterServer in finance.dll succeeded”时，单击“确定”。</li>
<li>关闭命令提示窗口。</li>
</ol>

<hr>

<% End If %>

<h2> <a name="callingthefinancecomponentfromascript">课程 2：从脚本中调用 Finance 组件</a></h2>

<p>要测试组件，您可以从 Active Server Pages (ASP)、Visual&nbsp;Basic、使用 Visual&nbsp;Basic 应用程序的 Microsoft&#174;&nbsp;Office 产品或其他任何　OLE 自动化控制器中调用组件。</p>

<p>要通过 <%=ScriptLanguagePreference%> 从 Active Server Pages 中调用　Finance 服务器组件，您可以使用表单输入来计算个人储蓄计划的未来价值。</p>

<h3><a name="thehtmlform">HTML 表单</a></h3>

<p>HTML 表单将用来收集那些描述储蓄计划的值。这些值是分配的变量，可用于 ASP 脚本，作为 Request 对象一部分。您可以引用 HTML 表单中的值。例如，可以通过使用脚本 <strong><code>Request("APR")</code></strong> 来引用在表单中输入的年利率。HTML 标记 <code>&lt;INPUT TYPE=TEXT NAME=APR&gt;</code> 提供输入值所必需的输入字段。</p>

<p>要将表单发送到运行 ASP 的 Microsoft Web 服务器，用户可单击“提交”按钮。“提交”按钮调用 HTML 表单标记的 <code>ACTION</code> 属性所指示的网页。“提交”按钮的 HTML 标记 (<code>&lt;INPUT TYPE=SUBMIT VALUE=" 计算未来价值 "&gt;</code>) 使用 HTML 表单标记 (<code>&lt;FORM METHOD=POST 
ACTION="Finance<%If ScriptLanguagePreference = "JScript" Then
%>j<%Else%><% End If %>.asp"&gt;</code>) 的 <code>ACTION</code> 值来调用 ASP 页 Finance<%
  If ScriptLanguagePreference = "JScript" Then
%>j<%Else%><% End If %>.asp。</p>
<p>我们已经为您创建了表单。请使用文本编辑器打开<%= Request.ServerVariables("SERVER_NAME")%> Web 服务器 Tutorial 目录 (<%= FilePath %>) 中的文件 FVform.asp。</p>

<h3><a name="thescript">脚本</a></h3>

<p>您可以使用 <%=ScriptLanguagePreference%> 调用 Finance 服务器组件。脚本启动时将验证来自 HTML 表单的输入，并为表单中没有输入的值指派默认值。<%
  If ScriptLanguagePreference = "JScript" Then
%>自定义函数 IsNumeric 用来测试 HTML 表单上每个框中是否输入了有效的数值。<%Else%>VBScript IsNumeric 函数用来测试 HTML 表单上每个框中是否输入了有效的数值。</p>
<% End If %>

<%
  If ComponentPref = "JavaComp" Then
%><p>Server.CreateObject 创建 Finance 组件 <code>MS.Finance.Java</code> 的实例（即，使组件可以重复使用）。创建组件的实例后，您可以利用它的方法和属性。Server.CreateObject<%Else%> 后面的脚本行
<p>Server.CreateObject 创建 Finance 组件 <code>MS.Finance</code> 的实例（即，使组件可以重复使用）。创建组件的实例后，您可以利用它的方法和属性。Server.CreateObject 后面的脚本行<% End If %>使用 CalcFV 方法来计算储蓄计划的未来价值。计算结果将显示在请求信息的用户浏览器中。</p>

<p>要查看脚本，可使用文本编辑器打开文件 <%
  If ScriptLanguagePreference = "JScript" Then
%>Financej.asp



<%Else%>Finance.asp



<% End If %>，该文件位于 Tutorial 目录 (<%= FilePath %>) 中。</p>

<h3><a name="usingyourbrowsertorunthetest">使用浏览器运行测试</a></h3>

<p>要运行 <%
  If ScriptLanguagePreference = "JScript" Then
%>Financej
<%Else%>Finance
<% End If %> ASP 页，请打开 FVform.asp  文件，该文件处理表单并调用 <%
  If ScriptLanguagePreference = "JScript" Then
%>Financej.asp<%Else%>Finance.asp<% End If %> 脚本来计算表单中指定的储蓄计划的未来价值。</p>

<ol>
<li>将浏览器指向 <a href="http://<%=Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/FVform.asp?ScriptLanguagePreference=<%=ScriptLanguagePreference%>&ComponentPref=<%=ComponentPref%>">http://<%=Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/FVform.asp</a>，打开 FVform.htm。</li>
<li>在“储蓄计划”表单中输入表单输入值。</li>
<li>单击“计算未来价值”按钮。将显示储蓄计划的值。</li>
</ol>

<p>在较短的时间内您已经创建了一个有用的 <%
  If ComponentPref = "JavaComp" Then
%>Java<%Else%>COM<% End If %> 组件。如果需要访问其他财务函数，您可以使用 <%
  If ComponentPref = "JavaComp" Then
%>Visual J++<%Else%>Visual Basic<% End If %> 实施其他财务函数，并将其作为 Finance 服务器组件的附加方法。我们鼓励您大胆实践并提出利用 <%If ComponentPref = "JavaComp" Then%>Java<%Else%>COM<% End If %> 组件的创新方法。不久，您就会发现可以使用组件开发任何 Web 应用程序。</p>

<hr class="iis" size="1">
<p align=center><a href="/iishelp/common/colegal.htm">&copy; 1997-1999 Microsoft Corporation 版权所有。保留所有权利。</a></p>
</font>
</body>
</html>
