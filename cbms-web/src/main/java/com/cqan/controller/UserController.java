package com.cqan.controller;

import com.cqan.service.UserService;
import com.cqan.system.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
