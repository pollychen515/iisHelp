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
VirtFilePath = left(MainPath, Length) + "/tutorial"

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html dir=ltr><head><title>ģ�� 3����д�Լ������</title>

<SCRIPT LANGUAGE="JavaScript">
<!--
	TempString = navigator.appVersion
	if (navigator.appName == "Microsoft Internet Explorer"){	
// ����Ƿ�Ϊ Microsoft �������
		if (TempString.indexOf ("4.") >= 0){
// ���������Ƿ�Ϊ IE 4
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/coua.css">');
		}
		else {
			document.writeln('<link rel="stylesheet" type="text/css" href="/iishelp/common/cocss.css">');
		}
	}
	else if (navigator.appName == "Netscape") {						
// ����Ƿ�Ϊ Netscape �������
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

<body bgcolor="#FFFFFF" text="#000000"><font face="����">
 
<h1><a name="module3writingyourownactivexservercomponents">ģ�� 3����д�Լ������</a></h1>

<p><a href="iiselect.asp?LessonFile=<%= Server.URLEncode(LessonFile)%>">ѡ��˿γ�ʹ�õĽű�����</strong></a></p>

<p>��<a href="iiatmd2.asp">ģ�� 2</a>�У����Ѿ���Ϥ�� Active Server Pages (ASP) �ṩ����������ڿ��Կ��Ǵ��������Լ�����Ҫ��������</p>

<p>��������Ҫ����һ�� ASP Ӧ�ó����Ա����û��ṩ���ض������ܵ� Web ���ʡ���Ȼ ASP û����ȷ���ṩ�����Ĺ��ܣ���������ͨ�������Լ��� COM �� Java ��������˹�����ӵ�����Ӧ�ó����У����ڴ�ģ���н���ɴ������<p>

<p>��ʼ֮ǰ����ʹ�����б�ѡ��һ��������Ա�ѧϰ��δ�����ִ�������</p>

<hr>

<h3><A NAME="H3_22047542">ѡ���ڴ˿γ���Ҫ�����������</A></h3>

<form method=post action="iiatmd3.asp#location">
<input type=radio name=ComponentPref value=VB5 <%= VB5Checked  %>>Visual Basic&nbsp;5.0������߰汾�� COM ���<br>
<input type=radio name=ComponentPref value=JavaComp <%= JavaChecked %>>Visual&nbsp;J++&nbsp;1.1 ����ߣ�Java&#153 �б�д�� COM ���<br><br>
<input type=submit value="ѡ��">
</form>

<hr>

<p><strong><span style="color: #0000FF"><font color="#0000FF"><a name="location">Ҫ��</e></font></span></strong></p>

<ol>
<li>Ҫ����Ͳ鿴���ڴ�ģ������ɵĹ���������Ҫ�� 

<ul>
<li>�� <%= Request.ServerVariables("SERVER_NAME")%> Web ���������Ѱ�װ Active Server Pages���ϵ�<%= VirtFilePath %>����Ŀ¼���С���д���͡��ű���Web ������Ȩ�ޡ���ϸ��Ϣ�������<a href="/iishelp/iis/htm/core/iiwspsc.htm">���� Web ������Ȩ��</a>��</li>


<li>���� Windows �ʺű������ NTFS Ȩ�ޣ��Ա�����������д���Լ�����

<%
  If ComponentPref = "JavaComp" Then
%> <em>DriveLetter</em>:\Winnt\Java Ŀ¼������Ŀ¼�еĳ��򣬴˴� <em>DriveLetter</em> ��ӳ�䵽 <%= Request.ServerVariables("SERVER_NAME")%> Web ��������������������ĸ��</li><%Else%><em>DriveLetter</em>:\Winnt\System32\Inetsrv\��������Ҫ�� <em>DriveLetter</em> �滻Ϊӳ�䵽 <%= Request.ServerVariables("SERVER_NAME")%> Web ��������������������ĸ���������������Ĭ�ϰ�װĿ¼���ɽ� \Winnt\System32 �滻�����Լ��İ�װĿ¼���ơ���</li>
<% End If %>

</ul>

<li>Ҫ��ɴ�ģ�飬������ <%= Request.ServerVariables("SERVER_NAME") %> Web �������ϰ�װ��</li>

<ul>
 <li><% If ComponentPref = "JavaComp" Then
%>Microsoft&#174;  Visual&nbsp;J++&#153;&nbsp;1.1 ����߰汾��
<%Else%>32 λ�汾�� Microsoft&#174; Visual Basic&nbsp;5.0 �����֮רҵ�棻 Visual Basic&nbsp;5.0 �����֮��ҵ�濪��ϵͳ��
<% End If %></li>
</ul>

<li>����������� Web ��������� Java �����������Ҫ������ָ�ϣ��������øù��ܡ�</li>

</ol>

<hr>

<h2><a name="creatingthefinancecomponent">�γ� 1������ <%
  If ComponentPref = "JavaComp" Then
%>Java
<%Else%>COM
<% End If %> �������</a></h2>



<%  If ComponentPref = "JavaComp" Then%>


<p>��������Ҫ����һ�� Web Ӧ�ó������������޷�ͨ�� <%= ScriptLanguagePreference %> ������ʵ�ֵĹ��ܡ���Ϊ <%= ScriptLanguagePreference %> ���ṩ�����ܣ�������������ȷ�ض���ʹ�����װ�˹��ܵĽű����򡣱�Ҫʱ���Դ�Ӧ�ó���ű��е��������Ĺ��̡�</p>

<P>һ������£����ַ����Ƿ�װ�Զ��幦�ܵ���ȫ������������ǣ������������ Web Ӧ�ó���Ҫ�����ڳ�ǧ������û��������߼��ܷ�װ˽��ӵ�еĹ������ڴ�����£��������ʽ��װ������һ�ָ��õķ���������Ƚű������ṩ���õİ�ȫ�Ժ����ܡ�</P> 

<P>��ָ�ϵı��γ��У�����ѧϰ��δ����ͷ�װһ�������������������������ݹ̶����ʺ������ԵĹ̶�����������Ͷ�ʵ�δ����ֵ��</p>


<h3><A NAME="H3_22050303">���� Visual J++</A></h3>

<ol>
<li>��������ʼ����ָ�򡰳��򡱣�Ȼ��ָ��Microsoft Visual&nbsp;J++&nbsp;1.1����</li>
<li>�����Ӳ˵��еġ�Microsoft Developer Studio����������ƻ�����</li>
</ol>

<h3><a name="nametheproject">��������������</a></h3>

<ol>
<li>�������ļ�����</li>
<li>ѡ���½�����</li>
<li>���������̡�ѡ���</li>
<li>ѡ��Java ���̡���</li>
<li>�ڡ������������У����롰Finance����Ȼ�󵥻���ȷ������</li>
</ol>

<h3><A NAME="H3_22050969">�� Finance ����ӵ�����</A></h3>

<ol>
<li>�ڡ����롱�˵��У�ѡ�����ࡱ��</li>
<li>�ڡ����ơ����У����롰Finance����Ȼ�󵥻���ȷ�������ı��༭���н���ʾ��</li>

<pre>class Finance {


}
</pre>

<p><strong>ע��</strong>&nbsp;&nbsp;&nbsp;�����Ʊ����� Java ����������Ĺ�������ͬ��</p>
</ol>

<h3><A NAME="H3_22051481">�� CalcFV ������ӵ� Finance ��</A></h3>

<ol>	
<li>ѡ��ClassView��ѡ���Ĭ��ѡ�У���</li>
<li>չ�����ؼ��еġ�Finance �ࡱ��Ŀ��</li>
<li>�Ҽ�������Finance���࣬Ȼ��ѡ����ӷ�������</li>
<li>�ڡ��������͡����У����롰public double����</li>
<li>�ڡ��������������У�������ĸ��Ʋ�ճ����ȥ��</li>

<code>CalcFV(double dblRate, double dblNPer, double dblPMT, double dblPv, boolean bType)</code>  

<p>ͨ��������������������������Ͷ��δ����ֵ�Ĳ��������ú������� Finance �ࡣ <br>

<li>������ȷ������Visual J++ �ı��༭����Ӧ��ʾ��</li>

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
 
<li>�����ż��������棬���ƺ�ճ������ Java ���뵽�ı��༭���У�</li>

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

<p>��Ҫη����Щ���룬��ֻ�Ƕ����˱�Ҫ����ѧ���̣�ʹ�� Java �﷨�����Ա����Ͷ�ʵ�δ����ֵ���������Ȥ�����������������в�����ѧ���ƿα����ҵ�����������÷��̵���Ϣ��</p>

<p><strong>ע��</strong>&nbsp;&nbsp;&nbsp;Java ���ִ�Сд�������������ǰ��Ĵ����м����ı��༭������ȷ������� Java �﷨�ͱ�����ȫ�������һ����</p>
	
</ol>

<h3><A NAME="H3_22053702">���� Finance ���</A></h3>

<ol>
<li>�ڡ�Build���˵��У�ѡ��Build Finance����</li>
<li>�ڡ�Build�����ڣ�λ�� ClassView ���ı��༭�������棩�У���ȷ������������û�������κδ���򾯸档</li>
</ol>

<h3><A NAME="H3_22054061">�� Finance ������Ƶ� Trustlib Ŀ¼</A></h3>

<ol>
<li>���� Windows����ʼ����ť��ָ�򡰳��򡱣�Ȼ�󵥻���Windows ��Դ����������</li>
<li>�� Finance.class ����� Program Files\DevStudio\MyProjects\Finance\ Ŀ¼���Ƶ�<%= Request.ServerVariables("SERVER_NAME") %> Web �������� Winnt\Java\Trustlib Ŀ¼��</li>
</ol>

<h3><a name="registerthefinanceservercomponent">ע�� Finance Java ��</a></h3>

<p>����ע�� Finance Java �࣬���� JScript �Լ�������ϵ��������� OLE �������Զ��޷���������</p>

<ol>
<li>��������ʾ���ڡ�</li>
<li>��������ʾ�¼��� <strong>cd <em>Drive Letter</em>:\<%= Request.ServerVariables("SERVER_NAME")%>\Program Files\DevStudio\VJ\Bin\</strong>������ <em>Drive Letter</em> ��ӳ�䵽���������Ӧ����������ĸ�������������Ĭ�ϰ�װĿ¼����ʹ�����İ�װĿ¼�������滻 \Program Files\DevStudio\VJ\Bin\����</li>
<li>�� Enter ����</li>
<li>���� <strong>javareg /register /class:Finance /progid:MS.Finance.Java</strong>��</li>
<li>�� Enter ����</li>
<li>�����ֶԻ�����ʾ��Successfully Registered Java class "Finance" as CLSID��ʱ��������ȷ������ť��</li>
<li>�ر�������ʾ���ڡ�</li>
</ol>

<%Else%>
<p>��������Ҫ����һ�� Web Ӧ�ó������������޷�ͨ�� <%= ScriptLanguagePreference %> ������ʵ�ֵĹ��ܡ���Ϊ <%= ScriptLanguagePreference %> ���ṩ��������������������ȷ�ض���ʹ�����װ�˹��ܵĽű����򡣱�Ҫʱ���Դ�Ӧ�ó���ű��е��������Ĺ��̡�</p>

<P>һ������£����ַ����Ƿ�װ�Զ��幦�ܵ���ȫ������������ǣ������������ Web Ӧ�ó���Ҫ�����ڳ�ǧ������û��������߼��ܷ�װ˽��ӵ�еĹ������ڴ�����£��������ʽ��װ�����Ǹ��õķ���������Ƚű����ṩ���õİ�ȫ�Ժ����ܡ�</P> 

<P>��ָ�ϵı��γ��У�����ѧϰ��δ����ͷ�װһ�������������������������ݹ̶����ʺ������ԵĹ̶�����������Ͷ�ʵ�δ����ֵ��</p>
<br>

<h3><a name="startvisualbasic">���� Visual Basic</a></h3>

<ol>
<li>��������ʼ����ָ�򡰳��򡱣�Ȼ��ָ��Microsoft Visual Basic&nbsp;5.0����</li>
<li>�����Ӳ˵��еġ�Visual Basic&nbsp;5.0����������ƻ�����</li>
</ol>

<h3><a name="nametheproject">��������������</a></h3>

<ol>
<li>�ڡ��½����̡��Ի����У�˫����ActiveX DLL����</li>
<li>�ڡ����̡��˵��ϣ����������� 1 ���ԡ���</li>
<li>�ڡ�ͨ�á�����ҳ�ϵġ������������У����롰MS����</li>
<li>ѡ��ִ�����û����桱�� </li>

<p><strong>ע��</strong>&nbsp;&nbsp;&nbsp;ѡ�д�ѡ��󣬹�������ʱ������Ҫ�û���Ԥ��Ҳ����ʾ�û�����Ԫ�ء�</p>

<li>������ȷ������</li>
</ol>

<p>�˹���������Ϊ MS���Ժ������Դ� ASP �ű���ͨ�� <code>MS.Finance</code> ���� Finance �����������</p>

<h3><a name="addthefinanceclasstotheproject">�� Finance ����ӵ�����</a></h3>

<p>�� Visual Basic �У�Ҫ��������һ��ɵ��ú���������������Զ��塰�ࡱ���༯������෽�������ԡ������Ĺ����У����������ָ���Ĳ��񷽷���</p>

<ol>
<li>�� F4 ����ģ��ġ����ԡ����ڣ�Ȼ��˫�������ơ����Բ����롰Function����Ȼ�� Enter ����</li>
<li>˫����Instancing����</li>
<li>������ͷ��Ȼ��ѡ��5 - MultiUse����</li>
</ol>

<h3><a name="learnmoreaboutvisualbasicfinancefunctions">��һ��ѧϰ Visual Basic Finance ����</a></h3>

<p>Visual Basic ����ϵͳ�����˿��õĲ�������</p>

<ol>
<li>��������������</li>
<li>ѡ��Microsoft Visual Basic �������⡱��</li>
<li>ѡ��������ѡ���Ȼ����롰����������Ϊ�������</li>
<li>˫�����������������</li>
<li>������FV �������鿴��ϸ��Ϣ��</li>
<li>����ɲ鿴������ʱ���رա�Visual Basic �������Ի���</li>
</ol>

<h3><a name="addthecalcfvfunctiontothefinanceclass">�� CalcFV ������ӵ� Finance ��</a></h3>

<p>Finance �����������ҪһЩ��̴��롣�˴���ʹ�� Visual Basic �ڽ���δ����ֵ������������Щ������������ԡ�</p>

<p>�������и��ƺ�ճ���� Finance ����봰���У�</p>

<pre>Public Function CalcFV(rate, nper, pmt, Optional pv, Optional whendue) 
CalcFV = FV(rate, nper, pmt, pv, whendue)
End Function</pre>

<h3><a name="addthecomponentsentrypoint">����������ڵ�</a></h3>

<p>���з������������Ҫһ����ڣ���ʼ���㡣���Ƕ����״ζ����Կ���ʱ��Ҫ���õĴ��롣�� VBScript �У�����ʹ�� Server.CreateObject ʱ��������һ�������ʵ����ִ�� Server.CreateObject ���ʱ�������÷����������ʹ�� Visual Basic ������������е� Sub Main ���̡�</p>

<p>���ò������ʱ��������Ҫר�����κ���������ʼ��������ˣ��������ṩһ���յģ�û�� Visual Basic ��䣩Sub Main ���̡�</p>

<ol>
<li>�ڡ����̡��˵��У�ѡ�����ģ�顱��</li>
<li>�ڡ�ģ��&nbsp;1���Ի����У�˫��ģ��ͼ�ꡣ</li>
<li>��ģ�� 1 ���봰���У����롰Sub Main����</li>
<li>�� Enter ����</li>
</ol>

<p>�������Զ��������д��룺</p>

<pre>Sub Main()
End Sub</pre> 

<h3><a name="savethefinanceproject">���� Finance ����</a></h3>

<p>��������������ʱ����Ҫ�������� Visual Basic ���̵������������֡���Щ���ְ��������ļ�����ģ���Լ�����ģ�顣</p>

<ol>
<li>�򿪡��ļ����˵���</li>
<li>ѡ�񡰱��湤�̡���</li>
<li>�ڡ��ļ������ı����У����� Finance��ѡ�� <%= Request.ServerVariables("SERVER_NAME")%> Web �������ϵ�����·���� <strong><em>Drive Letter</em>:\Winnt\System32\Inetsrv\</strong>������  <em>Drive Letter</em> ��ӳ�䵽��Ӧ����������ĸ�������������Ĭ�ϰ�װĿ¼���������İ�װĿ¼�������滻 \Winnt\System32����</li>
<li>���������桱��ť��</li>
<p>����Ѿ����û���ɴ˲���ָ�ϣ�������Ϣ��ʾ���ļ��Ѿ����ڡ����������ļ��汾���滻�ɰ汾��</p>
<li>˫��ѡ�����ļ������ı����е�ֵ��Project1����</li>
<li>�������ơ�Finance����Ϊ�����ļ� (.vbp)��</li>
<li>���������桱��ť���湤�̡�</li>
<p>����Ѿ����û���ɴ˲���ָ�ϣ�������Ϣ��ʾ���ļ��Ѿ����ڡ����������ļ��汾���滻�ɰ汾��</p>
</ol>

<h3><a name="makethecomponentaninprocesscomponent">�������Ϊ���������</a></h3>

<p>Visual Basic ���������������� COM �������ǰ��Ϊ OLE �Զ������������ͽ����� COM ����������� COM ������ɵ��ý��̼��صĶ�̬���ӿ⣨�ļ���չ��Ϊ .dll���������� COM ����ǿ�ִ���ļ����ļ���չ��Ϊ .exe��������Ϊ����Ӧ�ó���֮��ĵ������������С���Ϊ�������������ó���λ��ͬһ���̿ռ䣬���ԱȽ���������ṩ���õ����ܡ�</p>

<p>Ҫʹ Finance �����������Ϊ������ COM ���</p>

<ol>
<li>�򿪡��ļ����˵���</li>
<li>ѡ������ Finance.dll����</li>
<li>������ѡ���ť��</li>
<li>ѡ���Զ���������ѡ��</li>
<li>������ȷ������</li>
<li>���� <strong><em>Drive Letter</em>:\<%= Request.ServerVariables("SERVER_NAME")%>\Winnt\System32\Inetsrv\Finance</strong>������ <em>Drive Letter</em> ��ӳ�䵽���������Ӧ����������ĸ�������������Ĭ�ϰ�װĿ¼���������İ�װĿ¼�������滻 \Winnt\System32����<br>
����Ѿ����û���ɴ˲���ָ�ϣ�������Ϣ��ʾ���ļ��Ѿ����ڡ�����������ļ��汾���滻�ɰ汾</li>
<li>�˳� Visual Basic��</li>
</ol>

<h3><a name="registerthefinanceservercomponent">ע�� Finance ���������</a></h3>

<p>���з��������������ע�ᡣWindows ����ϵͳע��������ٿ��õķ����������ͨ��ע�� Finance �����������VBScript �ͼ�����ϵ��������� OLE �������Զ����Ե��ø������</p>

<ol>
<li>��������ʾ���ڡ�</li>
<li>��������ʾ�¼��� <strong>cd <em>Drive Letter</em>:\<%= Request.ServerVariables("SERVER_NAME")%>\Winnt\System32\Inetsrv</strong>������ <em>Drive Letter</em> ��ӳ�䵽���������Ӧ����������ĸ�����������Ĭ�ϰ�װĿ¼���������İ�װĿ¼�������滻 \Winnt\System32����</li>
<li>�� Enter ����</li>
<li>���롰regsvr32 Finance.dll����</li>
<li>�� Enter ����</li>
<li>�����ֶԻ�����ʾ��DllRegisterServer in finance.dll succeeded��ʱ��������ȷ������</li>
<li>�ر�������ʾ���ڡ�</li>
</ol>

<hr>

<% End If %>

<h2> <a name="callingthefinancecomponentfromascript">�γ� 2���ӽű��е��� Finance ���</a></h2>

<p>Ҫ��������������Դ� Active Server Pages (ASP)��Visual&nbsp;Basic��ʹ�� Visual&nbsp;Basic Ӧ�ó���� Microsoft&#174;&nbsp;Office ��Ʒ�������κΡ�OLE �Զ����������е��������</p>

<p>Ҫͨ�� <%=ScriptLanguagePreference%> �� Active Server Pages �е��á�Finance �����������������ʹ�ñ�������������˴���ƻ���δ����ֵ��</p>

<h3><a name="thehtmlform">HTML ��</a></h3>

<p>HTML ���������ռ���Щ��������ƻ���ֵ����Щֵ�Ƿ���ı����������� ASP �ű�����Ϊ Request ����һ���֡����������� HTML ���е�ֵ�����磬����ͨ��ʹ�ýű� <strong><code>Request("APR")</code></strong> �������ڱ�������������ʡ�HTML ��� <code>&lt;INPUT TYPE=TEXT NAME=APR&gt;</code> �ṩ����ֵ������������ֶΡ�</p>

<p>Ҫ�������͵����� ASP �� Microsoft Web ���������û��ɵ������ύ����ť�����ύ����ť���� HTML ����ǵ� <code>ACTION</code> ������ָʾ����ҳ�����ύ����ť�� HTML ��� (<code>&lt;INPUT TYPE=SUBMIT VALUE=" ����δ����ֵ "&gt;</code>) ʹ�� HTML ����� (<code>&lt;FORM METHOD=POST 
ACTION="Finance<%If ScriptLanguagePreference = "JScript" Then
%>j<%Else%><% End If %>.asp"&gt;</code>) �� <code>ACTION</code> ֵ������ ASP ҳ Finance<%
  If ScriptLanguagePreference = "JScript" Then
%>j<%Else%><% End If %>.asp��</p>
<p>�����Ѿ�Ϊ�������˱�����ʹ���ı��༭����<%= Request.ServerVariables("SERVER_NAME")%> Web ������ Tutorial Ŀ¼ (<%= FilePath %>) �е��ļ� FVform.asp��</p>

<h3><a name="thescript">�ű�</a></h3>

<p>������ʹ�� <%=ScriptLanguagePreference%> ���� Finance ������������ű�����ʱ����֤���� HTML �������룬��Ϊ����û�������ֵָ��Ĭ��ֵ��<%
  If ScriptLanguagePreference = "JScript" Then
%>�Զ��庯�� IsNumeric �������� HTML ����ÿ�������Ƿ���������Ч����ֵ��<%Else%>VBScript IsNumeric ������������ HTML ����ÿ�������Ƿ���������Ч����ֵ��</p>
<% End If %>

<%
  If ComponentPref = "JavaComp" Then
%><p>Server.CreateObject ���� Finance ��� <code>MS.Finance.Java</code> ��ʵ��������ʹ��������ظ�ʹ�ã������������ʵ�����������������ķ��������ԡ�Server.CreateObject<%Else%> ����Ľű���
<p>Server.CreateObject ���� Finance ��� <code>MS.Finance</code> ��ʵ��������ʹ��������ظ�ʹ�ã������������ʵ�����������������ķ��������ԡ�Server.CreateObject ����Ľű���<% End If %>ʹ�� CalcFV ���������㴢��ƻ���δ����ֵ������������ʾ��������Ϣ���û�������С�</p>

<p>Ҫ�鿴�ű�����ʹ���ı��༭�����ļ� <%
  If ScriptLanguagePreference = "JScript" Then
%>Financej.asp



<%Else%>Finance.asp



<% End If %>�����ļ�λ�� Tutorial Ŀ¼ (<%= FilePath %>) �С�</p>

<h3><a name="usingyourbrowsertorunthetest">ʹ����������в���</a></h3>

<p>Ҫ���� <%
  If ScriptLanguagePreference = "JScript" Then
%>Financej
<%Else%>Finance
<% End If %> ASP ҳ����� FVform.asp  �ļ������ļ������������ <%
  If ScriptLanguagePreference = "JScript" Then
%>Financej.asp<%Else%>Finance.asp<% End If %> �ű����������ָ���Ĵ���ƻ���δ����ֵ��</p>

<ol>
<li>�������ָ�� <a href="http://<%=Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/FVform.asp?ScriptLanguagePreference=<%=ScriptLanguagePreference%>&ComponentPref=<%=ComponentPref%>">http://<%=Request.ServerVariables("SERVER_NAME")%>/iishelp/iis/htm/tutorial/FVform.asp</a>���� FVform.htm��</li>
<li>�ڡ�����ƻ����������������ֵ��</li>
<li>����������δ����ֵ����ť������ʾ����ƻ���ֵ��</li>
</ol>

<p>�ڽ϶̵�ʱ�������Ѿ�������һ�����õ� <%
  If ComponentPref = "JavaComp" Then
%>Java<%Else%>COM<% End If %> ����������Ҫ����������������������ʹ�� <%
  If ComponentPref = "JavaComp" Then
%>Visual J++<%Else%>Visual Basic<% End If %> ʵʩ��������������������Ϊ Finance ����������ĸ��ӷ��������ǹ�������ʵ����������� <%If ComponentPref = "JavaComp" Then%>Java<%Else%>COM<% End If %> ����Ĵ��·��������ã����ͻᷢ�ֿ���ʹ����������κ� Web Ӧ�ó���</p>

<hr class="iis" size="1">
<p align=center><a href="/iishelp/common/colegal.htm">&copy; 1997-1999 Microsoft Corporation ��Ȩ���С���������Ȩ����</a></p>
</font>
</body>
</html>
