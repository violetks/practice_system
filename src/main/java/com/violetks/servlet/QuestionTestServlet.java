package com.violetks.servlet;

import com.violetks.entity.Question;
import com.violetks.entity.Record;
import com.violetks.entity.Student;
import com.violetks.service.RecordService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * 添加学生单选题或填空题练习记录
 */
@WebServlet("/QuestionTestServlet")
public class QuestionTestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Record record = new Record();
        Student student = (Student) request.getSession().getAttribute("student");
        Question question = (Question) request.getSession().getAttribute("question");
        int qid = question.getQid();
        request.getSession().setAttribute("qid", qid);
        String qAnswer = request.getParameter("qAnswer");  // 学生提交答案

        // 添加练习记录
        RecordService recordService = new RecordService();
        int result = 0;   // 未解决
        if (qAnswer!=null) {
            result = 1;   // 已解决
        }

        record.setsResult(result);
        record.setQid(qid);
        record.setSid(student.getSid());
        record.setsAnswer(qAnswer);
//        recordService.addExciseRecord(record);

        if (recordService.addExciseRecord(record)){
            PrintWriter out = response.getWriter();
            out.write("提交成功！请返回~");
            out.flush();
            out.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
