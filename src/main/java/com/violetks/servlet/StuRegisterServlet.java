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
 * 学生注册
 */
@WebServlet("/StuRegisterServlet")
public class StuRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Student student = new Student();
        String sid = request.getParameter("sid");
        String sName = request.getParameter("sName");
        String spwd = request.getParameter("spwd");
        String sex = request.getParameter("sex");
        String sGrade = request.getParameter("sGrade");
        String sClass = request.getParameter("sClass");
        String dept = request.getParameter("dept");

        student.setSid(Integer.parseInt(sid));
        student.setsName(sName);
        student.setsPwd(spwd);
        student.setsSex(Integer.parseInt(sex));
        student.setsGrade(sGrade);
        student.setsClass(sClass);
        student.setsDept(dept);

        StudentService studentService = new StudentService();

        try {
            // 判断学号是否重复
            Student result = studentService.getStudentBySid(student);
            if (result != null) {
                // 学号重复，转发到注册页
                request.setAttribute("msg", "学号已注册！");
                request.getRequestDispatcher("/stuRegister.jsp").forward(request, response);
            } else {
                // 添加操作
                studentService.addStudent(student);
                response.getWriter().write("注册成功！3秒后跳转到登录页~");
                response.setHeader("refresh", "3;url=" + request.getContextPath() + "/studentLogin.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
