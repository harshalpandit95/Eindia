package com.eindia.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.eindia.model.ResponseMetadata;
import com.eindia.service.DocumentServiceImpl;

@Controller
@RequestMapping(value = "/doc")
public class FileUploadController {

	/*
	 * private static final Logger LOG = Logger.getLogger(DocumentController.class);
	 */

	@Autowired
	private DocumentServiceImpl dsi;

	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public @ResponseBody ResponseMetadata handleFileUpload(@RequestParam(value = "file") MultipartFile file) throws IOException {
		return dsi.save(file);
	}
	
/*
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public HttpEntity getDocument(@PathVariable Long id) {
		HttpHeaders httpHeaders = new HttpHeaders();
		httpHeaders.setContentType(MediaType.IMAGE_JPEG);
		return new ResponseEntity(documentService.getDocumentFile(id), httpHeaders, HttpStatus.OK);
	}
*/
	/*
	 * @RequestMapping(method = RequestMethod.GET) public @ResponseBody List
	 * getDocument() { return documentService.findAll(); }
	 */
}