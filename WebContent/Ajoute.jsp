<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page import="servlet.Ajoute" %>
<html>
<head>
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/ajoute.css">


</head>
<body>
		<h1 class="header">Ajoute</h1>

		<form method="post" action="Ajoute">
		<table border="1">
			<tr>
				<td>Id : </td>
				<td> <input type="number" name="id" required> </td>
			</tr>
			<tr>
				<td>Nom : </td>
				<td> <input type="text" name="nom" required> </td>
			</tr>
			<tr>
				<td>E-mail : </td>
				<td> <input type="text" name="email" required> </td>
			</tr>
			<tr>
				<td>Ville : </td>
				<td> <input type="text" name="ville" required> </td>
			</tr>
			<tr>
				<td colspan="2"> 
					<input type="submit" value="Ajout" class="btn">
					<input type="reset" value="Reset">
				</td>
			</tr>
		</table>
	</form>
	
	<%
    if (request.getAttribute("eng") != null) {
        // Récupérez la valeur de l'attribut "eng"
        int engirestre = (Integer) request.getAttribute("eng");

        if (engirestre == 1) {
%>
            <p style="color: green;">Ajouté avec succès.</p>
<%
        } else {
%>
            <p style="color: red;">Erreur Etd n'est pas ajouté avec succès.</p>
<%
        }
    }
%>

  


</body>
</html>