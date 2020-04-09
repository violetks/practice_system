package com.violetks.service;

import com.violetks.dao.StudentDao;
import com.violetks.entity.Student;

public class StudentService {

    StudentDao studentDao = new StudentDao();

    // 登录 - 获取学生信息
    public Student getStudent(Student student) {
        return studentDao.getStudent(student);
    }

    // 注册 - 添加学生
    public boolean addStudent(Student student) {
        return studentDao.addStudent(student);
    }

    // 注册 - 判断学号是否重复
    public Student getStudentBySid(Student student) {
        return studentDao.getStudentBySid(student);
    }
}
