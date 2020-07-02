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
        // 先创建answer文件夹
        File ans = new File(inputPath);
        if (!ans.exists()) {
            ans.mkdir();
        }
        // 在answer文件夹下创建每题文件夹，以题号命名
        File file = new File(inputPath + qid);
        if (!file.exists()) {
            file.mkdir();
        }
        return true;
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
