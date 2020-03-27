package com.violetks.dao;

import com.violetks.entity.*;

import java.util.Date;
import java.util.List;

public interface BaseDao {
    // 获取学生信息
    Student getStudent(int sid,String password);
    // 添加学生信息
    boolean addStudent(Student student);

    // 获取教师信息
    Teacher getTeacher(String phone,String password);
    // 添加教师信息
    boolean addTeacher(Teacher teacher);

    // 获取每类试题 总数
    int getCount(int category);
    // 获取每类试题 已解决数量
    int getResolvedCount(int sid, int category, int result);
    // 获取每类试题 更新时间
    Date getLastTime(int category);
    // 获取试题总数
    int getLastQid();

    // 获取每类试题 试题列表
    List getQuestionList(int category);
    // 获取每道题完成状态
    int getExResult(int sid, int qid, int result);

    // 获取单个试题 详细内容
    Question getQuestion(int qid);

    // 添加问题
    boolean addQuestion(Question question);
    // 添加选择题
    boolean addChoiceQuestion(Question question);
    // 更新某道题
    boolean updateQuestion(int qid, Question question);

    // 添加练习记录
    boolean addExciseRecord(Record record);
    // 查询练习记录
    List<Record> getExResult(int sid, int result);
    // 排行榜
    List<RankList> getExResult(int top);
}
