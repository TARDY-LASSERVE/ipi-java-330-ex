package com.ipiecoles.java.java320.controller;

import com.ipiecoles.java.java320.model.Manager;
import com.ipiecoles.java.java320.repository.EmployeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
@RequestMapping("/managers")
public class ManagerController {

    @Autowired
    private EmployeRepository employeRepository;

    @RequestMapping(
            value = "",
            method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public String save(Manager employe, Map<String, Object> model) {
        if(employe != null){
            employe = employeRepository.save(employe);
        }
        model.put("employe", employe);
        model.put("success", "Le manager a bien été créé !");
        return "employes/detail";
    }
}
