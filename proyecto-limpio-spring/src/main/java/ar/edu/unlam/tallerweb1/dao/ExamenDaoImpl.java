package ar.edu.unlam.tallerweb1.dao;
import ar.edu.unlam.tallerweb1.modelo.Examen;
import ar.edu.unlam.tallerweb1.modelo.Respuesta;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import java.util.ArrayList;
import javax.inject.Inject;

@Repository("ExamenDao")
public class ExamenDaoImpl implements ExamenDao {
	
	@Inject
    private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Examen> cargarExamen() {

		@SuppressWarnings("unused")
		ArrayList <Examen> examen = new ArrayList <Examen>();
		final Session session = sessionFactory.getCurrentSession();
		return (ArrayList<Examen>) session.createCriteria(Examen.class)
				.list();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Examen cargarExamen(long Idexamen){
		
		@SuppressWarnings("unused")	
		Examen ex;
		
		final Session session = sessionFactory.getCurrentSession();
		
		ex=  (Examen) session.createCriteria(Examen.class)
				.add (Restrictions.eq("id",Idexamen))
    			.uniqueResult();				
		
		return ex;
		
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public ArrayList<Respuesta> corregirRta(String[] rta){
		
		@SuppressWarnings("unused")	
		//ArrayList<Respuesta> correcta=new ArrayList <Respuesta>();;
		
		final Session session = sessionFactory.getCurrentSession();
		
		return (ArrayList<Respuesta>) session.createCriteria(Respuesta.class)
				.add (Restrictions.eq("nombre",rta))
    			.list();				
			
	}	
}


