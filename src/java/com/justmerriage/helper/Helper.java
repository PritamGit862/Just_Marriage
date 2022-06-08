/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.justmerriage.helper;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Dell
 */
public class Helper {
    public static boolean deleteFile(String path){
        boolean f=false;
        try{
            File file=new File(path);
            f=file.delete();  //It return true or false
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    public static boolean saveFile(InputStream is,String path){
        boolean f=false;
        try{
            byte b[]=new byte[is.available()];
            is.read(b);
            try (FileOutputStream fos = new FileOutputStream(path)) {
                fos.write(b);
                fos.flush();
            }
            f=true;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
}
