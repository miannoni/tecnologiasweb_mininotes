<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>MiniNotes</title>
		<link rel='stylesheet' type='text/css' href='estilo.css'>
	</head>
	<div class="header center navcolor"><h1>MiniNotes</h1></div>
	
	<body class="corfundo">
		<%@ page import="java.util.*,projeto1.*"%>
		<div class="center">
			<form action="cria" method="post">
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
		<div class="card" >
  			<div class="container">
    			<h4 id="titulo"><b><%= nota.getTitulo() %></b></h4> 
    			<p id="texto" contenteditable="true"> <%= nota.getTexto() %> </p> 
  			</div>
  			<div class="card-action">
  				<form action="atualiza">
  					<input type="text" name="id" value="<%= nota.getId() %>" style="display: none">
  					<input type="submit" value="Editar">
  				</form>
  				<form action="remove">
  					<input type="text" name="id" value="<%= nota.getId() %>" style="display: none">
  					<input type="submit" value="Descartar">
  				</form>
  				
			</div>
		</div>
		<% } %>
	</body>
</html>