<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>MiniNotes</title>
		<link rel='stylesheet' type='text/css' href='estilo.css'>
	</head>
	
	<body class="corfundo">
		<%@ page import="java.util.*,projeto1.*"%>
		<div class="center">
			<form action="cria" method="post">
				<h1>NOVA NOTA:</h1>
				<label for=titulo>Título:</label>
				<br>
				<textarea rows="2" cols="60" id="titulo" name="titulo"></textarea>
				<br>
				<label for=texto>Nota:</label>
				<br>
				<textarea rows="6" cols="60" id="texto" name="texto"></textarea>	
				<br><br>
				<input type="submit" value="Submit">
			</form>
		</div>
		<%
			DAO dao = new DAO();
			List<Notas> notas = dao.getLista();
			
			for (Notas nota : notas) {
		%>
		<div class="card">
  			<div class="container row">
    			<h4><b><%= nota.getTitulo() %></b></h4> 
    			<p contenteditable="true"> <%= nota.getTexto() %> </p> 
  			</div>
		</div>
		<% } %>
	</body>
</html>