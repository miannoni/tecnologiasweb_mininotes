package projeto1;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/coloreNota")
public class ColoreNota extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		Notas nota = new Notas();
		nota.setId(Integer.valueOf(request.getParameter("id")));
		nota.setId_cor(request.getParameter("id_cor"));
		dao.coloreNota(nota);
		dao.close();
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}