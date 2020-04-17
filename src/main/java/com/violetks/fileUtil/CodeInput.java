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
        File file = new File(codePath + sid);
        if (!file.exists()) {
            return file.mkdir();
        } else {
            return true;
        }
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

//            for (int i = 0; i < str.length; ++i) {
//                for (int j = 0; j < str[i].length; ++j) {
//                    bw.write(str[i][j] + " ");
//                }
//                bw.write("\r\n");
//            }

            bw.close();
            fw.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
