package com.violetks.fileUtil;

/**
 * 把多行文本拆分成二维数组
 */
public class StrSplit {
    public String[][] strSplit(String str) {
        String[] s1 = str.split("\\n|\r\n");//把多行拆分
        String a[][] = new String[s1.length][];
        for (int i = 0; i < s1.length; i++) {
            a[i] = s1[i].split("\\s+");
        }
        return a;
    }
}
