package projeto1;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/atualizaCores")
public class AtualizaCores extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	int id_cor;
	
	@Override
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String id_cor = request.getParameter("id_cor");
		System.out.println(id_cor);
	}
	
	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		DAO dao = new DAO();
		Cores cor = new Cores();
		System.out.println("SSSSSSSSSSSSSSSSSSSSSSSSS"+request.getParameter("cores"));
		cor.setCores(request.getParameter("cores"));
		cor.setId_cor(id_cor);
		dao.alteraCores(cor);
		request.getRequestDispatcher("index.jsp").forward(request, response);
		dao.close();
	}
}