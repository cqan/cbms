package com.cqan.controller;

import com.cqan.service.BaseService;
import com.cqan.service.UserService;
import com.cqan.system.User;
import com.cqan.util.ReflectionUtils;
import com.cqan.util.Servlets;
import com.google.common.collect.Maps;

import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

import java.io.Serializable;
import java.util.Map;

/**
 * Created by huiwu on 2014/10/19.
 */
public abstract class BaseController<Entity,PK extends Serializable,EntityService extends BaseService<Entity, PK>> {

    private Class<Entity> entityClass;

    protected static final String PAGESIZE = "10";

    protected Map<String, String> sortFields = Maps.newLinkedHashMap();

    protected EntityService entityService;
    
    @Autowired
    private UserService userService;

    public BaseController(){
        this.entityClass = ReflectionUtils.getSuperClassGenricType(getClass());
    }

    @RequestMapping("/index.html")
    public String page(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,String sortField,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber,@RequestParam
            (value = "pageSize", defaultValue = PAGESIZE) int pageSize, Model model,HttpServletRequest request){
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");
        Page<Entity> page = entityService.search(searchParams, pageNumber, pageSize, sortType, sortField);
        model.addAttribute("page", page);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortField", sortField);
        model.addAttribute("sortFields", sortFields);
        String msg = (String) request.getAttribute("msg");
        if (StringUtils.isNotBlank(msg)) {
        	model.addAttribute("msg", msg);
		}
        return getView()+"/index";
    }

    @RequestMapping("/edit.html")
     public String edit(PK id,Model model){
        if (id!=null){
            Object entity  = entityService.get(id);
            model.addAttribute("entity",entity);
        }
        return getView()+"/edit";
    }

    private String getView(){
        return entityClass.getSimpleName().substring(0,1).toLowerCase()+entityClass.getSimpleName().substring(1);
    }
    
    
    protected String getCurrentUserName() {
		return (String) SecurityUtils.getSubject().getPrincipal();
	}
    
    protected User getCurrentUser(){
    	
    	return userService.findByUserName(getCurrentUserName());
    }

    public abstract void setEntityService(EntityService entityService);

}
