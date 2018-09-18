package projeto1;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/criaCores")
public class CriaCores extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		DAO dao = new DAO();
		Cores cor = new Cores();
		cor.setCores(request.getParameter("cores"));
		dao.if_not_cor_cria(cor);
		dao.close();
		request.getRequestDispatcher("index.jsp").forward(request, response);
		
	}
	
}
