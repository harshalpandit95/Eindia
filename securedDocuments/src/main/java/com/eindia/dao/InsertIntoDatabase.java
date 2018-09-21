package com.eindia.dao;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;

import com.eindia.domain.Test;
import com.eindia.repo.TestRepo;

public class InsertIntoDatabase {
	@Autowired
	private TestRepo trepo;
	
	public void insertIntoDb() throws IOException {
		ClassPathResource blueImgFile = new ClassPathResource("images/download.png");
		byte[] arrayPic = new byte[(int) blueImgFile.contentLength()];
		arrayPic = new byte[(int) blueImgFile.contentLength()];
		blueImgFile.getInputStream().read(arrayPic);
		Test blueImage = new Test("newharshalD", "pandit", arrayPic);

		// store image to MySQL via SpringJPA
		trepo.save(blueImage);
	}
	


}
