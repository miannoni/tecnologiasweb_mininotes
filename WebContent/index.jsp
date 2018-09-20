<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>MiniNotes</title>
		<link rel='stylesheet' type='text/css' href='estilo.css'>
		<link rel='stylesheet' type='text/css' href='bootstrap.css'>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<div class="header center navcolor"><h1>MiniNotes</h1></div>
	
	<body class="corfundo">
		<%@ page import="java.util.*,projeto1.*"%>
		<div class="container row">
			
			<div class='col-5'>
				<h3>Cores salvas:</h3>
				<%
				
					String corNota = "1";
					
					R r = new R();
					DAO dao = new DAO();
					List<Cores> cores = dao.getListaCores();
					
					List<String> ListaCores = new ArrayList<>();
					
					for (Cores cor : cores) {
						if (!ListaCores.contains(cor.getCores())){
							ListaCores.add(cor.getCores());
				%>
				<button onclick='corInicial(<%= cor.getId_cor() %>, "<%= cor.getCores() %>")' class="botaocor" style="background-color: <%= cor.getCores() %>"></button>
				
				<% }} %>
				
				<br><br>
				<form action="criaCores" method="post">
					<input type="color" id="inputcolor" name="cores" value="<%= r.rushBsuka() %>" />
					<button type="submit" class="botaoSubmit" style="vertical-align:middle"><span>Adicionar Cor </span></button>
				</form>
				
			</div>
			
			<div class="center">
				<form action="cria" method="get">
					<label for=titulo>Título:</label>
					<br>
					<input type="text" name="id_cor" value= <%= corNota %> id="corNotaComeco" style="display: none">
					<textarea rows="2" cols="60" id="tituloCria" name="titulo"></textarea>
					<br>
					<label for=texto>Nota:</label>
					<br>
					<textarea rows="6" cols="60" id="textoCria" name="texto"></textarea>	
					<br>
					<button type="submit" class="botaoSubmit" style="vertical-align:middle"><span>Criar Nota </span></button>
				</form>
			</div>
		</div>
		
		<br><br>
		
		<%
			List<Notas> notas = dao.getLista();
		
			for (Notas nota : notas) {
				String corFundo = "#ffffff";
				for (Cores cor : cores) {
					if (Integer.valueOf(nota.getId_cor()) == cor.getId_cor()){
						corFundo = cor.getCores();
					}}
				
		%>
		<div id="<%= nota.getId() %>" class="card mr-1 ml-1 mb-2" style="background-color: <%= corFundo %>">


  			<div class="card-action">
  				<form action="atualiza">
  					<input type="text" name="id_edit" id="id_edit" value="<%= nota.getId() %>" style="display: none">
  					<input type="text" name="titulo" id="titulo" value="<%= nota.getTitulo() %>" style="background: transparent; border: none; width: 90%; height: 50%; margin-left: 3%; margin-top: 2%; overflow: scroll; font-weight: bold;"><br>
  					<input type="text" name="texto" id="texto" value="<%= nota.getTexto() %>" style="background: transparent; border: none; width: 90%; padding: 20px 10px; line-height: 28px; box-sizing : border-box; overflow-wrap: break-word; margin-left: 3%;"><br>
  					<input type="text" name="id_cor" id="id_cor" value="<%= nota.getId_cor() %>" style="display: none">

  					<button class="btn" style="float:left;" type="submit" value="Editar"><i class="fa fa-pencil"></i></button>
  				</form>
  				<form action="remove">
  					<input type="text" name="id" value="<%= nota.getId() %>" style="display: none">
  					<button class="btn" style="float: left;" type="submit" value="Descartar"><i class="fa fa-trash"></i></button>
  				</form>
  				
  				<button class="btn" style="float: left;" id="myBtn<%= nota.getId() %>"><i class="fa fa-paint-brush"></i></button>

  				<div id="myModal<%= nota.getId() %>" class="modal">

				 	<!-- Modal content -->
				    <div class="modal-content">
					    <div class="modal-header">
					      <span class="close">&times;</span>
					      <h2>Mudar Cor</h2>
					    </div>
					    <div class="modal-body">
					    	<h1>Escolha uma cor:</h1>
					    	
					    	
							   <% List<String> NovaListaCores = new ArrayList<>();
							      for (Cores cor : cores) { 
								   	if (!NovaListaCores.contains(cor.getCores())){
										NovaListaCores.add(cor.getCores());%>
										
										<div class="botaowrapper">
											<form action="coloreNota" method="get">
												<input type="text" name="id_cor" id="id_cor" value="<%= cor.getId_cor() %>" style="display: none">
												<input type="text" name="id" id="id" value="<%= nota.getId() %>" style="display: none">
												<button type="submit" class="botaocor" style= "background-color: <%= cor.getCores() %>"></button>
											</form>
										</div>		
								<% }}%>
							
							<br><br>
							<form action="coloreNota" method="get">
								<input type="text" name="id_cor" id="id_cor" value="<%= nota.getId_cor() %>" style="display: none">
								<input type="text" name="id" id="id" value="<%= nota.getId() %>" style="display: none">
								<button type="submit" class="botaoSubmit" style="vertical-align:middle"><span>Cancelar </span></button>
							</form>
					    </div>
				    </div>
				</div>
  				
			</div>
		</div> 
		
		<script>
			
			function corInicial(id_cor, cor){
			    document.getElementById("corNotaComeco").setAttribute('value',id_cor);
			    document.getElementById("tituloCria").style.background = cor;
			    document.getElementById("textoCria").style.background = cor;
			}

			// Get the modal
			var modal<%= nota.getId() %> = document.getElementById("myModal<%= nota.getId() %>");
			
			// Get the button that opens the modal
			var btn<%= nota.getId() %> = document.getElementById("myBtn<%= nota.getId() %>");
			
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
			
			
			// When the user clicks the button, open the modal 
			btn<%= nota.getId() %>.onclick = function() {
			    modal<%= nota.getId() %>.style.display = "block";
			};
			
			// When the user clicks on <span> (x), close the modal
			span.onclick=function(){
			    modal<%= nota.getId() %>.style.display = "none";
			};
			
			// When the user clicks anywhere outside of the modal, close it
			window.onclick = function(event) {
			    if (event.target == modal<%= nota.getId() %>) {
			        modal<%= nota.getId() %>.style.display = "none";
			    }
			
			}
		</script>
		<% } %>
		
	</body>
</html>