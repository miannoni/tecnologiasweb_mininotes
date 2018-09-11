package projeto1;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/atualiza")
public class Atualiza extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int id_nota;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<form method='post'>");
		out.println("Titulo: <input type='text' name='titulo'><br>");
		out.println("Texto: <input type='text' name='texto'><br>");
		out.println("<input type='submit' value='Submit'>");
		out.println("</form>");
		out.println("<body><html>");
		id_nota = Integer.valueOf(request.getParameter("id"));
	}
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		Notas nota = new Notas();
		nota.setTitulo(request.getParameter("titulo"));
		nota.setTexto(request.getParameter("texto"));
		nota.setId(id_nota);
		dao.altera(nota);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		dao.close();
	}
}