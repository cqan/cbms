package com.cqan.controller;

import com.cqan.service.UserService;
import com.cqan.system.User;
import com.cqan.util.Servlets;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * Created by Administrator on 2014/10/19.
 */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController<User,Long,UserService>{

    @Override
    @Autowired
    public void setEntityService(UserService userService) {
        this.entityService = userService;
    }

}
