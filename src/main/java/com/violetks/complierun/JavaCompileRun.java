package com.violetks.complierun;

import java.io.*;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.tools.*;

/**
 * 编译运行代码
 */
public class JavaCompileRun {
    private int score = 0;                 // 试题通过率
    private long runtime = 0L;             // 运行耗时(单位ms)
    private boolean compileResult = false; // 编译结果
    private boolean runResult = false;     // 运行结果
    private String exceptionString = "";   // 异常信息
    private String fullClassName;          // 类的全名称
    // 存放编译过程中输出的信息
    private DiagnosticCollector<JavaFileObject> diagnosticsCollector = new DiagnosticCollector<>();
    // 试题答案文件夹
    final String inputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//answer/";
    // 学生运行结果文件夹
    final String outputPath = "C://Users//Xionglin//IdeaProjects//practice_system//src//main//resources//output/";

    public JavaCompileRun(String sourceCode) {
        this.fullClassName = getClassName(sourceCode);
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public long getRuntime() {
        return runtime;
    }

    public void setRuntime(long runtime) {
        this.runtime = runtime;
    }

    public boolean isCompileResult() {
        return compileResult;
    }

    public void setCompileResult(boolean compileResult) {
        this.compileResult = compileResult;
    }

    public boolean isRunResult() {
        return runResult;
    }

    public void setRunResult(boolean runResult) {
        this.runResult = runResult;
    }

    public String getExceptionString() {
        return exceptionString;
    }

    public void setExceptionString(String exceptionString) {
        this.exceptionString = exceptionString;
    }

    /**
     * 将运行结果文件和已有答案文件比较
     * 参数是文件路径
     *
     * @return true/false
     */
    public boolean fileCompare(String file1, String file2) {
        BufferedReader br1 = null;
        BufferedReader br2 = null;
        String temp1 = null;
        String temp2 = null;
        List<String> arr1 = new ArrayList(20);
        List<String> arr2 = new ArrayList(20);

        try {
            br1 = new BufferedReader(new FileReader(new File(file1)));
            br2 = new BufferedReader(new FileReader(new File(file2)));

            // 循环读取多行，转为数组
            // \\s表示   空格,回车,换行等空白符, + 号表示一个或多个的意思
            while ((temp1 = br1.readLine()) != null) {
                arr1.add(temp1.trim());
            }

            while ((temp2 = br2.readLine()) != null) {
                arr2.add(temp2.trim());
            }

            // 长度不相等
            if (arr1.size() != arr2.size()) {
                return false;
            } else {
                for (int i = 0; i < arr1.size(); ++i) {
                    if (!arr1.get(i).equals(arr2.get(i))) {
                        return false;
                    } else {
                        return true;
                    }
                }
            }

            br1.close();
            br2.close();
            return true;
        } catch (Exception e) {
            this.exceptionString = e.getMessage() + "comparing error";
            return false;
        }
    }

    /**
     * 获取类名
     *
     * @param code 源码
     * @return className 类名称
     */
    public static String getClassName(String code) {
        String className = "";
        Pattern pattern = Pattern.compile("package\\s+\\S+\\s*;");
        Matcher matcher = pattern.matcher(code);
        if (matcher.find()) {
            className = matcher.group().replaceFirst("package", "").replace(";", "").trim() + ".";
        }

        pattern = Pattern.compile("class\\s+\\S+\\s+\\{");
        matcher = pattern.matcher(code);
        if (matcher.find()) {
            className += matcher.group().replaceFirst("class", "").replace("{", "").trim();
        }
        return className;
    }

    /**
     * 代码编译器
     *
     * @param code 源码，qid 题号，sid 学号
     * @return 无
     */
    public void codeCompile(String code, int qid, int sid) {
        PrintStream out = System.out;
        PrintStream error = System.err;

        try {

            long startTime = System.currentTimeMillis();
            System.setErr(error);

            // 获取java的编译器
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            // 标准的内容管理器,更换成自己的实现，覆盖部分方法
            StandardJavaFileManager standardFileManager = compiler.getStandardFileManager(diagnosticsCollector, null, null);
            JavaFileManager fileManager = new ClassFileManager(standardFileManager);
            // 构造源代码对象
            SimpleJavaFileObject fileObject = new JavaSourceFromString(fullClassName, code);
            if (fileObject == null) {
                System.out.println("fileObject null");
            }
            // 获取一个编译任务
            JavaCompiler.CompilationTask task =
                    compiler.getTask(null, fileManager, diagnosticsCollector, null, null, Arrays.asList(fileObject));
            // task.call() 表示编译成功或失败 true:成功 false:失败
            Boolean c = task.call();
            if (c) {
                this.compileResult = true;

                try {
                    ClassLoader classLoader = fileManager.getClassLoader(null);
                    Class<?> mainClass = classLoader.loadClass(fullClassName);
                    if (mainClass != null) {
                        File f1 = new File(inputPath + qid);   // 试题答案文件夹，以每题题号命名
                        File ans = new File(outputPath);   // 先创建output文件夹
                        if (!ans.exists()) {
                            ans.mkdir();
                        }
                        File f2 = new File(outputPath + sid);  // 学生运行结果文件夹，以学号命名
                        if (!f2.exists()) {
                            f2.mkdir();
                        }

                        File[] fs = f1.listFiles();   // 每题的答案文件夹数组
                        // 对于有输入样例的题目
                        if (fs != null && fs.length > 5) {
                            for (int i = 1; i <= 5; i++) {
                                // 对于有输入样例的题目，获取到文件名如：input201.txt的文件
                                File f = new File(inputPath + qid + "/input" + qid + "0" + i + ".txt");
                                FileInputStream in = new FileInputStream(f);
                                System.setIn(in);
                                // 创建文件输出流，文件名如：201.txt
                                FileOutputStream output = new FileOutputStream(outputPath + sid + "/" + qid + "0" + i + ".txt");
                                // 通过 PrintStream 输出到文件
                                System.setOut(new PrintStream(output));
                                Method method = mainClass.getMethod("main", String[].class);
                                method.invoke(null, (Object) new String[0]);   // 调用main方法
                                output.close();
                            }
                        } else {
                            // 对于没有输入样例的题目
                            FileOutputStream output = new FileOutputStream(outputPath + sid + "/" + qid + "01.txt");
                            System.setOut(new PrintStream(output));
                            Method method = mainClass.getMethod("main", String[].class);
                            method.invoke(null, (Object) new String[0]);
                            output.close();
                        }
                    } else {
                        this.compileResult = false;
                    }

                    System.setOut(out);   // 还原默认打印的对象
                    this.runResult = true;
                } catch (Exception e) {
                    this.runResult = false;
                    this.exceptionString = e.getMessage() + "  run error";
                } finally {
                    System.setOut(out);   // 还原默认打印的对象
                    System.setErr(error);
                }
            }

            // 设置运行耗时
            long endTime = System.currentTimeMillis();
            this.runtime = endTime - startTime;
        } catch (Exception e) {
            this.exceptionString = "编译异常";
            this.compileResult = false;
        }

    }
}
