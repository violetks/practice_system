package com.violetks.fileUtil;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

/**
 * 将学生提交代码保存到文件
 */
public class CodeInput {
    final String codePath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//codeStr/";

    public CodeInput() { }

    public boolean createDir(int sid) {
        // 先创建codeStr文件夹
        File ans = new File(codePath);
        if (!ans.exists()) {
            ans.mkdir();
        }
        // 在codeStr文件夹下创建每题文件夹，以题号命名
        File file = new File(codePath + sid);
        if (!file.exists()) {
            file.mkdir();
        }
        return true;
    }

    public boolean createFile(int sid, int qid, String str) {
        try {
            File file = new File(codePath + sid + "/" + qid + ".txt");
            if (file.exists()) {
                file.delete();
            }

            FileWriter fw = new FileWriter(file, true);
            BufferedWriter bw = new BufferedWriter(fw);
            bw.write(str);
            bw.close();
            fw.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
