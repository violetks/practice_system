package com.violetks.servlet;

import com.violetks.service.QuestionService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 根据 qid 删除试题
 */
@WebServlet("/DelQuestionServlet")
public class DelQuestionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        int qid = Integer.parseInt(request.getParameter("qid"));

        QuestionService questionService = new QuestionService();

        if (!questionService.deleteQuestion(qid)) {
            request.setAttribute("msg", "fail");
        } else {
            request.setAttribute("msg", "success");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
