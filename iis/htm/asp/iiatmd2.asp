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

'ȷ����ǰҳ������·����Ȼ���·����ɾ���ļ�����ֻ����Ŀ¼����
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


'ȷ����ǰҳ������·����Ȼ���·����ɾ���ļ�����ֻ����Ŀ¼����
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
<html dir=ltr><head><title>ģ�� 2��ʹ�� COM ���</title>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// ����Ƿ�Ϊ Microsoft ���������
		if (TempString.indexOf ("4.") >= 0){
// ���������Ƿ�Ϊ IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// ����Ƿ�Ϊ Netscape ���������
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

<META NAME="DESCRIPTION" CONTENT="����һ�� Active Server Pages (ASP) �̳̣�������ѧϰ�����ʹ�� COM ����������Ľű����ܡ��ڱ�ģ���У�����ʹ�ð����� ASP �е� COM ���������һ��ʾ�� Web վ�㲢��ѯ���ݿ⡣">
<META HTTP-EQUIV="Content-Type" content="text/html; charset=gb2312">
<META NAME="MS.LOCALE" CONTENT="ZH-CN">
</head>

<body bgcolor="#FFFFFF" text="#000000"><font face="����">



<h1><a name="module1">ģ�� 2��ʹ�� COM ���</a></h1>

<p><a href="iiselect.asp?LessonFile=<%= Server.URLEncode(LessonFile) %>"><strong>ѡ��˿γ�ʹ�õĽű����� </strong></a></p>


<p>COM ����ṩ��װ�ġ����ظ�ʹ�õġ���ȫ�ķ�����Ϣ�ķ����������˽ű������������磬ASP �е� Database Access �������ʹ�ýű���ѯ���ݿ⡣���������ۺ�ʱ����ӽű���ѯ���ݿ⣬��û�б�Ҫ��д���ӽű���ִ�д������������Դ��κνű��������ԣ�֧�֡��Զ����������������COM ����ǡ��Զ����������������ڴ�ģ���У�����ʹ�� ASP �а����� COM ���������һ��ʾ�� Web վ�㡣</p>

<p>���������Ϥ��д .asp �ļ��Ļ���֪ʶ������ɴ�ָ�ϵ�<a href="iiatmd1.asp">ģ�� 1</a>��</p>

<p><strong><a name="note"><span style="color: #0000FF"><font color="#0000FF">Ҫ��</a></font></span></strong></p>

<ul>
<li>Ҫ����Ͳ鿴���ڴ�ģ������ɵĹ���������� <%= Request.ServerVariables("SERVER_NAME")%>Web ���������Ѱ�װ Active Server Pages���ϵ�<%= VirtFilePath %>����Ŀ¼���á�д���͡��ű���Web ������Ȩ�ޡ�</li>

<li>�γ� 2 ������̬ HTML (DHTML) �ű����򡣴˽ű�������ʾһϵ�н����Ĺ��ͼ��ÿ��ͼ��̬ת����Ҫ���нű����򲢲鿴��Ч��������Ҫʹ�� Internet Explorer 4.0 ����߰汾������ Internet Explorer ����ϸ��Ϣ������� Microsoft Web վ�� <a href="http://www.microsoft.com/isapi/redir.dll?prd=msft&ar=home"  target="_blank" >http://www.microsoft.com/</a>��</li>
</ul>

 <hr>

<h2><a name="H2_37665281"></a>�γ� 1��ʹ�� Ad Rotator ���</h2>

<p>Internet Web վ�㾭���ṩ���ռ䡣Ҫ����վ����ʵ��Ȥ�������޵Ŀռ���ʾ��������̵Ĺ�棬������ϣ��ѭ����ʾ��ͬ�Ĺ�档Ad Rotator �������������ʾÿ���������񣬶�����������¹�档���⣬������������ӻ���³������ӣ���Щ�������������û��������Ȼ����ʹ���̵� Web վ�㡣�ڴ˿γ��У� ������������ Ad Rotator ����Ľű����Ա��ֻ��ĸ����ѡ���Ĺ�档��������ġ���ʾ����ť���鿴��Ҫ��ʾ�Ĺ�淶����Ȼ���ظ������˰�ť��������ʾ����<a name="usingtheadrotatorcomponent">���</a>��<hr>
<!--#include virtual="/iishelp/iis/htm/tutorial/script4.asp" --></p>

<hr>

<h3><a name="createtheadfile">��������ļ�</a></h3>

<p>�����Ѿ�������һ����������� Web ҳ�������ǵ�������֮�ã����������в��� Ad Rotator �ű���Ҳ���Դ������ı��ļ���֪ͨ Ad Rotator ���������Щ����Լ�ÿ�������ʾʱ��İٷֱȡ������Ѿ������˰��������ļ���Ҫ�鿴���ļ�����ʹ���ı��༭���� <%= Request.ServerVariables("SERVER_NAME")%> Web ������ Tutorial Ŀ¼ (<%= FilePath %>) �е��ļ� Adrot.txt��</p>

<p>�ļ��ĵ�һ���������û��������ʱ��Ҫ���õĽű����������� Redirect.asp���������޸� Redirect.asp �ļ��Ա��ڽ��û����ӵ������ Web վ��֮ǰִ���ض��Ĳ���������ٹ���ܻ�ӭ�̶ȡ��������н������ͼ��Ŀ�ȡ��߶Ⱥͱ߿�</p>

<pre>redirect /iishelp/iis/htm/tutorial/redirect.asp
width 180
height 180
border 1</pre>


<p>��һ�����ļ�����������ݡ�����ÿ����棬��Щ���ݰ���Ҫʹ�õ�ͼ���û���������ת���� URL���ڱ����У�ת�� Redirect.asp������ͼ����ص��ı��Լ���潫Ҫ��ʾʱ��İٷֱȣ�</p>

<pre>/iishelp/iis/htm/tutorial/nyc.jpg
http://www.microsoft.com
Big Deals in the Big Apple
35</pre>


<p>�ڵ����ļ���ά�������Ϣ����������֯�е���������Ը��� Adrot.txt �ļ���������Ҫ�������� ASP ҳ����ͬ�������ά��վ��������ֵĲ�ͬ�Ĺ���ļ���</p>

<h3><a name="createthescript">�����ű�</a></h3>

<ol>
<li>ʹ���ı��༭���� <%= Request.ServerVariables("SERVER_NAME")%>Web ������ Tutorial Ŀ¼ (<%= FilePath %>) �е��ļ� Exotic.asp�� 
<br><br></li>
  <li>�� Exotic.asp ���������κ����� HTML ��ǻ� ASP ����֮ǰ��ճ�����нű��У�</li>

<pre>&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;</pre>
<p>�˽ű��� ASP ������䣬����֪ͨ Web �������ű����� <%=ScriptLanguagePreference%> ��д�ġ�������������λ�� ASP �ļ���һ�С�</p>

<li>�������ָ�Ͽγ̣�Ad Rotator����������������ӽű���</li>

<li>���� Ad Rotator �����ʵ���������丳������ Ad�������ǣ��������нű����ճ�����ı��༭���У�λ���ϲ����ı��к��棩��</li>

<pre>&lt;% <%
  If ScriptLanguagePreference = "JScript" Then

%><%Else%>Set<% End If %> Ad = Server.CreateObject("MSWC.Adrotator") %&gt; </pre>
<p>�����ʵ����������ʹ���������Ժ�Ľű��вο��������</p>

<p>��������û��Ѿ�����˱�����ָ�ϣ���˽ű������Ѿ����ڡ�ճ���Ѹ��ƵĽű����滻���нű������ߴ� Template (<%=FilePath%>\template) Ŀ¼��δ�༭���� Exotic.asp ���Ƶ� Tutorial Ŀ¼��</p>


<li>Ҫ��ʾ�¹�棬������ʹ�� Ad Rotator ����� GetAdvertisement �����������нű�������ӵ��ű��У�</li>
<pre>&lt;%<%
  If ScriptLanguagePreference = "JScript" Then
%>Response.Write(Ad.GetAdvertisement("adrot2.txt"))<%Else%>= Ad.GetAdvertisement("adrot2.txt")<% End If %>%&gt; </pre>

<p>GetAdvertisement ������һ�����������������Ϣ���ļ������������� Adrot2.txt�����ļ��Ѿ����ò����� Adrot.txt ��ͬ�������ݴ˲������÷���Ϊ��Ӧ��淵���Ѿ���ȫ��ʽ���� HTML &lt;IMG&gt; ��ǡ�Ϊ Ad Rotator ���ʵ��ָ�ɵı����� Ad λ�ڷ��� GetAdvertisement �� Adrot2.txt �ļ�·����ǰ�档�ȺŽ��������ص�ֵ��ʵ�ʵĹ�棩���͵��û��������</p>


<li>���ı���ʽ����� Exotic.asp �ĸ��ģ����˳��ı��༭������ȷ���ı��༭��û���滻 .asp �ļ���չ����</li>

<li>Ҫ��֤�������� ASP ҳ�Ƿ�������֤�������Ե���������еġ����ˡ����ش�ָ�ϣ����뽫�����ָ�� <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/exotic.asp">http://<%= Request.ServerVariables("SERVER_NAME")%>/IISHelp/IIS/Help/Htm/Tutorial/Exotic.asp</a>��</li>
</ol>

<hr>

<h2><a name="usingthebrowsercapabilitiescomponent">�γ� 2��ʹ��������������</a></h2>

<p>�����������������֧�ֵ�������� Internet ������ActiveX �ؼ�����Ƶ������̬ HTML �Լ� �ű����� (scriptlets) ������֤�����������֧����Щ���Զ������������֧�֡�ʹ�� ASP ������������������������Ƴ������ܡ��� Web ҳ���Ա���ݴ�����ҳ��������������ṩ��Ӧ�����ݸ�ʽ�����磬����Ƶ� Web ҳ����ʹ����������������ȷ���û�������Ƿ�֧����ҳ����ʾ�� ActiveX �����Ļձꡣ����������֧�֣��ձ꽫��������ʽ��ʾ���羲̬ͼ��</p>

<p>�ڱ��γ��У������Ľ��ڿγ� 1 �д����� Ad Rotator �ű������������Ӽ��� scriptlet �Ľű��� �ű����� (scriptlets) �ǰ����ű��� HTML �ļ� Web ҳ��Web ���߿ɽ�����Ϊ�ܹ��ظ�ʹ�õĿͻ��˶���Ҫ�� Web ҳ�а��� scriptlet��ֻ�������� scriptlet ���ͺ�λ����Ϣ�� HTML &lt;OBJECT&gt; ��Ǽ��ɡ��ڱ��γ��У���Ҫ������ Ad Rotator �ű��е� scriptlet ��ʹ�ö�̬ HTML (DHTML) �������˵� ad rotator���Ա㶯̬ת��ͼ��</p>

<p>Ŀǰ��ֻ�� Microsoft Internet Explorer 4.0 ����߰汾֧�� scriptlet ��ĳЩ DHTML ���ԡ�����ζ������ Ad Rotator �ű������ܹ������������͡�����û�������� Internet Explorer 4.0 ����߰汾���û�Ӧ�ܿ�����̬ת����һ��������档����û���������� Internet Explorer 4.0 ����߰汾�����û�ˢ�� Web ʱӦ������ Ad Rotator ������ɵĽ���ľ�̬��档</p>

<p><a name="browscapdemo">����</a>����ʾ����ť�鿴�� ad rotator ʹ�� scriptlet ���ɵ� DHTML ������������������������ Microsoft Internet Explorer 4.0 ����߰汾������������<a href="#usingtheadrotatorcomponent">�γ� 1</a>��һ���ľ�̬��档��</p>

<hr>
<CENTER>

<FORM  METHOD=POST ACTION="/iishelp/iis/htm/tutorial/DEMOROT.asp">
<INPUT TYPE=SUBMIT VALUE="��ʾ">
</FORM>

</CENTER>
<hr>



<h3><a name="createthescriptb">�����ű�</a></h3>


<p><strong><span style="color: #0000FF"><font color="#0000FF">Ҫ��</font></span></strong>&nbsp;&nbsp;&nbsp;���������<a href="#usingtheadrotatorcomponent">�γ� 1</a>���ܼ����˿γ̡�</p>

<ol>
<li>�����ı��༭������ Tutorial Ŀ¼ (<%= FilePath %>) �е��ļ� Exotic.asp��</li>

<li>�������ָ�Ͽγ̣�������������ܡ����ڴ��ı���������ӽű���</li>

<li>����һ��������������ʵ����������ָ�ɸ����� <code>objBrowser</code>�������ǣ��������нű����ճ���� Exotic.asp �У�<pre>&lt;% <%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%>Set<% End If %> objBrowser = Server.CreateObject("MSWC.BrowserType") %&gt;</pre>

<p>��������û��Ѿ�����˴˲���ָ�ϣ�����Щ�ű����Ѿ����ڡ�ճ���Ѹ��ƵĽű������滻���нű������ Template ��Ŀ¼ (<%=FilePath%>\template) ��δʹ�ù��� Exotic.asp ���Ƶ� Tutorial Ŀ¼��</p>

<li>
<% If ScriptLanguagePreference = "JScript" Then %>
ʹ�� JScript <strong>if...else</strong>
<% Else %>
ʹ�� VBScript <strong>If...Then...Else</strong>
<% End If %>
 �����ȷ���û�ʹ�õ�������Ƿ�Ϊ Internet Explorer 4.0 ����߰汾������ǣ���ʹ�� scriptlet�������������� Internet Explorer 4.0 ����߰汾�����Ҳ�֧�� scriptlet����ʹ�÷������� Ad Rotator �����Ҫ������߼����ɸ������нű���ճ�������� 2 ��������� <pre>&lt;%&nbsp;<%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%>Set<% End If %>&nbsp;objBrowser...%&gt;</pre> 
�ĺ��棺 
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


<p>��������û��Ѿ�����˴˲���ָ�ϣ�����Щ�ű��Ѿ����ڡ�ճ���Ѹ��ƵĽű����滻���нű������ Template ��Ŀ¼ (<%=FilePath%>\template) ��δʹ�ù��� Exotic.asp ���Ƶ� Tutorial Ŀ¼��</p>

<p>�������������� browser �� majorver ����ȷ��������Ƿ�Ϊ Internet Explorer 4.0 ����߰汾���ű�ʹ�� HTML <code>&lt;OBJECT&gt;</code>< ��ǽ� scriptlet ���� Web ҳ���˱�ǵ�����ָ�� scriptlet ������ (x-scriptlet)��λ���Լ���С��ʵ�ʵ� scriptlet Դ�ļ���Ϊ Rotate5.htm�����������Ȥ�����ļ�Ҳλ�� Tutorial Ŀ¼ (<%=FilePath%>) �С�������ʹ�ü��±����κ� HTML �༭���ߴ�����</p>

</li>

<li>�������ָ�Ͽγ� - ������������ܡ����ڴ��ı������棬���ƺ�ճ�����нű������Ա���� 
<strong><%
  If ScriptLanguagePreference = "JScript" Then
%>if<%Else%>If...Then...Else<% End If %></strong> ��䣺

<pre>&lt;%<%
  If ScriptLanguagePreference = "JScript" Then
%>
}
<%Else%> End If <% End If %>%&gt; </pre>

<p>��������û��Ѿ�����˴˲���ָ�ϣ���˽ű������Ѿ����ڡ�ճ���Ѹ��ƵĽű����滻���нű������ Template ��Ŀ¼ (<%=FilePath%>\template) ��δʹ�ù��� Exotic.asp ���Ƶ� tutorial Ŀ¼��</p>
</li>

<li>���ı���ʽ����� Exotic.asp �ĸ��ģ����˳��ı��༭������ȷ���ı��༭��û���滻 .asp ���ļ���չ����</li>

<li>Ҫ��֤������ ASP ҳ�Ƿ�������֤����Ե���������еġ����ˡ����ش�ָ�ϡ������뽫�����ָ�� <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/exotic.asp">http://<%= Request.ServerVariables("SERVER_NAME")%>/IISHelp/IIS/Help/Htm/Tutorial/Exotic.asp </a>��</li>
</ol>

<p><strong>ע��</strong>&nbsp;&nbsp;&nbsp; �ļ� Browscap.ini��Ĭ�������λ�� Winnt\System32\Inetsrv��������Ҫ�����ݣ�������������ʹ�ô�������ʶ�����������������������������µ��������������ʹ����Ĭ�� Browscap.ini �ļ���û���г������������ص����ԣ�����Ҫ����ļ�����������ݡ�</p>

<hr>

<h2><a name="usingthedatabaseaccesscomponent">�γ� 3��ʹ�����ݿ�������</a></h2>

<p>ASP ���ݿ�������ʹ�� ActiveX ���ݶ��� (ADO) ���ṩ�� OLE DB ��������Դ�����洢���ݵı�ݷ��ʡ�OLE DB ��ϵͳ����̽ӿڣ����������Ӹ�������Դ���������ݿ⡢���ӱ������������ļ���OLE DB ����һ��չʾ���ݿ����ϵͳ���ܵı�׼ COM �ӿڡ�ͨ���ṩ����Щ COM �ӿڵı�ݷ��ʣ�ADO ������ʹ�ýű����ԣ��� VBScript �� JScript�������ݿ������ӵ� Web Ӧ�ó���</P>


<P>�ڴ˿γ��У�����ʹ�� ADO �� OLE DB ����ѯ Microsoft&#174; Access ���ݿ��ļ�������һ���¼��Ȼ���� HTML ������ʾ����Ϣ��ҪԤ���˹��ܣ��뵥������ʾ����ť��</p>

<hr>
<!--#include virtual="/iishelp/iis/htm/tutorial/script6.asp" -->
<hr>

<h3><a name="identifythedatabase">��ʶ���ݿ�</a></h3>

<p>���� ADO ���ݿ�ű��ĵ�һ������Ϊ����Դָ��׼ȷ�ġ������ַ������������ַ�������һϵ���ɷֺŷָ��ı�������Щ�����������������������Դ������������ݿ��ļ���λ�á��ڴ˿γ��У����ǽ����� Microsoft&#174; Access ���ݿ��ļ� EECustmr.mdb�����ļ��ɱ�ָ���ṩ��</p>

<ol>

<li>ʹ���ı��༭���� <%= Request.ServerVariables("SERVER_NAME")%>Web ������ Tutorial Ŀ¼ ( <%= FilePath %>)�е��ļ� Database.asp��</li>

<li>�����������ű����ԡ����ڴ��ı������棬���ƺ�ճ�����нű��У�</li>

<pre>&lt;%@ LANGUAGE=<%=ScriptLanguagePreference%> %&gt;</pre>
<p>����ʼ��ȷ�����˱����Ϊ��һ�нű���ӵ����е� .asp �ļ��С�</p>

<li>�������ָ�Ͽγ� - ADO ���ӡ����ڴ��ı����£��������ƺ�ճ���ű���</li>
<li>���ƺ�ճ��������䣺</li>

<pre>&lt;%
  strDBVirtualPath = "/iishelp/iis/htm/tutorial/EECustmr.mdb"
  strDBLocation = Server.Mappath(strDBVirtualPath)
  
<% If ScriptLanguagePreference = "JScript" Then %>
  strSource = "Provider=Microsoft.Jet.OLEDB.3.51;Data Source=" + strDBLocation<% Else%>  strSource = "Provider=Microsoft.Jet.OLEDB.3.51;Data Source=" & strDBLocation<% End If %></pre>

<P>ǰ������䶨�巶�����ݿ��λ�á�����ʹ�� Server ����� MapPath �����������·������ EECustmrs.mdb ������λ�á������������������֣���������ʵ�ʵ������ַ�������һ����ָ����data provider���������� OLE DB չʾ���ݿ⹦�ܵ���������������ָ���� Microsoft&#174;&nbsp;Jet ���ݿ����棬�����Դ���� Microsoft Access ���������������ַ����ĵڶ�����ֻ��ʾ����Դ &#151;EECustmr.mdb��</P>
</ol>

<h3><a name="createthecomponentinstance">����һ�� ADO Connection ����ʵ��</a></h3>
<ol>
<li>���ǽ�ʹ�� ADO Connection �������������ݿ⡣ͬ���أ�����Ҫ�����˶����ʵ������ʹ�ô˶��󡣸��ƺ�ճ�����нű����</li>
<pre> 
<%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%>Set<% End If %> objConnection = Server.CreateObject("ADODB.Connection")  </pre>

<p>��������û��Ѿ�����˴˲���ָ�ϣ���˽ű������Ѿ������ڡ�ָ�Ͽγ̡�ע�����档ճ���Ѹ��ƵĽű����滻���нű������ Template ��Ŀ¼ (<%=FilePath%>\template) ��δʹ�ù��� Database.asp ���Ƶ� Tutorial Ŀ¼��</p>

<li>����������Ҫ��һ�������ݿ�����ӡ������������������ַ��������ƺ�ճ�����нű����</li>

<pre>objConnection.Open<%
  If ScriptLanguagePreference = "JScript" Then
%>(strSource)<%Else%> strSource<% End If %> </pre>

<li>ʹ�� ADO �� Execute �������Է��ͽṹ����ѯ���� (SQL) �� SELECT ��������ݿ⣬���ڽ���� (<code>rsCustomersList</code>) �д洢���صļ�¼���� <code>objConnection.Open</code> ������渴�ƺ�ճ�����нű����</li>

<%
  If ScriptLanguagePreference = "JScript" Then
%><pre>rsCustomersList = objConnection.Execute("SELECT * FROM Customers")
%&gt;</pre><%Else%><pre>SQLQuery = "SELECT * FROM Customers"  
Set rsCustomersList = objConnection.Execute(SQLQuery)
%&gt;</pre>



<% End If %>

<%
  If ScriptLanguagePreference = "JScript" Then
%><%Else%><p>�����Ժϲ������нű��������ǽ�ʵ�ʵ� SQL ��ѯ�ַ���ֱ�Ӵ��ݸ� Execute ��������������ָ�ɸ����� SQLQuery���������� SQL SELECT ̫��ʱ���Ƚ��ַ����������������� SQLQuery�����ٽ����������ݸ� Execute ��������߽ű��Ŀɶ��ԡ�</p><% End If %>

</ol>

<h3><a name="displaythereturnedresultset">��ʾ���صĽ����</a></h3>

<p>�����Խ����������һ������ṹ�� SQL SELECT �����ָ�����ֶξ�������ˣ���ʾ��ѯ���ص��о���ͬ�Խ��������ִ��ѭ��һ�����ס��ڴ����У����ص�������ʾ�� HTML ������С�</p>

<ol>

<li>�� Database.asp �У����Ҵ��ָ�Ͽγ� - ��ʾ ADO ���ݡ���Ȼ����ע�����渴�ƺ�ճ������ VBScript <strong>Do...Loop</strong> ��䣺</li>
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

<p>��������û��Ѿ�����˴˲���ָ�ϣ���˽ű������Ѿ����ڡ�ճ���Ѹ��ƵĽű����滻���нű������ Template Ŀ¼��δʹ�ù��� Exotic.asp ���Ƶ� Tutorial Ŀ¼��</p>

<p><%=ScriptLanguagePreference%> <%
  If ScriptLanguagePreference = "JScript" Then
%> <strong>while</strong> loop<%Else%> <strong>Do...Loop</strong><% End If %> ��䵱����Ϊ��ʱ�ظ�ִ�����顣�ظ����������ǽű������ HTML �ı��ͱ�ǡ�������ÿ����һ��ѭ�����Ϳ��Լ���һ�����У�ʹ�� HTML�������뷵�ص����ݣ�ʹ�ýű������</p>

<li>Ҫ���ѭ������ʹ�� <strong>MoveNext</strong> ���������������ָ�������ƶ�һ�С���Ϊ��������� <strong>Do...Loop</strong> ����ڲ�������һֱ�ظ�ֱ�������ļ���β���ڰ������ָ�Ͽγ� - ������һ�С���ע�����渴�ƺ�ճ�����нű��У�</li>

<pre>&lt;% 
<%
  If ScriptLanguagePreference = "JScript" Then
%>  rsCustomersList.MoveNext()
}<%Else%>  rsCustomersList.MoveNext 
Loop<% End If %> 
%&gt;</pre>

<li>���ı���ʽ����� Database.asp �ĸ��ģ����˳��ı��༭������ȷ���ı��༭��û���滻�� .asp �ļ���չ����</li>

<li>Ҫ��֤�����Ľű��Ƿ�������֤֮����Ե���������еġ����ˡ����ش�ָ�ϣ����뽫�����ָ�� <a href="http://<%= Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/database.asp"> http://<%= Request.ServerVariables("SERVER_NAME")%>/IISHelp/IIS/Help/Htm/Tutorial/Database.asp</a>��</li>
</ol>

<P>ѧ����δ����򵥵����ݷ��ʽű���������ϣ��ѧϰ����֪ʶ������ǳ�ѧ�ߣ������ Microsoft Universal Data Access (UDA) Web վ�� <A HREF="http://www.microsoft.com/isapi/redir.dll?prd=mdac" target="_blank">http://www.microsoft.com/data/</A> ��ѧϰ���� ADO �Լ�������� UDA ������֪ʶ��</P>

<p>��������ѧ����ʹ�� COM ��������Լ���ѧϰ<a href="iiatmd3.asp">ģ�� 3����д�Լ������</a>��</p>

<hr class="iis" size="1">
<p align=center><a href="/iishelp/common/colegal.htm">&copy; 1997-1999 Microsoft Corporation ��Ȩ���С���������Ȩ����</a></p>
</font>
</body>
</html>
