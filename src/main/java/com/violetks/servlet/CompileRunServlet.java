package com.violetks.servlet;

import com.violetks.complierun.JavaCompileRun;
import com.violetks.entity.Question;
import com.violetks.entity.Record;
import com.violetks.entity.Student;
import com.violetks.fileUtil.CodeInput;
import com.violetks.service.RecordService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 编译运行
 */
@WebServlet("/CompileRunServlet")
public class CompileRunServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        final String inputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//answer/";
        final String outputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//output/";

        CodeInput codeInput = new CodeInput();
        Record record = new Record();
        Student student = (Student) request.getSession().getAttribute("student");
        Question question = (Question) request.getSession().getAttribute("question");
        int qid = question.getQid();
        request.getSession().setAttribute("qid", qid);
        String codeStr = request.getParameter("codeStr");  // codeStr是textarea的name
//        if (codeStr == null) {
//            response.sendRedirect("programQItem.jsp");
            // 代码为空，转发到programQItem.jsp
//            request.setAttribute("msg", "请输入源代码！");
//            request.getRequestDispatcher("/student/programQItem.jsp").forward(request, response);

//            response.setHeader("refresh", "0.01;url=" + request.getContextPath() + "/student/programQItem.jsp");
//        } else {
            JavaCompileRun jCR = new JavaCompileRun(codeStr);
            try {
                jCR.codeCompile(codeStr, qid, student.getSid());  // 调用代码编译方法
            } catch (Exception e) {
                jCR.setExceptionString("编译时异常");
            }
            if (!jCR.isCompileResult() || !jCR.isRunResult()) {
                request.getSession().setAttribute("jcr", jCR);
            } else {
                // 和答案文件进行比较，如果5个答案，比对成功一次得20分;如果只一个答案可对比，成功满分100
                // 检测答案文件夹中的文件个数，确定比较次数
                File f1 = new File(inputPath + qid);
                File[] fs = f1.listFiles();
                int score = 0;
                // 对于有输入样例的题目
                if (fs != null && fs.length > 5) {//答案和输入文件个数
                    for (int j = 1; j < 6; j++) {
                        String file1 = outputPath + student.getSid() + "/" + qid + "0" + j + ".txt";
                        String file2 = inputPath + qid + "/answer" + qid + "0" + j + ".txt";
                        // 添加学生答案到练习记录
                        // 读取文件内容，file1是文件路径
                        BufferedReader br = null;
                        String temp = null;
                        br = new BufferedReader(new FileReader(new File(file1)));
                        List<String> arr = new ArrayList(20);
                        while ((temp = br.readLine()) != null) {
                            arr.add(temp);
                        }
                        record.setsAnswer(arr.toString());

                        if (jCR.fileCompare(file1, file2)) {
                            score += 20;
                            jCR.setScore(score);
                            record.setsRate(score);  // 添加通过率到练习记录
                        }
                    }
                } else {
                    // 对于没有输入样例的题目
                    String file1 = outputPath + student.getSid() + "/" + qid + "01.txt";
                    String file2 = inputPath + qid + "/answer" + qid + "01.txt";
                    // 添加学生答案到练习记录
                    // 读取文件内容，file1是文件路径
                    BufferedReader br = null;
                    String temp = null;
                    br = new BufferedReader(new FileReader(new File(file1)));
                    List<String> arr = new ArrayList(20);
                    while ((temp = br.readLine()) != null) {
                        arr.add(temp);
                    }
                    record.setsAnswer(arr.toString());

                    if (jCR.fileCompare(file1, file2)) {
                        score += 100;
                        jCR.setScore(score);
                        record.setsRate(score);  // 添加通过率到练习记录
                    }
                }
                request.getSession().setAttribute("jCR", jCR);
                request.getRequestDispatcher("/student/compileRun.jsp").forward(request, response);

                // 添加练习记录
                RecordService recordService = new RecordService();
                int result = 0;   // 未解决
                if (jCR.isCompileResult() && jCR.isRunResult() && jCR.getScore() == 100) {
                    result = 1;   // 已解决
                }

                record.setsResult(result);
                record.setQid(qid);
                record.setSid(student.getSid());
                recordService.addExciseRecord(record);

                // 保存提交代码到文件夹
                codeInput.createDir(student.getSid());
                codeInput.createFile(student.getSid(),qid,codeStr);
            }
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
