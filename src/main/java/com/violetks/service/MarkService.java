package com.violetks.service;

import com.violetks.dao.MarkDao;
import com.violetks.entity.Mark;

public class MarkService {
    MarkDao markDao = new MarkDao();

    // 添加评分记录
    public boolean addMarkRecord(Mark mark) {
        return markDao.addMarkRecord(mark);
    }

    // 查询评分记录
    public Mark getMark(int sid, int qid) {
        return markDao.getMark(sid, qid);
    }
}
