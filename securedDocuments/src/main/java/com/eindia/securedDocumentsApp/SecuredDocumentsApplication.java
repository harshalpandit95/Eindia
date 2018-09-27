package com.eindia.securedDocumentsApp;

import java.util.Scanner;

import javax.annotation.Resource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

import com.eindia.repo.InfoRepo;
import com.eindia.repo.ShareRepo;
import com.eindia.service.AES;
import com.eindia.service.GenerateQRCode;
import com.eindia.service.ReadQrCode;
import com.eindia.service.StorageService;

@ComponentScan("com.eindia")
@SpringBootApplication
public class SecuredDocumentsApplication implements CommandLineRunner {
	private static final Logger log = LogManager.getLogger(SecuredDocumentsApplication.class);
	@Autowired
	private InfoRepo trepo;

	@Resource
	StorageService storageService;
	@Autowired
	GenerateQRCode gen;
	@Autowired
	ReadQrCode read;

	@Autowired
	AES aes;
	@Autowired
	ShareRepo shareRepo;

	public static void main(String[] args) {
		SpringApplication.run(SecuredDocumentsApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		// storageService.deleteAll();
		 storageService.init();
		// System.out.println(trepo.getUserDetails("EIN16809807", "user1",
		// "user").toString());
		/*
		 * String fileName = "QR.png";
		 * 
		 * ClassLoader classLoader = ClassLoader.getSystemClassLoader();
		 * 
		 * File file = new File(classLoader.getResource(fileName).getFile());
		 * System.out.println(file.getAbsolutePath());
		 * 
		 * gen.createQRImage(file, aes.encrypt("helloeveryone"), 64, "png"); String data
		 * = gen.readQrCodeForText(file.getAbsolutePath(), "png");
		 */

	/*	String username = "EIN123";
		String shareKey = "";
		String tp = "shareUser";
		String encryptedText = "";

		Map<String, String> encrypt = aes.encrypt("hello");
		for (Map.Entry<String, String> entry : encrypt.entrySet()) {
			shareKey = entry.getKey();
			encryptedText = entry.getValue();
		}
		Share s = new Share();
		s.setUser(username);
		s.setSym(shareKey);
		s.setTp(tp);

		shareRepo.save(s);
		shareKey = shareRepo.getUserDetails(username, tp).getSym();
		System.out.println(aes.decrypt(encryptedText, shareKey));*/
		
	/*	  String decrypted = aes.decrypt("XyWVPJoQreRiQAVM26w6mUc10sXT/DguqjDBO/8DuuI=", new
		  Scanner(System.in).next());
		  System.out.println(decrypted);*/
		 

		// gen.bingo("png");

	}
}
