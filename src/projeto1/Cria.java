package projeto1;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/cria")
public class Cria extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		Notas nota = new Notas();
		Cores cor = new Cores();
		nota.setTitulo(request.getParameter("titulo"));
		nota.setTexto(request.getParameter("texto"));
		cor.setCores(request.getParameter("cores"));
		nota.setId_cor(request.getParameter("id_cor"));
		dao.adiciona(nota);
		dao.close();
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	
}
