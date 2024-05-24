<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="example.EtablireConnection" %>
      <%@ page import="java.sql.*" %>
      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/recherche.css">

</head>
<body>

	
	<div class="container"> 
	<h1 class="header">Recherche</h1>
		<div class="content">	
		    <form action="Recherche.jsp" method="post">
		    
		        <label for="ville">Ville :</label><br>
		        <input type="text" id="ville" name="ville" placeholder="Entrer une ville..." required>
		        <button type="submit">Recherche</button>
		    </form>
    
	    <!-- ---------------------------------- -->
	    <hr>
	    <h2>Résultats de la recherche</h2>
	    <table  width="100%">
	    	<tr>    				
	    				<th>ID</th>
	    				<th>Nom</th>
	    				<th>E-mail</th>
	    				<th>Ville</th>
	    				<th>Action</th>
	    	</tr>
	        <% 
	    		String villeRecherchee = request.getParameter("ville");
	        
	        	EtablireConnection etablireConnection = new EtablireConnection(); 
	        	Connection conn=etablireConnection.getConnection();
	        
	        	PreparedStatement ps = conn.prepareStatement("SELECT * FROM utilisateur WHERE ville = ?");
	        	ps.setString(1, villeRecherchee);
	        	ResultSet rs = ps.executeQuery();
	        
	            while(rs.next()){
	            %>
	            	<tr>    				
	    				<td><%=rs.getInt(1) %></td>
	    				<td><%=rs.getString(2) %></td>
	    				<td><%=rs.getString(3) %></td>
	    				<td><%=rs.getString(4) %></td>
	    				<td>
	    		    				    
						<a href="ModifierPersonne.jsp?id=<%=rs.getInt(1)%>&nom=<%=rs.getString(2)%>&email=<%=rs.getString(3)%>&ville=<%=rs.getString(4)%>" class="modifier">Modifier</a>
	    		    				    
	    					<a href="Delete?id=<%=rs.getInt(1) %>" class="supprimer">Supprimer</a>
	    				</td>
	    			
	    			</tr>
	           <% 
	           		}
	           %>
	           
	    </table>
	    
	    <%
	    if (request.getAttribute("supp") != null) {
	        // Récupérez la valeur de l'attribut "eng"
	        int supp = (Integer) request.getAttribute("supp");
	
	        if (supp == 1) {
	%>
	            <p class="supp">Etudiant a ete supprimer par succés.</p>
		<%
	        } else {
		%>
	            <p style="color: red;">Erreur Etd n'est pas supprimer .</p>
		<%
	        }
	    }
		%>
	    
	    
	    <a href="Ajoute.jsp" class="ajoutbtn">Ajoute</a>

		</div>
	</div>	
</body>
</html>