<body>
<%@ page import="java.util.*,handout_a6.*" %>
<table border='1'>
<% DAO dao = new DAO();
 List<Pessoas> pessoas = dao.getLista();
 for (Pessoas pessoa : pessoas ) { %>
 <tr>
 <td>ID</td>
 <td>Nome</td>
 <td>Nascimento</td>
 <td>Altura</td>
 </tr>
 <tr>
 <td><%=pessoa.getNome()%></td>
 <td><%=pessoa.getNascimento().getTime()%></td>
 <td><%=pessoa.getAltura()%></td>
 </tr>
<% } %>
</table>