package tn.enig.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;import org.springframework.web.servlet.mvc.method.annotation.ModelAndViewMethodReturnValueHandler;

import tn.enig.dao.IDepartementDao;
import tn.enig.dao.IEmployeDao;
import tn.enig.dao.IProjetDao;
import tn.enig.model.Departement;
import tn.enig.model.Employe;
import tn.enig.model.Projet;

@Controller
public class AppTest {
	@Autowired
	IDepartementDao daod;
	@Autowired
	IEmployeDao daoe;
	@Autowired
	IProjetDao daop;
	
	public void setDaod(IDepartementDao daod) {
		this.daod = daod;
	}
	public void setDaoe(IEmployeDao daoe) {
		this.daoe = daoe;
	}
	public void setDaop(IProjetDao daop) {
		this.daop = daop;
	}
	
	@GetMapping("/home")
	public String get1 (Model m) {
		List<Departement> liste=daod.findAll();
		System.out.println(liste);
		m.addAttribute("liste", liste);
		return "home" ;
	}
	

	@GetMapping("/ajoutPj")
	public String get2 (Model m) {
		Projet p = new Projet();
		List<Departement> ld=daod.findAll();
		m.addAttribute("p",p);
		m.addAttribute("ld",ld);
		return "ajoutProjet";	
	}
	@PostMapping("/saveProjet")
	public String get3 (Model m, @ModelAttribute("projet") Projet p) {
		daop.save(p);
		return "redirect:/home";
	}
	
	@GetMapping("/ajoutEmp")
	public String get4 (Model m) {
		Employe e = new Employe();
		List<Departement> ld=daod.findAll();
		List<Projet> lp=daop.findAll();
		m.addAttribute("e",e);
		m.addAttribute("ld",ld);
		m.addAttribute("lp",lp);
		return "ajoutEmploye";
	}
	@PostMapping("/saveEmploye")
	public String get5 (Model m, @ModelAttribute("employe") Employe e) {
		daoe.save(e);
		return "redirect:/home";
	}
	
	@GetMapping("/departement/{id}/projet")
	public String get5 (Model m, @PathVariable("id") int id) {
		List<Projet> lp = daop.getAllProjetByDepartement(id);
		Departement departement = daod.findOne(id);
		m.addAttribute("deptName", departement.getNom());
		m.addAttribute("lp",lp);
		return "projetByDepartement";
		
	}
	@GetMapping("/employe/departement/{id}")
	public String get6 (Model m, @PathVariable("id") int id ) {
		List<Employe> lep= daoe.getAllEmployeByDepartement(id);
		Departement departement = daod.findOne(id);
		m.addAttribute("deptName", departement.getNom());
		m.addAttribute("lep",lep);
		return "employeByDepartement";
	}
	@GetMapping("/departement/{id}/employe")
	public String get7 (Model m, @PathVariable("id") int id  ) {
		List<Employe> lep=  daoe.getAllEmployeByProjet(id);
		Projet projet = daop.findOne(id);
		m.addAttribute("projetName", projet.getTitre());
		m.addAttribute("lep", lep);
		return "employeByProjet";
	}


}
