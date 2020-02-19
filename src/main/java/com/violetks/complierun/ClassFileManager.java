package com.violetks.complierun;

import java.io.IOException;
import javax.tools.FileObject;
import javax.tools.ForwardingJavaFileManager;
import javax.tools.JavaFileManager;
import javax.tools.JavaFileObject;
import javax.tools.JavaFileObject.Kind;
import javax.tools.JavaFileManager.Location;

public class ClassFileManager extends ForwardingJavaFileManager {
    private JavaClassFileObject classFileObject;

    protected ClassFileManager(JavaFileManager fileManager) {
        super(fileManager);
    }

    public JavaFileObject getJavaFileForOutput(Location location, String className, Kind kind, FileObject sibling) throws IOException {
        this.classFileObject = new JavaClassFileObject(className, kind);
        return this.classFileObject;
    }

    public ClassLoader getClassLoader(Location location) {
        return new ClassLoader() {
            protected Class findClass(String name) throws ClassNotFoundException {
                byte[] classBytes = ClassFileManager.this.classFileObject.getClassBytes();
                return super.defineClass(name, classBytes, 0, classBytes.length);
            }
        };
    }
}
