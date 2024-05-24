<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/modifier.css">

	

</head>
<body>
	<h1 class="header">Modifier une personne</h1>
    <form action="ModifierPersonne" method="post">
    	
        <input type="hidden" name="id" value="<%= request.getParameter("id") %>" required>
        <label for="nom">Nom :</label>
        <input type="text" name="nom" value="<%= request.getParameter("nom") %>" required>
        <br>
        <label for="email">E-mail :</label>
        <input type="text" name="email" value="<%= request.getParameter("email") %>" required>
        <br>
        <label for="ville">Ville :</label>
        <input type="text" name="ville" value="<%= request.getParameter("ville") %>" required>
        <br>
        <br>
        <button type="submit">Enregistrer les modifications</button>
    </form>


    <%
	    if (request.getAttribute("modif") != null) {

	        int modif = (Integer) request.getAttribute("modif");
	
	        if (modif == 1) {
	%>
	            <p class="success-message">Etudiant a ete modifier par succés.</p>
		<%
	        } else {
		%>
	            <p class="error">Erreur Etd n'est pas modifier .</p>
		<%
	        }
	    }
		%>

</body>
</html>