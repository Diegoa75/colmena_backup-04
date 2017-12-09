package ar.edu.unlam.tallerweb1.controladores;

import java.util.ArrayList;
import java.util.Collection;

import javax.inject.Inject;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;



import ar.edu.unlam.tallerweb1.modelo.Curso;
import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.Alumno.ServicioAlumno;
import ar.edu.unlam.tallerweb1.servicios.Curso.ServicioCurso;
import ar.edu.unlam.tallerweb1.servicios.Usuario.ServicioUsuario;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

@Controller
public class AlumnoControler {
	
	@Inject
	private ServicioCurso Cursos;
	@Inject
	private ServicioAlumno Alumnos;
	
	@RequestMapping("/ingresarAlumno")
	public ModelAndView ingresarAlumno()
	{
		ModelMap modelo = new ModelMap();
		Usuario alumno = new Usuario();
		modelo.put("Alumno", alumno);
		ArrayList<Curso>materias = new ArrayList<Curso>();
		materias = Cursos.cursosParaAnotarse();
		modelo.put("Chorizo", materias);	
		return new ModelAndView("formularioIngresaAlumno", modelo);
	}
		
	@Inject
    private SessionFactory sessionFactory;
 	@RequestMapping(value="/guardarAlumno", method = RequestMethod.POST)
 public ModelAndView guardarAlumno(@RequestParam("idCurso")long[] idCurso, @ModelAttribute ("alumno") Usuario alumno)
 {
 		
 		Collection<Curso>cursos = new ArrayList<Curso>();
		Curso materia = new Curso();
		
	    for(int i=0;i<idCurso.length;i++) 
	    {
	        materia = Cursos.GetCurso(idCurso[i]);
	        System.out.println(materia.getId());
	        int canti= materia.getCantidadAlumnos();
	        materia.setCantidadAlumnos(++canti);
	        Cursos.agregar(materia);
	        cursos.add(materia);
	           	        
	      }
	  
	    alumno.setRol("alumno");
 		alumno.setCursos(cursos);
 		Alumnos.anotarAlumno(alumno);
 		/*
 		//Session session = sessionFactory.openSession();
 		final Session session = sessionFactory.getCurrentSession();
 	    session.beginTransaction();
 	    boolean result = (Long)session.save(alumno)!=0;
 	    
 	    session.getTransaction().commit();
 	    session.close();*/
 		return new ModelAndView("redirect:/login");
	}
 	
}
