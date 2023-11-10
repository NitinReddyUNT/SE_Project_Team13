/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.hash;

import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.PrivateKey;
import java.security.Signature;
import java.util.Base64;

/**
 *
 * @author nitinReddyBalaiahgari
 */
public class BlocKChainSingHash {
    
     PrivateKey privateKey;

    public static String getData(String data,PrivateKey privateKey)throws Exception{
         byte[]  dataBytes  = data.getBytes();

     String hashEncodedString=BlocKChainSingHash.hash  ("SHA-256", dataBytes,privateKey);

    return hashEncodedString;
    }
  public static String hash(String algorithm, byte[] dataBytes,PrivateKey privateKey) throws Exception {

    //CREATE HASH
    MessageDigest digest    = MessageDigest.getInstance(algorithm);
    byte[]        hashBytes = digest.digest(dataBytes);

    //ENCODE HASH
    byte[]        hashEncoded = Base64.getEncoder().encode(hashBytes);
    String        hashEncodedString = new String(hashEncoded);
    
    BlocKChainSingHash.sign  ("NONEwithRSA", privateKey, hashEncoded);
 
    //DISPLAY ENCODED HASH
    System.out.println("HASH      = " + hashEncodedString);

    //RETURN HASH
    return hashEncodedString;

  }
  public static String sign(String algorithm, PrivateKey privateKey, byte[] hashBytes) throws Exception {

    //SIGN HASH
    Signature         signature = Signature.getInstance(algorithm);
                      signature.initSign(privateKey);
                      signature.update(hashBytes);
    byte[]            signatureBytes = signature.sign();

    //ENCODE SIGNATURE
    byte[]            signatureEncodedBytes = Base64.getEncoder().encode(signatureBytes);
    String            signatureEncodedString = new String(signatureEncodedBytes);

    //DISPLAY ENCODED HASH & SIGNATURE
    System.out.println("SIGNATURE = " + signatureEncodedString);

    //RETURN SIGNATURE
    return signatureEncodedString;

  }
}