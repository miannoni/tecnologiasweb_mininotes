package projeto1;

import java.io.*;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
//import javax.servlet.http.HttpServletRequest;

@WebServlet("/cria")
public class Cria extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest request,
	HttpServletResponse response)
	throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<form method='post'>");
		out.println("Titulo: <input type='text' name='titulo'><br>");
		out.println("Texto: <input type='text' name='texto'><br>");
		out.println("<input type='submit' value='Submit'>");
		out.println("</form>");
		out.println("<body><html>");
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
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("adicionado" + nota.getTitulo());
		out.println("adicionado" + nota.getTexto());
		out.println("</body></html>");
		dao.close();
	}
}
