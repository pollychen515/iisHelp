<!-- saved from url=(0022)http://internet.e-mail -->
<!-- �� url=(0022)http://internet.e-mail �������� -->
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


'ȷ����ǰ��ҳ������·����Ȼ��
'ɾ��·���е��ļ�����ֻ����Ŀ¼����
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


'ȷ����ǰ��ҳ������·����Ȼ��ɾ��
'·���е��ļ�����ֻ����Ŀ¼����
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
<html dir=ltr><head><title>ģ�� 1������ ASP ҳ</title>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
//����Ƿ�Ϊ Microsoft ���������
		if (TempString.indexOf ("4.") >= 0){
//����Ƿ�Ϊ IE 4
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

<META NAME="DESCRIPTION" CONTENT="����һ�� Active Server Pages (ASP) �̳̣�������ͨ�������Լ��� ASP ҳ (.asp �ļ�) ��ѧϰһЩ ASP ������">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>

<body bgcolor="#FFFFFF" text="#000000"><font face="����">


<h1><a name="module1">ģ�� 1������ ASP ҳ</a></h1>


<p><a href="iiselect.asp?LessonFile=<%= Server.URLEncode(LessonFile)%>"><strong>ѡ�񱾿γ�ʹ�õĽű�����</strong></a></p>

<p>�ڴ�ģ���У�����ͨ�������Լ��� ASP ҳ��.asp �ļ�����ѧϰ ASP����Щ�γ����õ�ʾ���ļ�λ�� <%= Request.ServerVariables("SERVER_NAME")%> Web �������� Tutorial Ŀ¼ (<%=FilePath%>) �С����������ļ�Ҳ�������� Tutorial Ŀ¼�С�</p>

<p><strong><a name="note"><span style="color: #0000FF"><font color="#0000FF">Ҫ��</font> </span></a></strong>&nbsp;&nbsp;&nbsp;Ҫ�ڴ�ģ���б���Ͳ鿴���Ĺ���������� Web ���������Ѱ�װ Active Server Pages���ϵ�<%= VirtFilePath %>����Ŀ¼<%= Request.ServerVariables("SERVER_NAME")%>���á�д���͡��ű���Web ������Ȩ�ޡ���ϸ��Ϣ�������<a href="../core/iiwspsc.htm">���� Web ������Ȩ��</a>��</p>

<hr>

<h2><a name="creatingasimpleactivexpage">�γ� 1�������� ASP ҳ</a></h2>

<p>ѧϰ ASP ҳ�����;�����Ǳ�д�Լ�����ҳ��Ҫ���� ASP ҳ������ʹ���ı��༭�����ű�������� HTML ҳ�С�ʹ�� .asp �ļ���չ�������ļ���֪ͨ ASP ����ű����Ҫ�鿴�ű������ֻ��ʹ�� HTTP Э��ͨ�� Web ������������ҳ���ɣ��ڱ�����Ϊ http://<%= Request.ServerVariables("SERVER_NAME")%><%= VirtFilePath %>/<em>filename.asp</em>���ڴ˿γ��У������Խ���ָ���е� HTML �� ASP �ű�����Ƶ��ı��༭���У��������е� &#147;Hello World!&#148; �ű��������ı��༭���е��ļ��󣬼���ʹ��������鿴�ű������</p>

<p>���� HTML ����������Hello World!���������壩�ļ���ҳ��</p>

<pre>
&lt;HTML&gt;
  &lt;BODY&gt;
    &lt;FONT SIZE=7&gt; 
      Hello World!&lt;BR&gt; 
    &lt;/FONT&gt; 
  &lt;/BODY&gt;
&lt;/HTML&gt;</pre>

<p>������ϣ���ظ���ʾ���ı���������ÿ����ʾʱ��������Ĵ�С��Ϊ�ˣ��������ظ�ʹ�� font ��Ǻ� HTML �ı�������ÿ���ظ�ʹ�ò�ͬ�������С����������� HTML ҳʱ����һ�����ֽ�����ظ���ʾ��</p>

<p>���⣬������ʹ�� ASP �Ը����ӵĶ�̬��ʽ���������ͬ�����ݡ�</p>

<h3><a name="createandsaveapage">�����ͱ�����ҳ</a></h3>

<ol>
<li>�����ı��༭��������±��������úø��ı��༭�����ں���������ڣ��Ա����ͬʱ�鿴�������ڵ����ݡ�</li>
<li>������ HTML ��Ǹ��Ʋ�ճ�����ļ��Ķ�����</li>

<pre>&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;
&lt;HTML&gt;
  &lt;BODY&gt; </pre>

<p>ע�⣬��һ������������ ASP ��ǣ�������Ĭ�Ͻű���������Ϊ <%=ScriptLanguagePreference%>������ȷ�������е� .asp �ļ��н��˱����ӵ���һ�С�</p>

<li>���ĵ���Ϊ Hello.asp ������ <%= Request.ServerVariables("SERVER_NAME")%>Web �������� Tutorial Ŀ¼(<%=FilePath%>)�С������ʹ�õ����ִ�����򣨰���д�ְ壩����������ı���ʽ�����ļ���ASP ҳ����ʹ�� .asp ��չ����������������</li>

<p>��������û��Ѿ������� Hello.asp �ļ������ָ���е���һ���֣��������°汾�� Hello.asp �ļ��滻�ɰ汾�ļ���</p>

<li>�� <code>&lt;BODY&gt;</code> ��Ǻ�ʼһ���У������ƺ�ճ������Ľű����
<%
  If ScriptLanguagePreference = "JScript" Then
%>
<pre>&lt;%
    for (i = 3; i <=7;  i++)
    {
%&gt; </pre>


<%Else%>
<pre>&lt;% For i = 3 To 7 %&gt; </pre>



<% End If %><p>�ű�����λ�� <code>&lt;%</code> �� <code>%&gt;</code> �ַ���Ҳ��Ϊ�ָ������ڲ����ָ����ڲ����ı��������ű�����������ָ���������κ��ı��������������ʾΪ HTML �ı����˽ű����ʼ�� <%=ScriptLanguagePreference%> ѭ������ѭ�����ƶ��� &#147;Hello World!&#148; ��ʾ�Ĵ�������һ��ѭ�������󣬼��������� (<code>i</code>) ����Ϊ 3��ѭ���ظ��ڶ��κ󣬼���������Ϊ 4��ѭ����һֱ�ظ���ȥ��ֱ�������� <%
  If ScriptLanguagePreference = "JScript" Then
%>����<%Else%>����<% End If %> 7��</p>

<li>�� Enter ����Ȼ���ƺ�ճ�������У�</li>

<pre>&lt;FONT SIZE=&lt;% = i %&gt;&gt; </pre>

<p>ÿ��ִ��ѭ��ʱ�������С�ֱ�����Ϊ���������� (<code>i</code>) �ĵ�ʱֵ����������һ����ʾ�ı�ʱ�������СΪ 3���ڶ��Σ������СΪ 4�����һ�Σ������СΪ 7��ע�⣬�ű��������λ�� HTML ����ڲ���</p>

<li>�� Enter ����Ȼ���ƺ�ճ�������У�</li>

<pre>Hello World!&lt;BR&gt;
  &lt;/FONT&gt;
  <%  If ScriptLanguagePreference = "JScript" Then
%>&lt;% } %&gt;<%Else%>&lt;% Next %&gt;<% End If %>
  &lt;/BODY&gt;
&lt;/HTML&gt;</pre>

<p><%
  If ScriptLanguagePreference = "JScript" Then
%>JScript ������ ({ }) �ڲ�����ѭ�����ظ������ݣ�ֻҪ������С�ڵ��� 7 ���ظ�����<%Else%>VBScript��Next�������ظ�ѭ����ֱ������������ 7����<% End If %></p>



<li>��ɵ��ļ� (Hello.asp) ����Ӧ���������ı���</li>

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


<li>������ġ�ȷ�����ı���ʽ�� .asp Ϊ��չ�������ļ���</li>

<p>�ڡ����桱�Ի�����ѡ���ı���ʽ��ʱ��һЩ�ı��༭�����Զ�����չ�ļ�������Ϊ .txt���������������������ڵ��������桱֮ǰ�� .txt ��չ���滻Ϊ .asp ��չ����</p>


<li>�˳��ı��༭��������������޷����������ı��༭���д򿪵� HTML ҳ��</li>

<li>Ҫ�鿴����������鿴�������Ե���������еġ����ˡ� ��ť���ص���ָ���У����ɽ������ָ�� <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/hello.asp"> http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/hello.asp</a>��</li>

<p>��Ӧ�ÿ�������ҳ����ʾ��� &#147;Hello World!&#148; ������ÿ�����嶼������</p>


</ol>

<p>��ϲ�����Ѿ���ɵ�һ�� ASP ҳ��������ѧ������������ ASP ҳ�Ĺ��̷ǳ��򵥡�������ʹ���κ��ı��༭������ HTML ���ݺ� ASP �ű���������� <code>&lt;%</code> �� <code>%&gt;</code> �ָ����ڲ��������ļ�����ʹ�� .asp ��չ����Ҫ������ҳ���鿴����������� Web ������������ҳ����ˢ����ǰ�򿪵ĸ�ҳ����</p>

<hr>

<h2><a name="creatinganhtmlform">�γ� 2������ HTML ��</a></h2>

<p>Intranet �� Internet ������Ӧ�ó����һ��������;���Ǵ�����������ύ�ı�������ǰ������Ҫ��д������������ύ�����ݡ�ʹ�� ASP��������ͨ������ <%=ScriptLanguagePreference%> ��д�Ľű�ֱ��Ƕ�� HTML �ļ����������ASP ����ű��������������������</p>

<p>�ڱ��γ��У��������û�ͨ�� HTML ���ύ�����ݡ�</p>

<p>Ҫ�鿴 .asp �ļ���ι���������д����ı�������ʹ�� Tab ���ڱ����ƶ�������<a name="script1">�ύ</a>��ť�����ݷ��͵� Web ���������� ASP ���д���</p>

<hr>
<!--  #include virtual="/iishelp/iis/htm/tutorial/script1.asp" -->


<h4><a name="H4_37672054">������</a></h4>

<p>�����Ѿ����������������û���Ϣ�ı����������� Tutorial Ŀ¼�е� Form.htm �ļ����ҵ��ñ���(<%= VirtFilePath%>)��</p>

<pre>&lt;HTML&gt;
&lt;HEAD&gt;&lt;TITLE&gt;����&lt;/TITLE&gt;&lt;/HEAD&gt;

  &lt;BODY&gt;
   &lt;H2&gt;����������&lt;/H2&gt;
   &lt;P&gt;
   ���ṩ������Ϣ��Ȼ�󵥻�"�ύ"��
		
   &lt;FORM METHOD="POST" ACTION="response.asp"&gt;
    &lt;P&gt;
    ���֣�&lt;INPUT NAME="FirstName" SIZE="26"&gt;
    &lt;P&gt;
    ���ϣ�&lt;INPUT NAME="LastName" SIZE="26"&gt;
    &lt;P&gt;
    ��ν��&lt;INPUT NAME="Title" TYPE=RADIO VALUE="mr"&gt;����
    &lt;INPUT NAME="��ν" TYPE=RADIO VALUE="ms"&gt;Ůʿ
		
    &lt;P&gt;&lt;INPUT TYPE=SUBMIT VALUE="�ύ"&gt;&lt;INPUT TYPE=RESET VALUE="����"&gt;
   &lt;/FORM&gt;

  &lt;/BODY&gt;

&lt;/HTML&gt;</pre>


<p>������ HTML ��һ�����˱��������Ա��������ֵ�Ե���ʽ���͵� Web �����������磬�û��ڡ����֡��ı����������ֽ���ָ�ɸ����� FirstName��ASP �ṩ�ڽ��Ķ��󣬿����������ɱ��ύ�ı������ͱ���ֵ��</p>

<h3><a name="createtheaspresponsepage">���� ASP ��Ӧҳ</a></h3>

<p>������ѧϰ Web ��������δ���� HTML �����յ�����Ϣ�����ڴ˿γ̣�����Ҳ�Ѿ���������Ϊ Response.asp �� .asp �ļ����ڸ��ļ������һЩ���ӽű�����󣬼���������������ʾ�� Form.asp �յ������ݡ�</p>

<ol>
<li>ʹ���ı��༭���� <%= Request.ServerVariables("SERVER_NAME")%> Web ������ Tutorial Ŀ¼�е��ļ� Response.asp(<%=FilePath%>)��</li>

<li>�����������ű����ԡ����ڴ��ı����¸��ƺ�ճ�����нű��У�</li>

<pre><&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;</pre>

<p>���ס�����뽫�˱����Ϊ��һ���ű�����ӵ� asp �ļ��У��Ա� Web ������֪����ʹ�ú������Ա�д�ű���</p>

<li>�����������ָ�Ͽγ̡����ڴ��ı����£����ƺ�ճ�����нű��У�</li>

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

<p>��������û��Ѿ�����˱�����ָ�ϣ���ű������Ѿ������ڡ�ָ�Ͽγ̡�ע�����档ճ���Ѹ��ƵĽű����滻���нű������ Template Ŀ¼�н�δ�ù��� Response.asp ���Ƶ� Tutorial Ŀ¼��</p>

<p>���ı��� ASP �ύ������ͬ�ı�����ֵ��</p>

<ul>
<li><pre>FirstName</pre></li>
<li><pre>LastName</pre></li>
<li><pre>Title</pre></li>
</ul>

<p>ASP �� HTML ���ύ����Ϣ�洢�� Request ����� Forms �����С����ڱ��Ͷ������ϸ��Ϣ�������<a href="iiwaform.htm">�����û�����</a>��<a href="iiwaobb.htm">�ڽ��� ASP ����</a>��</p>

<p>Ҫ�� Request ���������Ϣ���ű���Ҫʹ�������﷨��
Request.collection-name ("property-name")��������Request.Form ("Title") ������ <code>mr</code> �� <code>ms</code>����ȡ�����û��ύ��ֵ��</p>

</li>

<li>���ƺ�ճ�����нű��У����ŵ����ڲ��� 3 �в����еĺ��棺</li>

<%
  If ScriptLanguagePreference = "JScript" Then
%><pre>  else
  {
    strTitle = ""
  }
  strLastName = Request.Form("LastName")
  if (strTitle == "mr")
    Response.Write(strLastName + "����")
  else
  {
    if (strTitle == "ms")
      Response.Write(strLastName + "Ůʿ")
  </pre>



<%Else%><pre>  strLastName = Request.Form("LastName")
  If strTitle = "mr" Then 
  %&gt;  
  Mr. &lt;%= strLastName %&gt;  
  &lt;% ElseIf strTitle = "ms" Then %&gt; 
  Ms. &lt;%= strLastName %&gt; </pre>



<% End If %>

<p>��������û��Ѿ�����˱�����ָ�ϣ�����Щ�ű����Ѿ����ڡ�ճ���Ѹ��ƵĽű������滻���нű������ Template ��Ŀ¼ <%=FilePath%>\template �н�δ�ù��� Response.asp ���Ƶ� Tutorial Ŀ¼��</p>

<p> <%=ScriptLanguagePreference%>&nbsp;<%
  If ScriptLanguagePreference = "JScript" Then
%><strong>if...else</strong>



<%Else%><strong>If...Then..Else</strong>



<% End If %> ��佫ִ��������ͬ�Ĳ�����ȡ���� <code>strTitle</code> ��ֵ����� <code>strTitle</code> Ϊ <code>mr</code>�����û����Ϻ���ϡ������������ <code>strTitle</code> Ϊ <code>ms</code>�����û����Ϻ����ϡ�Ůʿ�������򣬽�ʹ�����Ϻ��������ƺ��û���������ʹ�ñ��ʽ &lt;%= variable-name %&gt; ����ʾ����ֵ��</p>

<li>���Ҫ���û�û��ѡ���ν���������ʾ���Ϻ����֣��븴�ƺ�ճ�����нű��У����ŵ����� 3 �в����еĺ��棺</li>

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

<p>ͬ���أ���������û��Ѿ�����˱�����ָ�ϣ���Щ�ű����Ѿ����ڡ�ճ���Ѹ��ƵĽű������滻���нű������ Template ��Ŀ¼ <%=FilePath%>\template �н�δ�ù��� Response.asp ���Ƶ� Tutorial Ŀ¼��<br>

<p><%
  If ScriptLanguagePreference = "JScript" Then
%>�Ӻ� (<code>+</code>) ��



<%Else%>��and��(<code>&amp;</code>) ���Ž�<% End If %>������ֵ�ϳ�һ���ַ�����<%
  If ScriptLanguagePreference = "JScript" Then
%>����<strong>}</strong>������



<%Else%><strong>End If ���</strong>



<% End If %>��������������䡣</p>

</li>

<li>����� Response.asp �ĸ��Ĳ��˳��ı��༭������ȷ���ı��༭��û���滻�� .asp �ļ���չ����</li>

<li>Ҫ��֤�������ı��Ƿ���������֤�������Ե���������еġ����ˡ���ť���ش�ָ�ϣ����뽫�����ָ�� <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/form.htm">http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/form.htm</a></li>

</ol>

<p>��ϲ�����Ѿ��������Լ��ĵ�һ�� HTML ������������������͵� .asp �ļ���Ҫѧϰ COM �������ת��<a href="iiatmd2.asp">ģ�� 2��ʹ�� COM ���</a>��</p>

<hr class="iis" size="1">
<p align=center><a href="/iishelp/common/colegal.htm">&copy; 1997-1999 Microsoft Corporation ��Ȩ���С���������Ȩ����</a></p>

</font>
</body>
</html>
