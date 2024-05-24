package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.EtablireConnection;

import java.lang.Integer;
import java.lang.Integer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			EtablireConnection etablireConnection = new EtablireConnection(); 
	    	Connection conn=etablireConnection.getConnection(); 
	    	
	    	PreparedStatement ps;
			ps = conn.prepareStatement("Delete from utilisateur where id = ?");
			ps.setInt(1,id);
			int supp = ps.executeUpdate();
			request.setAttribute("supp", supp);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Recherche.jsp");
	        dispatcher.forward(request, response);


		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
