package com.violetks.fileUtil;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/**
 * 读取文件内容
 */
public class FileOutput {
    final String inputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//answer/";
    final String outputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//output/";

    public FileOutput() { }

    // 读取教师答案
    public String readFile(String qid, String fix, int index) {
        String str = "无";
        String s = "";

        try {
            FileReader file = new FileReader(inputPath + qid + "/" + fix + qid + "0" + index + ".txt");

            for(BufferedReader br = new BufferedReader(file); (str = br.readLine()) != null; s = s + str + "\n") {
            }

            return s;
        } catch (FileNotFoundException e) {
            str = "无";
        } catch (IOException e) {
            str = "无内容";
        }

        return str;
    }

    // 读取学生运行结果
    public String readFile(String sid, String qid) {
        String str = "无";
        String s = "";

        try {
            FileReader file = new FileReader(outputPath + sid + "/" + "src" + qid + ".txt");

            for(BufferedReader br = new BufferedReader(file); (str = br.readLine()) != null; s = s + str + "\n") {
            }

            return s;
        } catch (FileNotFoundException e) {
            str = "无";
        } catch (IOException e) {
            str = "无内容";
        }

        return str;
    }
}
