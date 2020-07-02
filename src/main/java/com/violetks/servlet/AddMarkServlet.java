package com.violetks.servlet;

import com.violetks.entity.Mark;
import com.violetks.entity.Teacher;
import com.violetks.service.MarkService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 添加评分记录
 */
@WebServlet("/AddMarkServlet")
public class AddMarkServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        Mark mark = new Mark();
        Teacher teacher = (Teacher) request.getSession().getAttribute("teacher");
        int tid = teacher.getTid();
        request.getSession().setAttribute("tid", tid);

        int qid = Integer.parseInt(request.getParameter("qid"));
        int sid = Integer.parseInt(request.getParameter("sid"));
        int tScore = Integer.parseInt(request.getParameter("tScore"));
        int sScore = Integer.parseInt(request.getParameter("sScore"));

        // 添加评分记录
        MarkService markService = new MarkService();
        int result = 0;   // 未解决
        if (sScore != 0) {
            result = 1;   // 已解决
        }

        mark.setTid(tid);
        mark.setSid(sid);
        mark.setQid(qid);
        mark.settScore(tScore);
        mark.setsScore(sScore);
        mark.settResult(result);

        // 查询评分记录
        Mark m = markService.getMark(sid, qid);
        if (m == null) {
            if (markService.addMarkRecord(mark)) {
                request.setAttribute("msg", "评分成功！");
                request.getRequestDispatcher("/teacher/studentTest.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("m", m);
            request.getRequestDispatcher("/teacher/studentTest.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
