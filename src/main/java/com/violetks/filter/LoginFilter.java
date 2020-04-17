package com.violetks.filter;

import com.violetks.entity.Student;
import com.violetks.entity.Teacher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 登录权限过滤器
 */
@WebFilter(filterName = "LoginFilter")
public class LoginFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // 获取请求路径
        String servletPath = request.getServletPath();

        if (servletPath.startsWith("/student")) {
            Student student = (Student) request.getSession().getAttribute("student");
            if (student == null) {
                request.getRequestDispatcher("/studentLogin.jsp").include(request, response);
                return;
            }
        }

        if (servletPath.startsWith("/teacher")) {
            Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
            if (teacher == null) {
                request.getRequestDispatcher("/teacherLogin.jsp").include(request, response);
                return;
            }
        }

        // 传递给下一过滤器
        chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
