package com.example.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ManagerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("manager");
        if(user == null){
            request.setAttribute("errorMsg","您未登录，请先登录！");
            request.getRequestDispatcher("/jsp/manager/home.jsp").forward(request,response);
            return false;
        }
        return true;
    }
}
