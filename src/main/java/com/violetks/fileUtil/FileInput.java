package com.violetks.fileUtil;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;

/**
 * 将教师答案保存到文件
 */
public class FileInput {
    final String inputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//answer/";

    public FileInput() { }

    public boolean createDir(int qid) {
        File file = new File(inputPath + qid);
        if (!file.exists()) {
            return file.mkdir();
        } else {
            return true;
        }
    }

    public boolean createFile(int qid, String fid, String[][] str) {
        try {
            File file = new File(inputPath + qid + "/" + fid + ".txt");
            if (file.exists()) {
                file.delete();
            }

            FileWriter fw = new FileWriter(file, true);
            BufferedWriter bw = new BufferedWriter(fw);

            for (int i = 0; i < str.length; ++i) {
                for (int j = 0; j < str[i].length; ++j) {
                    bw.write(str[i][j] + " ");
                }
                bw.write("\r\n");
            }

            bw.close();
            fw.close();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
