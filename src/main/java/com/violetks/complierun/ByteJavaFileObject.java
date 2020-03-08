package com.violetks.complierun;

import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.net.URI;
import javax.tools.SimpleJavaFileObject;

/**
 * 自定义一个编译之后的字节码对象
 */

public class ByteJavaFileObject extends SimpleJavaFileObject{
    // 编译后的字节码对象
    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

    public ByteJavaFileObject(String className, Kind kind) {
        super(URI.create("string:///" + className.replace('.', '/') + Kind.SOURCE.extension), kind);
    }

    // 把字节码输出到outputStream
    public OutputStream openOutputStream() {
        return this.outputStream;
    }

    // 在类加载器加载的时候需要用到
    public byte[] getCompiledBytes() {
        return this.outputStream.toByteArray();
    }
}
