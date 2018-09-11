package projeto1;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
//import javax.servlet.http.HttpServletRequest;

@WebServlet("/cria")
public class Cria extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException {
		
		DAO dao = new DAO();
		Notas nota = new Notas();
		nota.setTitulo(request.getParameter("titulo"));
		nota.setTexto(request.getParameter("texto"));
		dao.adiciona(nota);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		dao.close();
		
	}
	
}
