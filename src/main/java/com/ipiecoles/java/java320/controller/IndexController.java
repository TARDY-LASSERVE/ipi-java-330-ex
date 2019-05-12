package com.ipiecoles.java.java320.controller;

import com.ipiecoles.java.java320.repository.EmployeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Map;

@Controller
public class IndexController {

    @Autowired
    private EmployeRepository employeRepository;

    /**
     * Exo 1 - Compter le nombre d'employés
     *
     * @param model
     * @return
     */
    @RequestMapping(
            value = "",
            method = RequestMethod.GET
    )
    public String index(Map<String, Object> model) {
        model.put("nbEmployes", employeRepository.count());
        return "index";
    }


}
