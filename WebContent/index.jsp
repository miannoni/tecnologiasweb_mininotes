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
		<div class="center">
			<form action="/action_page.php">		
				<h1>NOVA NOTA:</h1>
				<textarea rows="6" cols="60" id="caixa_notas"></textarea>
				<br>
				<p>Cor:</p>
				<select>
					<option value="vermelho">Vermelho</option>
					<option value="azul">Azul</option>
					<option value="rosa">Rosa</option>
					<option value="amarelo">Amarelo</option>
					<option value="verde">Verde</option>
				</select>
	
				<br><br>
				<input type="submit" value="Submit">
			</form>
		</div>
	</body>
</html>