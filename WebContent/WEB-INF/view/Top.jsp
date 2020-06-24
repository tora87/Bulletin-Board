<%@page import="dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>掲示板</title>

<style type="text/css">
body{margin: 0 160px;
	padding: auto;}
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
	<div class="right">
		<a href="/kadai39/Management">
			<button>管理画面</button>
		</a>
	</div>


	<div class="top">
		<h1>～コメントひろば～</h1>
		<form action="/kadai39/Top" method="post" enctype="multipart/form-data">
			<div class="flex">
				投稿者名　
				<input type="text" id="name" name="name" value="" placeholder="名前を入力">
			</div>
			<div class="flex">
				メール　　
				<input type="email" id="mail"name="mail" value="" placeholder="@gmail.com">
			</div>
			<div class="flex">
				内容　　　
				<textarea id="texta" name="texta"  maxlength="100" placeholder="最大100文字" cols="25" rows="4"></textarea>
			</div>
			<div class="flex">
				<input type="file" name="file"/><br>
			</div>
			<input type="submit" value="投稿">
			<hr color="blue">

		</form>



	</div>

	<%
		request.setCharacterEncoding("UTF-8");
		//ArrayList<User> result = (ArrayList<User>)session.getAttribute("resultList");
		String path = "/kadai39/upload/";
		String newPath ="";
		ArrayList<User> result = UserDao.selectAllUser();
		session.setAttribute("list", result);
		for(int i = 0 ; i < result.size(); i++){
			User user = result.get(i);

	%>
			<h4>--><span class="green"><%= user.getText() %></span></h4>
			<div class="flex">
				<div>投稿者:<span class="red"><%= user.getName() %>　</span></div>
				<div>メールアドレス:<%= user.getMail() %>　</div>
				<div>投稿時間:<%= user.getPostTime()%>　</div><br>
				<%if(user.getEditTime() != null){ %>
				<div>編集時間:<%= user.getEditTime()%>　</div><br>
				<%} %>
			</div>
			<%if(user.getFileName() != null){
					newPath = new StringBuilder().append(path).append(user.getFileName()).toString();%>
				<img alt="picture" src=<%= newPath%> width="100" height="80">
			<%}%>

			<hr color="black">
	<% } %>
</body>
</html>