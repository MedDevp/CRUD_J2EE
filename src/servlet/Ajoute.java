package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.EtablireConnection;

import java.sql.*;

@WebServlet("/Ajoute")
public class Ajoute extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String idStr = request.getParameter("id");
		String nom = request.getParameter("nom");
		String email = request.getParameter("email");
		String ville = request.getParameter("ville");
		
        int id = Integer.parseInt(idStr);
		try {
			EtablireConnection etablireConnection = new EtablireConnection(); 
	    	Connection conn=etablireConnection.getConnection(); 
	    	
	    	PreparedStatement ps;
			ps = conn.prepareStatement("INSERT INTO utilisateur(id,nom,email,ville) VALUES (?,?,?,?)");
			ps.setInt(1, id);
			ps.setString(2, nom);
			ps.setString(3, email);
			ps.setString(4, ville);
			int engirestre = ps.executeUpdate();
			request.setAttribute("eng", engirestre);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Ajoute.jsp");
	        dispatcher.forward(request, response);


		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
	}

}
