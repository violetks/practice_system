package com.violetks.complierun;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URI;
import javax.tools.SimpleJavaFileObject;
import javax.tools.JavaFileObject.Kind;

public class JavaClassFileObject extends SimpleJavaFileObject{
    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();

    public JavaClassFileObject(String className, Kind kind) {
        super(URI.create("string:///" + className.replace('.', '/') + kind.extension), kind);
    }

    public OutputStream openOutputStream() throws IOException {
        return this.outputStream;
    }

    public byte[] getClassBytes() {
        return this.outputStream.toByteArray();
    }
}
