package projeto1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
	private Connection connection = null;
	public DAO() {
		 try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 try {
			connection = DriverManager.getConnection(
			"jdbc:mysql://localhost/teste", "root", "Gbp_1806");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public List<Notas> getLista() {
			List<Notas> notas = new ArrayList<Notas>();
			PreparedStatement stmt;
			try {
				stmt = connection.
					prepareStatement("SELECT * FROM Notas");
				ResultSet rs = stmt.executeQuery();
				
				while (rs.next()) {
					Notas nota = new Notas();
					nota.setId(rs.getInt("id"));
					nota.setTitulo(rs.getString("titulo"));
					nota.setTexto(rs.getString("texto"));
					nota.setId_cor(rs.getString("id_cor"));
					notas.add(nota);
				}
				
				rs.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return notas;
		}
	
	public List<Cores> getListaCores() {
		List<Cores> cores = new ArrayList<Cores>();
		PreparedStatement stmt;
		try {
			stmt = connection.
				prepareStatement("SELECT * FROM Cores");
			ResultSet rs = stmt.executeQuery();
			
			while (rs.next()) {
				Cores cor = new Cores();
				cor.setId_cor(rs.getInt("id_cor"));
				cor.setCores(rs.getString("cores"));
				cores.add(cor);
			}
			
			rs.close();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cores;
	}
	
	public void adiciona(Notas nota) {
		String sql = "INSERT INTO Notas" +
		"(titulo,texto,id_cor) values(?,?,?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1,nota.getTitulo());
			stmt.setString(2,nota.getTexto());
			stmt.setString(3,nota.getId_cor());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void adicionaCores(Cores cor) {
		String sql = "INSERT INTO Cores" +
		"(cores) values(?)";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1,cor.getCores());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void coloreNota(Notas nota) {
		String sql = "UPDATE Notas SET " +
				 "id_cor=? WHERE id=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, nota.getId_cor());
			stmt.setInt(2,nota.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void altera(Notas nota) {
		String sql = "UPDATE Notas SET " +
		 "titulo=?, texto=?, id_cor=? WHERE id=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, nota.getTitulo());
			stmt.setString(2, nota.getTexto());
			stmt.setString(3, nota.getId_cor());
			stmt.setInt(4, nota.getId());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void alteraCores(Cores cor) {
		String sql = "UPDATE Cores SET " +
		 "cores=? WHERE id_cor=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, cor.getCores());
			stmt.setInt(2, cor.getId_cor());
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void remove(Integer id) {
		PreparedStatement stmt;
		try {
			stmt = connection
			 .prepareStatement("DELETE FROM Notas WHERE id=?");
			stmt.setLong(1, id);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void removeCores(Integer id_cor) {
		PreparedStatement stmt;
		try {
			stmt = connection
			 .prepareStatement("DELETE FROM Cores WHERE id_cor=?");
			stmt.setLong(1, id_cor);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void idToColor(String id_cor) {
		String sql = "SELECT cores FROM Cores WHERE id_cor=?";
		try {
			PreparedStatement stmt = connection.prepareStatement(sql);
			stmt.setString(1, id_cor);
			stmt.execute();
			stmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}