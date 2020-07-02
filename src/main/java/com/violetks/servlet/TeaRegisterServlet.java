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
 * 教师注册
 */
@WebServlet("/TeaRegisterServlet")
public class TeaRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Teacher teacher = new Teacher();
        String tName = request.getParameter("tName");
        String dept = request.getParameter("dept");
        String phone = request.getParameter("phone");
        String tpwd = request.getParameter("tpwd");
        String code = request.getParameter("SmsCheck"); // 获取前端页面填写的验证码
        String smsCode = (String) request.getSession().getAttribute("sms_code"); // 获取生成的验证码

        teacher.settName(tName);
        teacher.settDept(dept);
        teacher.settPhone(phone);
        teacher.settPwd(tpwd);

        TeacherService teacherService = new TeacherService();

        try {
            if (!code.equals(smsCode)){
                request.setAttribute("msg", "验证码填写错误！");
                request.getRequestDispatcher("/teaRegister.jsp").forward(request, response);
            }else {
                // 判断手机号是否重复
                Teacher result = teacherService.getTeacherByPhone(teacher);
                if (result != null) {
                    // 手机号重复，转发到注册页
                    request.setAttribute("msg", "手机号已注册！");
                    request.getRequestDispatcher("/teaRegister.jsp").forward(request, response);
                } else {
                    // 添加操作
                    teacherService.addTeacher(teacher);
                    response.getWriter().write("注册成功！3秒后跳转到登录页~");
                    response.setHeader("refresh", "3;url=" + request.getContextPath() + "/teacherLogin.jsp");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
