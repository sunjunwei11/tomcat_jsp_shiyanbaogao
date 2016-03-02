<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>   
  
<%@ page import="java.util.*"%>   
  
<%@ page import="java.sql.*"%>   
 
<%
request.setCharacterEncoding("UTF-8");
String score = request.getParameter("score") != null ? request.getParameter("score") : "";

String studentid = request.getParameter("studentid");//用request得到 
System.out.print("studentid:"+studentid);
String coursename = request.getParameter("coursename");//用request得到 
System.out.print("coursename:"+coursename);

Connection con2 = null;   
  

Class.forName("com.mysql.jdbc.Driver");   

String dbUrl2 = "jdbc:mysql://localhost:3306/labtest?useUnicode=true&characterEncoding=UTF8";    

String dbUser2 = "root";   

String dbPwd2 = "312312";   

con2 = DriverManager.getConnection(dbUrl2,dbUser2,dbPwd2);   
Statement stmt2 = con2.createStatement();
String sql;
sql =String.format("UPDATE shiyanbaogao SET score='%s' WHERE studentid ='%s' AND coursename='%s'",score,studentid,coursename);
//sql =String.format("UPDATE student SET name='rrr' WHERE id = 2");
System.out.println("sunjunwei");
System.out.println(sql);
int rs2 = stmt2.executeUpdate(sql);
System.out.print("rs2:"+rs2);
System.out.println("提交成功");
out.print("提交成功");  
stmt2.close();
con2.close();
%>
   
<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<title>提交报告</title>

</head>

<body>
</body>
</html>