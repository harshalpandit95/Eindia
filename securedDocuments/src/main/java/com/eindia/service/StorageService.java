package com.eindia.service;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.LinkOption;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;
import org.springframework.util.FileSystemUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class StorageService {

	Logger log = LoggerFactory.getLogger(this.getClass().getName());
	private final Path rootLocation = Paths.get("upload-dir");

	public void store(MultipartFile file, String username, String documentType) {
		try {
			// create Directory For UserId
			Path newPath = Paths.get("upload-dir/" + username);
			if (!Files.exists(newPath, LinkOption.NOFOLLOW_LINKS)) {
				Files.createDirectory(newPath);
				// create Directory For ProfilePicture
				Path documentPath = null;
				if (documentType.equalsIgnoreCase("pic")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "pic");
				} else if (documentType.equalsIgnoreCase("adhar")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "adhar");
				} else if (documentType.equalsIgnoreCase("pan")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "pan");
				} else if (documentType.equalsIgnoreCase("voterId")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "voterId");
				}

				// for Profile Picture
				if (!Files.exists(documentPath, LinkOption.NOFOLLOW_LINKS)) {
					Files.createDirectory(documentPath);
					Files.copy(file.getInputStream(), documentPath.resolve(file.getOriginalFilename()));
				} else {
					FileSystemUtils.deleteRecursively(documentPath.toFile());
					Files.copy(file.getInputStream(), documentPath.resolve(file.getOriginalFilename()));
				}

			} else {
				// create Directory For ProfilePicture
				Path documentPath = null;
				if (documentType.equalsIgnoreCase("pic")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "pic");
				} else if (documentType.equalsIgnoreCase("adhar")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "adhar");
				} else if (documentType.equalsIgnoreCase("pan")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "pan");
				} else if (documentType.equalsIgnoreCase("voterId")) {
					documentPath = Paths.get("upload-dir/" + username + "/" + "voterId");
				}
				if (!Files.exists(documentPath, LinkOption.NOFOLLOW_LINKS)) {
					Files.createDirectory(documentPath);
					Files.copy(file.getInputStream(), documentPath.resolve(file.getOriginalFilename()));
				} else {
					FileSystemUtils.deleteRecursively(documentPath.toFile());
					Files.createDirectory(documentPath);
					Files.copy(file.getInputStream(), documentPath.resolve(file.getOriginalFilename()));
				}
			}
		} catch (Exception e) {
			throw new RuntimeException("FAIL!");
		}
	}

	public Resource loadFile(String filename) {
		try {
			Path file = rootLocation.resolve(filename);
			Resource resource = new UrlResource(file.toUri());
			if (resource.exists() || resource.isReadable()) {
				return resource;
			} else {
				throw new RuntimeException("FAIL!");
			}
		} catch (MalformedURLException e) {
			throw new RuntimeException("FAIL!");
		}
	}

	public Resource getResources(Path path) {
		Resource resource = null;
		for (File f : path.toFile().listFiles()) {
			try {
				resource = new UrlResource(f.toURI());
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return resource;
	}

	public void deleteAll() {
		FileSystemUtils.deleteRecursively(rootLocation.toFile());
	}

	public void init() {
		try {
			if (!Files.exists(rootLocation, LinkOption.NOFOLLOW_LINKS)) {
				Files.createDirectory(rootLocation);
			}

		} catch (IOException e) {
			throw new RuntimeException("Could not initialize storage!");
		}
	}
}