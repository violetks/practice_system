package com.violetks.servlet;

import com.violetks.entity.Teacher;
import com.violetks.service.TeacherService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 教师登录
 */
@WebServlet("/TeaLoginServlet")
public class TeaLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Teacher teacher = new Teacher();
        String phone = request.getParameter("phone");
        String tpwd = request.getParameter("tpwd");

        teacher.settPhone(phone);
        teacher.settPwd(tpwd);

        TeacherService teacherService = new TeacherService();
        try {
            Teacher t = teacherService.getTeacher(teacher);
            if (t != null) {
                request.getSession().setAttribute("teacher", t);
                request.getRequestDispatcher("/questionInput.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "手机号或密码不正确");
                request.getRequestDispatcher("/teacherLogin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
