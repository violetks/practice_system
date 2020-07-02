package com.violetks.servlet;

import com.violetks.fileUtil.CheckSame;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 对比代码相似度
 */
@WebServlet("/CheckSameServlet")
public class CheckSameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String codeStr1 = request.getParameter("codeStr1");
        String codeStr2 = request.getParameter("codeStr2");

        CheckSame checkSame = new CheckSame();
        double result = checkSame.checkSimiliar(codeStr1, codeStr2);

        PrintWriter out = response.getWriter();
        out.write("相似度："+result);
        out.flush();
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
