package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import example.EtablireConnection;

@WebServlet("/ModifierPersonne")
public class ModifierPersonne extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        String nom = request.getParameter("nom");
        String email = request.getParameter("email");
        String ville = request.getParameter("ville");

        try {
            EtablireConnection etablireConnection = new EtablireConnection();
            Connection conn = etablireConnection.getConnection();


            PreparedStatement ps = conn.prepareStatement("UPDATE utilisateur SET nom=?, email=?, ville=? WHERE id=?");
            ps.setString(1, nom);
            ps.setString(2, email);
            ps.setString(3, ville);
            ps.setInt(4, id);

            int modif = ps.executeUpdate();
            ps.close();

            request.setAttribute("modif", modif);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("ModifierPersonne.jsp");
	        dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
