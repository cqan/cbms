package com.cqan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cqan.school.School;
import com.cqan.service.SchoolService;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/school")
public class SchoolController extends BaseController<School,Long,SchoolService>{

    @Override
    @Autowired
    public void setEntityService(SchoolService schoolService) {
        this.entityService = schoolService;
    }

}
