/*package com.eindia.service;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.eindia.domain.Test;
import com.eindia.model.ResponseMetadata;
import com.eindia.repo.TestRepo;

@Service
public class DocumentServiceImpl {

	@Autowired
	private TestRepo trepo;

	public ResponseMetadata save(MultipartFile file) throws IOException {

		Test doc = new Test();
		doc.setUsername(file.getOriginalFilename());
		doc.setPic(file.getBytes());
		trepo.save(doc);
		ResponseMetadata metadata = new ResponseMetadata();
		metadata.setMessage("success");
		metadata.setStatus(200);
		return metadata;
	}

	@Override
	public byte[] getDocumentFile(Long id) {
		return documentDao.findOne(id).getFile();
	}

	@Override
	public List findAll() {
		return (List) documentDao.findAll();
	}

}*/