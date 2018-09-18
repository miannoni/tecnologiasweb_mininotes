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
//		PrintWriter out = response.getWriter();
//		out.println("<html><body>");
//		out.println("<form method='post'>");
//		out.println("Titulo: <input type='text' name='titulo'><br>");
//		out.println("Texto: <input type='text' name='texto'><br>");
//		out.println("<input type='submit' value='Submit'>");
//		out.println("</form>");
//		out.println("<body><html>");
		DAO dao = new DAO();
		Notas nota = new Notas();
		nota.setId(Integer.valueOf(request.getParameter("id_edit")));
		nota.setTitulo(request.getParameter("titulo"));
		nota.setTexto(request.getParameter("texto"));
		nota.setId_cor(Integer.valueOf(request.getParameter("id_cor")));
		dao.altera(nota);
		dao.close();
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}
}