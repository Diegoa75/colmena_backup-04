<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link href="css/bootstrap.min.css" rel="stylesheet" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>HOLA ${usuario.nombre}</h1><br>

<div><a href="verCursos/{usuario.id}"  class="btn btn-danger btn-sm active" role="button">Ver Cursos</a></div>
<div><a href="rendirExamen"  class="btn btn-danger btn-sm active" role="button">Rendir examen</a></div>
</body>
</html>