package com.violetks.service;

import com.violetks.dao.QuestionDao;
import com.violetks.entity.Question;

public class QuestionService {

    QuestionDao questionDao = new QuestionDao();

    // 添加编程题
    public boolean addQuestion(Question question) {
        return questionDao.addQuestion(question);
    }

    // 获取最后一次添加的题信息
    public int getLastQid() {
        return questionDao.getLastQid();
    }

    // 删除某道题
    public boolean deleteQuestion(int qid) {
        return questionDao.deleteQuestion(qid);
    }
}
