package com.cqan.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.cqan.school.AccountGroup;
import com.cqan.service.GroupService;

import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/group")
public class GrouplController extends BaseController<AccountGroup,Long,GroupService>{

    @Override
    @Autowired
    public void setEntityService(GroupService groupService) {
        this.entityService = groupService;
    }

}
