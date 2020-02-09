package com.violetks.dao;

import com.violetks.entity.Student;

import java.util.Date;
import java.util.List;

public interface BaseDao {
    // 获取学生信息
    Student getStudent(int sid,String password);
    // 获取每类试题 总数
    int getCount(int category);
    // 获取每类试题 已解决数量
    int getResolvedCount(int sid, int category, int result);
    // 获取每类试题 更新时间
    Date getLastTime(int category);
    // 获取试题总数
    int getLastQid();
    // 获取每类试题 试题列表
    List getQuestions(int category);
}
