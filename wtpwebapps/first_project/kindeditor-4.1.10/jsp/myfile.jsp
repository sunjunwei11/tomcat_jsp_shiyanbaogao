
<pre class="html" name="code"><%@ page import="java.io.*"%>   
  
<%@ page import="java.util.*"%>   
  
<%@ page import="java.sql.*"%>   
  
<%@ page contentType="text/html; charset=GB2312" %>   
  
<html>   
  
<head>   
  
<title>conn.jsp</title>   
  
</head>   
  
<body>   
  
<%   
  
Connection con = null;   
  
//Statement stmt = null;   
  
//ResultSet rs = null;   
  
try{   
  
Class.forName("com.mysql.jdbc.Driver");   
  
String dbUrl = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=UTF8";   
  
String dbUser = "root";   
  
String dbPwd = "312312";   
  
con = DriverManager.getConnection(dbUrl,dbUser,dbPwd);   
  
out.print("已连接。。。。。");   
out.print(dbUser);
Statement stmt = con.createStatement() ;
ResultSet rs = stmt.executeQuery("SELECT age FROM student WHERE id=1") ; 
while(rs.next()){
	int age = rs.getInt("age");
	System.out.print("age:"+age);
}
rs.close();
stmt.close();
con.close();
  
  
  
  
}catch(Exception ex)   
  
{   
  
out.print("连接失败！！<br>"+ex.toString());   
  
}   
  
%>   
  
</body>   
  
</html>  
  
</pre>  
