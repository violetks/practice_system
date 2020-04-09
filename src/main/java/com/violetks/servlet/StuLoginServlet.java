package com.violetks.servlet;

import com.violetks.entity.Student;
import com.violetks.service.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 学生登录
 */
@WebServlet("/StuLoginServlet")
public class StuLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Student student = new Student();
        String sid = request.getParameter("sid");
        String spwd = request.getParameter("spwd");

        student.setSid(Integer.parseInt(sid));
        student.setsPwd(spwd);

        StudentService studentService = new StudentService();
        try {
            Student s = studentService.getStudent(student);
            if (s != null) {
                request.getSession().setAttribute("student", s);
                request.getRequestDispatcher("/categorySet.jsp").forward(request, response);
            } else {
                request.setAttribute("msg", "用户名或密码不正确");
                request.getRequestDispatcher("/studentLogin.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
