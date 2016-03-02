<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<% 
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="../themes/default/default.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor.js"></script>
	<script charset="utf-8" src="../lang/zh_CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				cssPath : '../plugins/code/prettify.css',
				uploadJson : '../jsp/upload_json.jsp',
				fileManagerJson : '../jsp/file_manager_json.jsp',
				allowFileManager : true,
				afterCreate : function() {
					var self = this;
					K.ctrl(document, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
					K.ctrl(self.edit.doc, 13, function() {
						self.sync();
						document.forms['example'].submit();
					});
				},
			     afterUpload : function(url){
			    	 alert(url+"fff");
			    }
			});
			prettyPrint();
		K('input[name=getHtml]').click(function(e) {
				alert(editor1.html());
			});
		});
	</script>
</head>
<body>
	<%=htmlData%>
	<form name="example" method="post" action="demo2.jsp">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%><%@include file="test.jsp" %><p>hello</p></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
		<input type="button" name="getHtml" value="取得HTML" />
	</form>
	
	<%@include file="test.jsp" %>
    <%
    String savePath =pageContext.getServletContext().getRealPath("/") + "/kindeditor-4.1.10/jsp/";
    new java.io.File(savePath).mkdir();
    new java.io.File(savePath+"gmcc//").mkdir();
    java.io.File myFile=new java.io.File(savePath+"gmcc//myfile.jsp");
    java.io.FileOutputStream fout = null;
    fout = new java.io.FileOutputStream(myFile);
    String kkk = "<%@ page language="+"\"java\""+ " contentType="+"\"text/html; charset=UTF-8\""+" pageEncoding"+"="+"\"UTF-8\""+"%"+">"+"\r\n";
    byte b[]=kkk.getBytes();
    byte c[]=htmlData.getBytes();
   
    fout.write(b);
    fout.write(c);
    fout.flush();
    fout.close();
    
    %>
</html>
<%!
private String htmlspecialchars(String str) {
	str = str.replaceAll("&", "&amp;");
	str = str.replaceAll("<", "&lt;");
	str = str.replaceAll(">", "&gt;");
	str = str.replaceAll("\"", "&quot;");
	return str;
}
%>