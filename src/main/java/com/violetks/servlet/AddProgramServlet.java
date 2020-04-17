package com.violetks.servlet;

import com.violetks.entity.Question;
import com.violetks.fileUtil.FileInput;
import com.violetks.fileUtil.StrSplit;
import com.violetks.service.ProgramService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 上传编程题
 */
@WebServlet("/AddProgramServlet")
public class AddProgramServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        FileInput fi = new FileInput();
        StrSplit sp = new StrSplit();

        Question question = new Question();
        String qType = request.getParameter("qType");
        String qName = request.getParameter("qName");
        String qKeyword = request.getParameter("qKeyword");
        String qContent = request.getParameter("qContent");
        String qLevel = request.getParameter("qLevel");
        String qInput = request.getParameter("qInput");

        question.setqType(Integer.parseInt(qType));
        question.setqName(qName);
        question.setqKeyword(qKeyword);
        question.setqContent(qContent);
        question.setqLevel(Integer.parseInt(qLevel));

        ProgramService programService = new ProgramService();

        if (programService.addQuestion(question)) {
            request.setAttribute("msg", "试题已写入数据库！");
            request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);

            // 获取到刚添加的这题的题号
            int qid = programService.getLastQid();
            if (qid == 0) {
                request.setAttribute("msg1", "没有获取到题号，测试答案不能生成。");
                request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);
            } else {
                request.setAttribute("msg1", "新建第" + qid + "题");
                request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);

                if (fi.createDir(qid)){
                    request.setAttribute("msg2", "文件夹生成");
                    request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);

                    if (qInput.equals("yes")) {
                        String in[] = request.getParameterValues("in");
                        String answer[] = request.getParameterValues("answer");
                        for (int i = 0; i < in.length; i++) {
                            if (fi.createFile(qid, "input" + qid + "0" + (i + 1), sp.strSplit(in[i]))) {
                                request.setAttribute("msg3", "测试输入文件"+(i+1)+"生成");
                                request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);
                            }
                            if (fi.createFile(qid, "answer" + qid + "0" + (i + 1), sp.strSplit(answer[i]))) {
                                request.setAttribute("msg4", "测试答案文件"+(i+1)+"生成");
                                request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);
                            }
                        }
                    }else {
                        String answer = request.getParameter("a");
                        String example = request.getParameter("e");
                        if (fi.createFile(qid, "answer" + qid + "01", sp.strSplit(answer))) {
                            request.setAttribute("msg3", "测试答案文件生成");
                            request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);
                        }
                        if (fi.createFile(qid, "example" + qid + "01", sp.strSplit(example))) {
                            request.setAttribute("msg4", "测试样例文件生成" );
                            request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);
                        }
                    }
                }else {
                    request.setAttribute("msg2", "文件夹生成失败");
                    request.getRequestDispatcher("/teacher/inputProgram.jsp").forward(request, response);
                }
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
