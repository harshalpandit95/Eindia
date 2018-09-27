package com.eindia.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.core.io.UrlResource;
import org.springframework.core.io.support.ResourcePatternResolver;
import org.springframework.core.io.support.ResourcePatternUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;

import com.eindia.domain.Share;
import com.eindia.model.Data;
import com.eindia.model.ResponseQr;
import com.eindia.model.ResponseQrBody;
import com.eindia.repo.ShareRepo;
import com.eindia.service.AES;
import com.eindia.service.GenerateQRCode;
import com.eindia.service.StorageService;
import com.eindia.util.JsonParserUtil;
import com.google.zxing.NotFoundException;
import com.google.zxing.WriterException;

@RestController
@RequestMapping("/api")
public class RestUploadController {
	private static final Logger log = LogManager.getLogger(RestUploadController.class);

	@Autowired
	StorageService storageService;
	@Autowired
	ResourcePatternResolver resorcePatternResolver;

	@Autowired
	private ResourceLoader resourceLoader;

	@Autowired
	GenerateQRCode gen;

	@Autowired
	AES aes;
	@Autowired
	ShareRepo shareRepo;

	@Autowired
	public void Foobar(ResourceLoader resourceLoader) {
		this.resourceLoader = resourceLoader;
	}

	Resource[] loadResources(String pattern) throws IOException {
		return ResourcePatternUtils.getResourcePatternResolver(resourceLoader).getResources(pattern);
	}

	List<String> files = new ArrayList<String>();

	@GetMapping(value = "/get/image/{userId}/{document}")
	public ResponseEntity<InputStreamResource> getImage(@PathVariable("userId") String id,
			@PathVariable("document") String document) throws IOException {
		if (!StringUtils.isEmpty(document) && !StringUtils.isEmpty(id)) {
			Path rootLocation = null;
			Resource resource = null;
			if (document.equalsIgnoreCase("pic")) {
				rootLocation = Paths.get("upload-dir" + "/" + id + "/pic");
				resource = storageService.getResources(rootLocation);

			} else if (document.equalsIgnoreCase("adhar")) {
				rootLocation = Paths.get("upload-dir" + "/" + id + "/adhar");
				resource = storageService.getResources(rootLocation);

			} else if (document.equalsIgnoreCase("pan")) {
				rootLocation = Paths.get("upload-dir" + "/" + id + "/pan");
				resource = storageService.getResources(rootLocation);
			} else if (document.equalsIgnoreCase("voterId")) {
				rootLocation = Paths.get("upload-dir" + "/" + id + "/voterId");
				resource = storageService.getResources(rootLocation);
			}
			return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG)
					.body(new InputStreamResource(resource.getInputStream()));

		} else {
			return null;

		}

	}

	@GetMapping(value = "/get/qrcode/{userId}/{documentList}/{thirdPary}")
	public ResponseEntity<InputStreamResource> getQrCode(@PathVariable("userId") String id,
			@PathVariable("documentList") String documentList, @PathVariable("thirdPary") String thirdParty)
			throws IOException {
		String fileName = "QR.png";
		ClassLoader classLoader = ClassLoader.getSystemClassLoader();
		File file = new File(classLoader.getResource(fileName).getFile());
		System.out.println(file.getAbsolutePath());
		File qr = null;
		try {
			String shareKey = "";
			String encryptedText = "";

			// ~seperatedNames and comma seperated documents
			String textToBeEncrypted = documentList;
			log.info("text to be in qr code is :->" + textToBeEncrypted);

			Map<String, String> encrypt = aes.encrypt(textToBeEncrypted);
			for (Map.Entry<String, String> entry : encrypt.entrySet()) {
				shareKey = entry.getKey();
				encryptedText = entry.getValue();
			}
			Share s = new Share();
			s.setUser(id);
			s.setSym(shareKey);
			s.setTp(thirdParty);
			shareRepo.save(s);
			log.info("share key is stored in database");
			// shareKey = shareRepo.getUserDetails(id, thirdParty).getSym();
			// System.out.println(aes.decrypt(encryptedText, shareKey));

			qr = gen.createQRImage(file, id + "~" + encryptedText, 128, "png");
		} catch (NotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG)
				.body(new InputStreamResource(new FileInputStream(qr)));

	}

	@PostMapping(value = "/get/profilePic")
	public ResponseEntity<InputStreamResource> getProfilePicture(@RequestParam("pic") String pic) throws IOException {

		Path rootLocation = Paths.get("upload-dir");
		Path file = rootLocation.resolve("a.jpg");
		Resource resource = new UrlResource(file.toUri());

		// ClassPathResource imgFile = new ClassPathResource(resource.);
		return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG)
				.body(new InputStreamResource(resource.getInputStream()));
	}

	// Multiple file upload
	@PostMapping("/uploadfile")
	public String uploadFileMulti(@RequestParam("uploadfile") MultipartFile file, @RequestParam("userId") String userId,
			@RequestParam("documentType") String documentType) throws Exception {
		try {
			storageService.store(file, userId, documentType);
			files.add(file.getOriginalFilename());
			return "You successfully uploaded - "
					+ file.getOriginalFilename() /* + " " + userId + " " + documentType */;
		} catch (Exception e) {
			throw new Exception("FAIL! Maybe You had uploaded the file before or the file's size > 500KB");
		}
	}

	// Multiple file upload
	@PostMapping("/uploadQr")
	public String uploadQr(@RequestParam("uploadQr") MultipartFile file, @RequestParam("thirdparty") String thirdparty)
			throws Exception {
		try {
			String encryptedData = gen.readQrCodeForText(file.getInputStream(), "png");
			List<String> listData = Arrays.asList(encryptedData.split("~"));
			String userId = listData.get(0);
			String encryptedText = listData.get(1);
			Share data = shareRepo.getUserDetails(userId, thirdparty);
			String decryptedData = aes.decrypt(encryptedText, data.getSym());
			// return decryptedData; 

			List<String> dataList = Arrays.asList(decryptedData.split(","));
			List<Data> dataObj = new ArrayList<Data>();
			for (String s : dataList) {
				Data d = new Data();
				d.setValue(s);
				dataObj.add(d);
			}

			ResponseQr response = new ResponseQr();
			response.setUserId(userId);
			ResponseQrBody body = new ResponseQrBody();
			body.setDataList(dataObj);
			response.setBody(body);
			return JsonParserUtil.toJson(response);

		} catch (Exception e) {
			throw new Exception("FAIL! Maybe You had uploaded the file before or the file's size > 500KB");
		}
	}

	@GetMapping("/getallfiles")
	public List<String> getListFiles() {
		List<String> lstFiles = new ArrayList<String>();

		try {
			lstFiles = files.stream()
					.map(fileName -> MvcUriComponentsBuilder
							.fromMethodName(RestUploadController.class, "getFile", fileName).build().toString())
					.collect(Collectors.toList());
		} catch (Exception e) {
			throw e;
		}

		return lstFiles;
	}

	@GetMapping("/files/{filename:.+}")
	public ResponseEntity<Resource> getFile(String filename) {

		Resource file = storageService.loadFile(filename);
		return ResponseEntity.ok()
				.header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"")
				.body(file);
	}
}
