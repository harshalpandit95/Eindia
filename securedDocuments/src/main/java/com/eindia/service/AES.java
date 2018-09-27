package com.eindia.service;

import java.security.Key;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

@SuppressWarnings("restriction")
@org.springframework.stereotype.Service
public class AES {
	private final static String algorithm = "AES";
	private final static byte[] keyValue = new byte[16];

	// Performs Encryption
	public static Map<String, String> encrypt(String plainText) throws Exception {
		new SecureRandom().nextBytes(keyValue);
		Key key = generateKey();
		String encryptionKey = Base64.getEncoder().encodeToString(key.getEncoded());
		System.out.println("the encryption key is" + Base64.getEncoder().encodeToString(key.getEncoded()));
		Cipher chiper = Cipher.getInstance(algorithm);
		chiper.init(Cipher.ENCRYPT_MODE, key);
		byte[] encVal = chiper.doFinal(plainText.getBytes());
		String encryptedValue = new BASE64Encoder().encode(encVal);
		Map<String, String> encrypt = new HashMap<String, String>();
		encrypt.put(encryptionKey, encryptedValue);
		return encrypt;

	}

	// Performs decryption
	public static String decrypt(String encryptedText, String keya) throws Exception

	{ // generate key
		Key key = new SecretKeySpec(Base64.getDecoder().decode(keya), algorithm);
		System.out.println("the decryption key is" + key);
		Cipher chiper = Cipher.getInstance(algorithm);
		chiper.init(Cipher.DECRYPT_MODE, key);
		byte[] decordedValue = new BASE64Decoder().decodeBuffer(encryptedText);
		byte[] decValue = chiper.doFinal(decordedValue);
		String decryptedValue = new String(decValue);
		return decryptedValue;
	}

	// generateKey() is used to generate a secret key for AES algorithm
	private static Key generateKey() throws Exception {

		Key key = new SecretKeySpec(keyValue, algorithm);
		return key;
	}

	// performs encryption & decryption

}