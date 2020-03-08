package com.violetks.complierun;

import java.io.IOException;
import javax.tools.FileObject;
import javax.tools.ForwardingJavaFileManager;
import javax.tools.JavaFileManager;
import javax.tools.JavaFileObject;
import javax.tools.JavaFileObject.Kind;

/**
 * 自定义一个JavaFileManager来控制编译之后字节码的输出位置
 */

public class ClassFileManager extends ForwardingJavaFileManager {
    private ByteJavaFileObject classFileObject;

    ClassFileManager(JavaFileManager fileManager) {
        super(fileManager);
    }

    // 获取输出的文件对象，它表示给定位置处指定类型的指定类。
    public JavaFileObject getJavaFileForOutput(Location location, String className, Kind kind, FileObject sibling) throws IOException {
        this.classFileObject = new ByteJavaFileObject(className, kind);
        return this.classFileObject;
    }

    /**
     * 自定义类加载器, 用来加载动态的字节码
     */
    public ClassLoader getClassLoader(Location location) {
        return new ClassLoader() {
            protected Class findClass(String name) throws ClassNotFoundException {
                byte[] classBytes = ClassFileManager.this.classFileObject.getCompiledBytes();
                return super.defineClass(name, classBytes, 0, classBytes.length);
            }
        };
    }
}
