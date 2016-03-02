<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>   
  
<%@ page import="java.util.*"%>   
  
<%@ page import="java.sql.*"%>   
  
<%
request.setCharacterEncoding("UTF-8");
String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "r";
htmlData = htmlData.replaceAll("&", "&amp;");
htmlData = htmlData.replaceAll("<", "&lt;");
htmlData = htmlData.replaceAll(">", "&gt;");
htmlData = htmlData.replaceAll("\"", "&quot;");

Connection con2 = null;   
  

Class.forName("com.mysql.jdbc.Driver");   

String dbUrl2 = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF8";   

String dbUser2 = "root";   

String dbPwd2 = "312312";   

con2 = DriverManager.getConnection(dbUrl2,dbUser2,dbPwd2);   
Statement stmt2 = con2.createStatement();
String sql;
sql =String.format("UPDATE student SET name='%s' WHERE id = 2",htmlData);
//sql =String.format("UPDATE student SET name='rrr' WHERE id = 2");
System.out.println("sunjunwei");
System.out.println(sql);
int rs2 = stmt2.executeUpdate(sql);
System.out.print("rs2:"+rs2);
stmt2.close();
con2.close();
%>
<%   
  
Connection con = null;   
//Statement stmt = null;   
  
//ResultSet rs = null;   
  
//try{   
  
Class.forName("com.mysql.jdbc.Driver");   
  
String dbUrl = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF8";   
  
String dbUser = "root";   
  
String dbPwd = "312312";   
  
con = DriverManager.getConnection(dbUrl,dbUser,dbPwd);   
  
out.print("已连接。。。。。");   
out.print(dbUser);
Statement stmt = con.createStatement() ;
ResultSet rs = stmt.executeQuery("SELECT name FROM student WHERE id=1") ; 
//while(rs.next()){
rs.next();
String name = rs.getString("name");
System.out.print("name:"+name);
//}
rs.close();
stmt.close();
con.close();
  
  
  
  
//}catch(Exception ex)   
  
//{   
  
//out.print("连接失败！！<br>"+ex.toString());   
  
//}   
  
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
		});
	</script>
</head>

<body>
	<%=htmlData%>
	<form name="example" method="post" action="demo.jsp">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=htmlspecialchars(htmlData)%><%=name %></textarea>
		<br />
		<input type="submit" name="button" value="提交内容" /> (提交快捷键: Ctrl + Enter)
	</form>
</body>
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