package com.ipiecoles.java.java320.controller;

import com.ipiecoles.java.java320.model.Commercial;
import com.ipiecoles.java.java320.model.Employe;
import com.ipiecoles.java.java320.model.Manager;
import com.ipiecoles.java.java320.model.Technicien;
import com.ipiecoles.java.java320.repository.EmployeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.persistence.EntityNotFoundException;
import java.util.Map;

@Controller
@RequestMapping("/employes")
public class EmployeController {

    @Autowired
    private EmployeRepository employeRepository;

    /**
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(
            value = "/{id}",
            method = RequestMethod.GET)
    public String findEmploye(@PathVariable(name = "id") Long id, Map<String, Object> model) {
        Employe employe = employeRepository.findOne(id);
        if(employe==null){
            throw new EntityNotFoundException("L'employé d'identifiant " + id + " n'existe pas.");
        }
        model.put("employe", employe);
        return "employes/detail";
    }


    /**
     * Exo 3 - Rechercher un employé par son matricule
     *
     * @param matricule
     * @return
     */
    @RequestMapping(
            value = "",
            params = "matricule",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String findByMatricule(@RequestParam(value = "matricule") String matricule, Map<String, Object> model){
        //Ajouter le contrôle du fait que le Matricule limité à 6 caractères
        model.put("employe", employeRepository.findByMatricule(matricule));
        return "employes/detail";
    }



    /**
     * Exo 4 - Afficher la liste des employés
     *
     * @param page
     * @param size
     * @param sortProperty
     * @param sortDir
     * @return
     * @throws IllegalArgumentException
     */
    @RequestMapping(
            value = "",
            method = RequestMethod.GET,
            produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String findAllEmployes(@RequestParam("page") Integer page,
                                  @RequestParam("size") Integer size,
                                  @RequestParam("sortProperty") String sortProperty,
                                  @RequestParam("sortDirection") String sortDir,
                                  Map<String, Object> model) throws IllegalArgumentException {
        String strError = "Les paramètres sont mal renseignés.";
        if (sortDir == null || !sortDir.equalsIgnoreCase("ASC") && !sortDir.equalsIgnoreCase("DESC")) {
            throw new IllegalArgumentException(strError);
        }
        Pageable pageable = new PageRequest(page, size, Sort.Direction.fromStringOrNull(sortDir), sortProperty);
        if(pageable == null) {
            throw new IllegalArgumentException(strError);
        }
        Page<Employe> employes = employeRepository.findAll(pageable);
        model.put("employes", employes);
        model.put("numOfEmploye", (page * size) + 1);
        model.put("numOfElements", (page + 1) * size);

        model.put("pageAffichage", page + 1);
        model.put("nextPage", page + 1);
        model.put("previousPage", page - 1);
        model.put("size", size);
        model.put("sortProperty", sortProperty);
        model.put("sortDirection", sortDir);

        return "employes/liste";

    }
    /**
     * Exo 5 - Créer un employé
     *
     */
    @RequestMapping(
            value = "/new/{typeEmploye}",
            method = RequestMethod.GET,
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String addEmploye(@PathVariable("typeEmploye") String typeEmploye, Map<String, Object> model){
        //Vérifier existance employeRepository.exists(id)
        //Ajouter le contrôle du fait que le Matricule limité à 6 caractères


        //NOK - A TESTER


        switch (typeEmploye.toLowerCase()){
            case "technicien":
                model.put("employe", new Technicien());
                break;
            case "commercial":
                model.put("employe", new Commercial());
                break;
            case "manager":
                model.put("employe", new Manager());
                break;
        }
        return "employes/detail";
    }



}
