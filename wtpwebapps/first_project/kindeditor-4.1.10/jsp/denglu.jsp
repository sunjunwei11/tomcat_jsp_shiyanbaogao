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
	<link rel="stylesheet" href="../themes/default/baogao.css" />
	<link rel="stylesheet" href="../plugins/code/prettify.css" />
	<script charset="utf-8" src="../kindeditor.js"></script>
	<script charset="utf-8" src="../lang/zh_CN.js"></script>
	<script charset="utf-8" src="../plugins/code/prettify.js"></script>
	<script>
		KindEditor.ready(function(K) {
			var editor1 = K.create('textarea[name="content1"]', {
				width :'1300px',
				height:'500px',				
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
    <div id ="baogao_1">
    <p id="baogao_head">实验报告提交系统</p>
    <p class="head_english">&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; report commit system</p>
    </div>
    <div>
         
         <ul>
              <li><a href="#;">首页</a></li>
              <li><a href="#;">个人信息</a></li>
              <li><a href="#;">提交报告</a></li>
              <li><a href="#;">审批报告</a></li>
              <li><a href="xueshengchakan.jsp?studentid=<%=studentid%>&coursename=<%=coursename%>">查看成绩</a></li>
         </ul>     
    </div>
	<form name="example" method="post" action="tijiao.jsp?studentid=<%=studentid%>&coursename=<%=coursename%>">
		<textarea name="content1" cols="100" rows="8" style="width:700px;height:200px;visibility:hidden;"><%=content %></textarea>
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