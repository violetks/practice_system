package com.violetks.service;

import com.violetks.dao.TeacherDao;
import com.violetks.entity.Teacher;

public class TeacherService {

    TeacherDao teacherDao = new TeacherDao();

    // 登录 - 获取教师信息
    public Teacher getTeacher(Teacher teacher) {
        return teacherDao.getTeacher(teacher);
    }

    // 注册 - 添加教师
    public boolean addTeacher(Teacher teacher) {
        return teacherDao.addTeacher(teacher);
    }

    // 注册 - 判断手机号是否重复
    public Teacher getTeacherByPhone(Teacher teacher) {
        return teacherDao.getTeacherByPhone(teacher);
    }
}
