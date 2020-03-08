package com.violetks.complierun;

import java.net.URI;
import javax.tools.SimpleJavaFileObject;

/**
 * 自定义一个字符串的源码对象
 */
public class JavaSourceFromString extends SimpleJavaFileObject {
    // 等待编译的源码字段
    final String code;

    // java源代码 => JavaSourceFromString对象 的时候使用
    public JavaSourceFromString(String name, String code) {
        super(URI.create("string:///" + name.replace('.', '/') + Kind.SOURCE.extension), Kind.SOURCE);
        this.code = code;
    }

    // 字符串源码会调用该方法
    public CharSequence getCharContent(boolean ignoreEncodingErrors) {
        return this.code;
    }
}
