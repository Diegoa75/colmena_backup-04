<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
	<!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet" >
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    
	   
	    
	<!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet" >
	    <!-- Bootstrap theme -->
	    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
	    <link href="css/estilos.css" rel="stylesheet">
	    
	    
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	    <link href="js/bootstrap.min.js" rel="stylesheet" >
	    <link href="js/jquery-1.11.3.min.js" rel="stylesheet" >
	    
	      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  			<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  			
  			
  			<!-- Bootstrap core CSS -->
	    <link href="css/bootstrap.min.css" rel="stylesheet" >
	    <!-- Bootstrap theme -->
	    <link href="css/bootstrap-theme.min.css" rel="stylesheet">
	    <link href="css/estilos.css" rel="stylesheet">
	    
	     <style>
    h6 { color: grey; }
    h4 { color: white; }
    h2 {color: white; }
    h3 {color: black; }
    h1 { color: grey; }
  		</style>
  		
	</head>
<body>

<header class="panel-primary">
<div class="container-fluid panel-heading">
  <h1><center><img src="C:\java\proyectos\proyecto-limpio-spring\src\main\webapp\WEB-INF\vistas\Logo.jpg"/></center></h1>
   <div class="col-md-11"> <center><h2>Cargue el Ex�men Profesor ${usuario.nombre} ${usuario.apellido}</h2></center></div>  <div class="col-md-1"><a href="/proyecto-limpio-spring/exit"  class="btn btn-info btn-lg active" role="button">Salir</a></div>
</div>
</header>

<br>
<br>


<form:form method="GET" modelAttribute="examen"> 

	<center><h1><span class="label label-info">Preguntas Cargadas del Examen: ${examen.nombre} </span></h1></center>
					
			<c:forEach items= "${examen.preguntas}" var="pregunta">
			<div class="alert alert-primary">	
  				<form:label  class ="btn btn-primary btn-lg btn-block" path="nombre" id="id" onClick="window.location.href='/proyecto-limpio-spring/guardarRespuestaDocente/${examen.id}/${pregunta.id}'">${pregunta.nombre} </form:label>
  				<center><h3><span class="label label-info">Respuestas: </span></h3></center> 
				 <c:forEach  items="${pregunta.respuestas}" var="respuestas"> 				    
			     	 <label class="list-group-item list-group-item-action list-group-item-primary">${respuestas.nombre}
			     	 <c:if test="${respuestas.correcta}" >
			     	 <label class="alert alert-danger">Respuesta Correcta</label> 
			     	 </c:if>
			     	 
			     	 </label>  		    
			    </c:forEach>
  					
			</div>		       	    
			</c:forEach> 	
	    
</form:form>


<form:form action="guardarPregunta" method="POST" modelAttribute="pregunta"> 
 <div class="form-group">
<center><h1><span class="label label-info">Carga de Preguntas ${examen.nombre} </span></h1></center>

<br>
<br>
 <input type="hidden" name="IdExamen" value="${examen.id}"/>
<br>
<br>
<form:input path="nombre" id="nombre"  class="form-control" placeholder="Ingrese la nueva pregunta"  />
<br>
<br>				
	<center><input type="submit" value="Guardar Nueva Pregunta"/></center>
 </div>	   
</form:form>

<!-- Footer -->	     

	                <div class="footer">
	                    <center><p><h6>Copyright &copy; Proyecto Colmena 2018</h6></p></center>
	                </div>
</body>
</html>