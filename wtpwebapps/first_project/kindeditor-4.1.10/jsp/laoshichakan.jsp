<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>   
  
<%@ page import="java.util.*"%>   
  
<%@ page import="java.sql.*"%>   
<% 
//String path = request.getContextPath(); 
//System.out.print("path:"+path);
//String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
//System.out.print("basePath:"+basePath);
String studentid = request.getParameter("studentid");//用request得到 
System.out.print("studentid:"+studentid);
String coursename = request.getParameter("coursename");//用request得到 
System.out.print("coursename:"+coursename);
%>    
<%   
  
Connection con = null;   
//Statement stmt = null;   
  
//ResultSet rs = null;   
  
//try{   
  
Class.forName("com.mysql.jdbc.Driver");   
  
String dbUrl = "jdbc:mysql://localhost:3306/labtest?useUnicode=true&characterEncoding=UTF8";   
  
String dbUser = "root";   
  
String dbPwd = "312312";   
  
con = DriverManager.getConnection(dbUrl,dbUser,dbPwd);   
Statement stmt = con.createStatement() ;
String sql;
sql =String.format("SELECT content FROM shiyanbaogao WHERE studentid='%s' AND coursename='%s'",studentid,coursename);
ResultSet rs = stmt.executeQuery(sql) ; 
//while(rs.next()){
rs.next();
String content = rs.getString("content");
System.out.print("content:"+content);

String get_score;
get_score =String.format("SELECT score FROM shiyanbaogao WHERE studentid='%s' AND coursename='%s'",studentid,coursename);
ResultSet get_rs = stmt.executeQuery(get_score) ; 
//while(rs.next()){
get_rs.next();
String score = get_rs.getString("score");

//}
rs.close();
stmt.close();
con.close();
  
  
  
  
//}catch(Exception ex)   
  
//{   
  
//out.print("连接失败！！<br>"+ex.toString());   
  
//}   
  
%>   
<%
content = content.replaceAll("&amp;", "&");
content = content.replaceAll("&lt;", "<");
content = content.replaceAll("&gt;", ">");
content = content.replaceAll("&quot;", "\"");
%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>KindEditor JSP</title>
	<link rel="stylesheet" href="../themes/default/default.css" />
	<link rel="stylesheet" href="../themes/default/baogao.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor.js"></script>
	<script charset="utf-8" src="../lang/zh_CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>

</head>

<body>
	<form name="example" method="post" action="tijiaofenshu.jsp?studentid=<%=studentid%>&coursename=<%=coursename%>">
	    <span style="color:red;font-size:25px">分数:</span>
	    <input type="text" name="score" style="width:100px;color:red;font-size:25px" value="<%=score%>" />
		<input type="submit" name="button" value="提交" /> 
	</form>
<%=content %>
</body>
</html>
