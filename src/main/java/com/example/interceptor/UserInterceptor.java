package com.example.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object user = request.getSession().getAttribute("user");
        if(user == null){
            request.setAttribute("errorMsg","登录已失效，请重新登录");
            request.getRequestDispatcher("/jsp/user/home.jsp").forward(request,response);
            return false;
        }
        return true;
    }

}
