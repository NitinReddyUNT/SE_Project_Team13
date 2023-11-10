/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
@author nitinReddyBalaiahgari
 */
package com.action;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import java.io.ByteArrayOutputStream;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.util.Scanner;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.swing.JOptionPane;
import sun.misc.BASE64Encoder;

public class encryption {

    public String encrypt(String text, SecretKey secretkey) {
        String plainData = null, cipherText = null;
        try {
            // Initializing AES cipher for encryption
            plainData = text;

            Cipher aesCipher = Cipher.getInstance("AES");//getting AES instance
            aesCipher.init(Cipher.ENCRYPT_MODE, secretkey);//initiating ciper encryption using secretkey
             // Encrypting the text

            byte[] byteDataToEncrypt = plainData.getBytes();
            byte[] byteCipherText = aesCipher.doFinal(byteDataToEncrypt);//encrypting data 

            cipherText = new BASE64Encoder().encode(byteCipherText);//converting encrypted data to string 

          

        } catch (Exception e) {
             // Handle exceptions
            System.out.println(e);
        }
        return cipherText;
    }

}
