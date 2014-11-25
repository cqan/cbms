package com.cqan.controller;

import com.cqan.shiro.exception.IncorrectAuthCodeException;
import com.cqan.shiro.realm.AuthCodeFormAuthenticationFilter;
import com.cqan.util.Constant;
import com.cqan.util.DrawUtils;
import com.cqan.util.PngEncoder;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;


@Controller
public class FrameController {

    private final int PIC_WIDTH = 60;
    private final int PIC_HEIGHT = 20;


@RequestMapping(value = "/index.html",method = RequestMethod.GET)
    public String home(){

        return "index";
    }

    @RequestMapping(value = "/login.html", method = RequestMethod.GET)
    public String tologin(HttpServletRequest request) {
        Subject subject = SecurityUtils.getSubject();
        if(subject.isAuthenticated()){
            String path = request.getContextPath();
            int port = request.getServerPort();
            String basePath ="";
            if(port==80){
                basePath = "https://"+request.getServerName()+path+"/";
            }else{
                basePath = "https://"+request.getServerName()+":"+request.getServerPort()+path+"/";
            }
            return "redirect:"+basePath+"index.html";
        }
        return "login";
    }
    @RequestMapping(value = "/login.html", method = RequestMethod.POST)
    public String login(@RequestParam(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM) String userName,HttpServletRequest req, Model model) {
        model.addAttribute(FormAuthenticationFilter.DEFAULT_USERNAME_PARAM, userName);
        Object exception = req.getAttribute(AuthCodeFormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        String error = null;
        if(exception instanceof  UnknownAccountException) {
            error = "*用名不存在";
        } else if(exception instanceof  IncorrectCredentialsException) {
            error = "*用户名/密码错误";
        } else if(exception instanceof  IncorrectCredentialsException) {
            error = "*用户名/密码错误";
        } else if(exception instanceof IncorrectAuthCodeException) {
            error = "*验证码错误";
        } else if(exception instanceof LockedAccountException) {
            error = "*帐号已被锁定";
        } else if(exception != null) {
            error = "*其他错误：" + exception.getClass().getSimpleName();
        }
        model.addAttribute("error", error);
        return "login";
    }

    @RequestMapping(value = "/authcode.html", method = RequestMethod.GET)
    public String authCode(HttpServletRequest request,HttpServletResponse response){
        response.addHeader("pragma", "no-cache");
        response.addHeader("cache-control", "no-cache");
        response.addHeader("cache-control", "private");
        response.addHeader("expires", "0");
        response.setContentType("image/png");
        BufferedImage image = new BufferedImage(PIC_WIDTH, PIC_HEIGHT,BufferedImage.TYPE_INT_RGB);
        Graphics g = image.getGraphics();
        DrawUtils.drawBackground(g, PIC_WIDTH, PIC_HEIGHT);

        char[] rands = DrawUtils.random(4);
        DrawUtils.drawRands(g, rands);
        String code = new String(rands);
        PngEncoder pngEncoder = new PngEncoder(image);
        try {
            ServletOutputStream out = response.getOutputStream();
            out.write(pngEncoder.pngEncode());
            out.close();
            request.getSession().setAttribute(Constant.SESSION_AUTH_CODE,code);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
