package com.violetks.service;

import com.violetks.dao.RecordDao;
import com.violetks.entity.Record;

public class RecordService {

    RecordDao recordDao = new RecordDao();

    // 添加练习记录
    public boolean addExciseRecord(Record record) {
        return recordDao.addExciseRecord(record);
    }
}
