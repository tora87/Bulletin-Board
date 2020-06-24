<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>管理者画面</title>

<style type="text/css">
body{margin: 0 160px;
	padding: auto;
	text-align: center;}
h1{color: red;
text-align: center;}
.top{text-align: center;}
.flex{
    	display: flex;
    	justify-content: center;
}
.right{text-align: right;}
.green{color: green;}
.red{color: red;}

</style>
</head>
<body>
<div class="right"><a href="/kadai39/Top"><button>TOPへ戻る</button></a></div>
<a></a>

<%
		request.setCharacterEncoding("UTF-8");
		String path = "/kadai39/upload/";
		ArrayList<User> result = UserDao.selectAllUser();
		for(int i = 0 ; i < result.size(); i++){
			User user = result.get(i);
	%>
			<h4>--><span class="green"><%= user.getText()%></span></h4>
			<span>投稿者:<span class="red"><%= user.getName() %>　</span></span>
			<span>メールアドレス:<%= user.getMail()%>　</span>
			<span>投稿時間:<%= user.getPostTime()%>　</span>
			<%if(user.getEditTime() != null){ %>
			<span>編集時間:<%= user.getEditTime()%>　</span>
			<%} %>
			<span>
			<%if(user.getFileName() != null){
					String newPath = new StringBuilder().append(path).append(user.getFileName()).toString();%>
				<img alt="picture" src=<%= newPath%> width="100" height="80">
			<%}%>
			</span>


			<form action="/kadai39/Edit" method="post">
				<textarea name="newText" maxlength="100" placeholder="変更する内容を入力(最大100文字)" cols="25" rows="4"></textarea><br>
				<input type="hidden" name="edit" value=<%= user.getId()%>>
				<input type="submit" value="編集">
			</form>

			<form action="/kadai39/Delete" method="post">
				<input type="hidden" name="delete" value=<%= user.getId()%>>
				<input type="submit" value="削除">
			</form>


			<hr color="black">
	<% } %>

</body>
</html>