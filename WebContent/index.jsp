<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>MiniNotes</title>
		<link rel='stylesheet' type='text/css' href='estilo.css'>
		<link rel='stylesheet' type='text/css' href='bootstrap.css'>
	</head>
	<div class="header center navcolor"><h1>MiniNotes</h1></div>
	
	<body class="corfundo">
		<%@ page import="java.util.*,projeto1.*"%>
		<div class="container row">
			
			<div class='col-5'>
				<h3>Cores salvas:</h3>
				<%
					String corNota = "1";
					
					DAO dao = new DAO();
					List<Cores> cores = dao.getListaCores();
					
					for (Cores cor : cores) {
				%>
				<button onclick='corInicial(<%= cor.getId_cor() %>)' class="botaocor" style="background-color: <%= cor.getCores() %>"></button>
				
				<% } %>
				
				<br><br>
				<form action="criaCores" method="post">
					<input type="color" id="inputcolor" name="cores" value="#000000" />
					<input type="submit" value="Adicionar">
				</form>
				
			</div>
			
			<div class="center">
				<form action="cria" method="post">
					<label for=titulo>Título:</label>
					<br>
					<input type="text" name="id_cor" value= <%= corNota %> id="tgref" style="display: none">
					<textarea rows="2" cols="60" id="titulo" name="titulo"></textarea>
					<br>
					<label for=texto>Nota:</label>
					<br>
					<textarea rows="6" cols="60" id="texto" name="texto"></textarea>	
					<br>
					<input type="color" id="id_cor" name="cores" value="#000000" />
					<input type="submit" value="Submit">
				</form>
			</div>
		</div>
		
		<br><br>
		
		<%
			List<Notas> notas = dao.getLista();
			
			String corFundo = "#ffffff";
		
			for (Notas nota : notas) {
				for (Cores cor : cores) {
					if (Integer.valueOf(nota.getId_cor()) == cor.getId_cor()){
						corFundo = cor.getCores();
					}}
				
		%>
		<div id="<%= nota.getId() %>"class="card mr-1 ml-1 mb-2" style="background-color: <%= corFundo %>">

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
  				
  				<button id="myBtn">Mudar Cor</button>
  				<div id="myModal" class="modal">

				 	<!-- Modal content -->
				    <div class="modal-content">
					    <div class="modal-header">
					      <span class="close">&times;</span>
					      <h2>Mudar Cor</h2>
					    </div>
					    <div class="modal-body">
					    	<h1>Escolha uma cor:</h1>
					    	
							   <% for (Cores cor : cores) { %>
								<div class="botaocorwrapper">
									<span class="botaocor botaoCorAcao" id_cor="<%= cor.getId_cor() %>"  id="<%= nota.getId() %>" style= "background-color: <%= cor.getCores() %>" ></span>
								</div>		
								<% }%>
								
							<br><br>
							<form action=" " method="post">
								<input type="button" value="Adicionar">
							</form>
					    </div>
				    </div>
				</div>
  				
			</div>
		</div> 
		<% } %>
		
		<script>
			botoes = document.getElementsByClassName("botaoCorAcao")
			botoes =  [...botoes]
			botoes.forEach((botao) => {
				botao.addEventListener('click', (cb) => {
					elemento = cb.target
					id_cor = cb.target.getAttribute("id_cor")
					id = cb.target.getAttribute("id")
					console.log(id_cor, id)
					url = `coloreNota`
					//fd = new FormData()
					//fd.append("id_cor", id_cor)
					fetch(url + "?id_cor=" + id_cor + "&id=" + id , {
						method: "POST"
					})
				})
			})
			
			
			function corInicial(cor){
			    document.getElementById("tgref").setAttribute('value',cor);
			}

			// Get the modal
			var modal = document.getElementById('myModal');
			
			// Get the button that opens the modal
			var btn = document.getElementById("myBtn");
			
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
			
			// When the user clicks the button, open the modal 
			btn.onclick = function() {
			    modal.style.display = "block";
			}
			
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
			    modal.style.display = "none";
			}
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
			}
		</script>
	</body>
</html>