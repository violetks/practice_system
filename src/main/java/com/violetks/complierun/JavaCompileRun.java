package com.violetks.complierun;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.PrintStream;
import java.io.Writer;
import java.lang.reflect.Method;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Locale;
import javax.tools.DiagnosticListener;
import javax.tools.JavaCompiler;
import javax.tools.JavaFileManager;
import javax.tools.SimpleJavaFileObject;
import javax.tools.ToolProvider;
import javax.tools.JavaCompiler.CompilationTask;
import javax.tools.JavaFileManager.Location;

public class JavaCompileRun {
    private int score = 0;
    private long runtime = 0L;
    private boolean srccompile = false;
    private boolean srcrun = false;
    private String exceptionString = "";

    public JavaCompileRun() { }

    public String getExceptionString() {
        return this.exceptionString;
    }

    public int getScore() {
        return this.score;
    }

    public void setRuntime(long runtime) {
        this.runtime = runtime;
    }

    public void setSrccompile(boolean srccompile) {
        this.srccompile = srccompile;
    }

    public void setSrcrun(boolean srcrun) {
        this.srcrun = srcrun;
    }

    public void setExceptionString(String exceptionString) {
        this.exceptionString = exceptionString;
    }

    public long getRuntime() {
        return this.runtime;
    }

    public boolean isSrccompile() {
        return this.srccompile;
    }

    public boolean isSrcrun() {
        return this.srcrun;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public boolean fileCompare(String file1, String file2) {
        BufferedReader br1 = null;
        BufferedReader br2 = null;
        String temp1 = null;
        String temp2 = null;

        try {
            br1 = new BufferedReader(new FileReader(new File(file1)));
            br2 = new BufferedReader(new FileReader(new File(file2)));

            while((temp1 = br1.readLine()) != null) {
                if ((temp2 = br2.readLine()) == null) {
                    return false;
                }

                temp1 = temp1.trim();
                temp2 = temp2.trim();
                String[] t1 = temp1.split("\\s+");
                String[] t2 = temp2.split("\\s+");

                for(int i = 0; i < t1.length; ++i) {
                    if (!t1[i].equals(t2[i])) {
                        return false;
                    }
                }
            }

            br1.close();
            br2.close();
            return true;
        } catch (Exception var10) {
            this.exceptionString = var10.getMessage() + "comparing error";
            return false;
        }
    }

    public void srcCompile(String scr, int qid, int sid) {
        PrintStream o = System.out;
        PrintStream error = System.err;

        try {
            File fe = new File("d://javalxlog.txt");
            if (!fe.exists()) {
                fe.createNewFile();
            }

            PrintStream err = new PrintStream(fe);
            System.setErr(err);
            long start = System.currentTimeMillis();
            SimpleJavaFileObject fileObject = new JavaSourceFromString("Main", scr);
            if (fileObject == null) {
                System.out.println("fileObject null");
            }

            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            JavaFileManager fileManager = new ClassFileManager(compiler.getStandardFileManager((DiagnosticListener)null, (Locale)null, (Charset)null));
            JavaCompiler.CompilationTask task = compiler.getTask((Writer)null, fileManager, (DiagnosticListener)null, (Iterable)null, (Iterable)null, Arrays.asList(fileObject));
            Boolean c = task.call();
            if (c) {
                this.srccompile = true;

                try {
                    ClassLoader classLoader = fileManager.getClassLoader((Location)null);
                    Class<?> MainClass = classLoader.loadClass("Main");
                    if (MainClass != null) {
                        File f1 = new File("d://answer/" + qid);
                        File f2 = new File("d://output/" + sid);
                        if (!f2.exists()) {
                            f2.mkdir();
                        }

                        File[] fs = f1.listFiles();
                        if (fs.length > 5) {
                            for(int i = 1; i <= 5; ++i) {
                                File f = new File("d://answer/" + qid + "/input" + qid + "0" + i + ".txt");
                                FileInputStream in = new FileInputStream(f);
                                System.setIn(in);
                                FileOutputStream out = new FileOutputStream("d://output/" + sid + "/" + qid + "0" + i + ".txt");
                                System.setOut(new PrintStream(out));
                                Method method = MainClass.getMethod("main", String[].class);
                                method.invoke((Object)null, new String[0]);
                                out.close();
                            }
                        } else {
                            FileOutputStream out = new FileOutputStream("d://output/" + sid + "/" + qid + "01.txt");
                            System.setOut(new PrintStream(out));
                            Method method = MainClass.getMethod("main", String[].class);
                            method.invoke((Object)null, new String[0]);
                            out.close();
                        }
                    } else {
                        this.srccompile = false;
                    }

                    System.setOut(o);
                    this.srcrun = true;
                } catch (Exception var29) {
                    this.srcrun = false;
                    this.exceptionString = var29.getMessage() + "  run error";
                } finally {
                    System.setOut(o);
                    System.setErr(error);
                }
            }

            long end = System.currentTimeMillis();
            this.runtime = end - start;
        } catch (Exception var31) {
            this.exceptionString = "编译异常";
            if (this.srccompile) {
                this.srcrun = false;
            }
        }

    }
}
