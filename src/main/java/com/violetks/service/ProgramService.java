package com.violetks.service;

import com.violetks.dao.ProgramDao;
import com.violetks.entity.Question;

public class ProgramService {

    ProgramDao programDao = new ProgramDao();

    // 添加编程题
    public boolean addQuestion(Question question) {
        return programDao.addQuestion(question);
    }

    // 获取最后一次添加的题信息
    public int getLastQid() {
        return programDao.getLastQid();
    }
}
