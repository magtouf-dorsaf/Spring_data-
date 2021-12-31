package tn.enig.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import tn.enig.model.Employe;

@Repository
public interface IEmployeDao extends JpaRepository<Employe, Integer> {
	
	@Query("select e from Employe e where e.departement.id=?1")
	public List <Employe> getAllEmployeByDepartement(int id);
	
	@Query("select e from Employe e where e.projet.id=?1")
	public List <Employe> getAllEmployeByProjet(int id);
}
