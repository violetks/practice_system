package com.violetks.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import static com.violetks.smsUtil.PhoneCode.getPhonemsg;

/**
 * 发送短信验证码
 *
 * param: phone手机号
 */
@WebServlet("/SmsServlet")
public class SmsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String phone = request.getParameter("phone");
        String result = getPhonemsg(phone);

        if (result!="true"){
            request.setAttribute("msg", "fail");
        }else {
            // 获取生成的验证码并存到Session
//            String code = ;
//            request.getSession().setAttribute("student", s);
            request.setAttribute("msg", "success");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
