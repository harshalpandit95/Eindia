package com.eindia.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.eindia.domain.Info;
import com.eindia.model.Body;
import com.eindia.model.ForgotPasswordRequest;
import com.eindia.model.LoginRequest;
import com.eindia.model.RegisterUserRequest;
import com.eindia.model.RegisterUserResponse;
import com.eindia.model.ResetRequest;
import com.eindia.model.ResponseData;
import com.eindia.repo.InfoRepo;
import com.eindia.service.EmailService;
import com.eindia.util.JsonParserUtil;

@RestController
@RequestMapping(value = "/dbService")
public class DatabaseController {
	private static final Logger log = LogManager.getLogger(RestUploadController.class);
	@Autowired
	private InfoRepo irepo;
	@Autowired
	private EmailService eservice;

	protected String getSaltString() {
		String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
		StringBuilder salt = new StringBuilder();
		Random rnd = new Random();
		while (salt.length() < 18) { // length of the random string.
			int index = (int) (rnd.nextFloat() * SALTCHARS.length());
			salt.append(SALTCHARS.charAt(index));
		}
		String saltStr = salt.toString();
		return saltStr;

	}

	@RequestMapping(value = "/registerUser", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String registerUser(@RequestBody String request) throws IOException {
		String data = "";

		RegisterUserRequest requestObj = JsonParserUtil.fromJson(request, RegisterUserRequest.class);
		log.info("request received is ->" + request);
		
		Info info = new Info();
		int rand = (int) (Math.random() * 50000000 + 1);
		String username = "EIN" + rand;
		String password = getSaltString();
		info.setUname(username);
		info.setPassword(password);
		info.setFirstName(requestObj.getFirstName());
		info.setMiddleName(requestObj.getMiddleName());
		info.setLastName(requestObj.getLastName());
		info.setDob(requestObj.getDob());
		info.setGender(requestObj.getGender());
		info.setCaste(requestObj.getCaste());
		info.setAddress(requestObj.getAddress());
		info.setState(requestObj.getState());
		info.setDistrict(requestObj.getDistrict());
		info.setPin(requestObj.getPinCode().toString());
		info.setEmail(requestObj.getEmailId());
		info.setPhone(requestObj.getPhoneNo());

		info.setLoginType("user");
		long millis = System.currentTimeMillis();

		java.sql.Date date = new java.sql.Date(millis);
		info.setCreated(date.toString());

		irepo.save(info);

		log.info("data saved into Database successfully...");
		RegisterUserResponse responseObj = new RegisterUserResponse();
		responseObj.setUsername(username);
		responseObj.setStatus("success");
		data = JsonParserUtil.toJson(responseObj);

		return data;
	}

	@RequestMapping(value = "/getUserDetails", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String getUserInfo(@RequestBody String request) throws IOException {
		String data = "";
		LoginRequest requestObj = JsonParserUtil.fromJson(request, LoginRequest.class);
		Info info = irepo.getUserDetails(requestObj.getUsername(), requestObj.getPassword(), requestObj.getLoginType());
		ResponseData responseObj = new ResponseData();
		Body body = new Body();

		if (info != null) {
			body.setStatus("success");
			List<Info> dataList = new ArrayList<Info>();
			dataList.add(info);
			body.setDataList(dataList);
			responseObj.setBody(body);
		} else {
			body.setStatus("UserId / Password Not Found..");
			responseObj.setBody(body);
		}

		data = JsonParserUtil.toJson(responseObj);
		return data;

	}

	@RequestMapping(value = "/recoverPassword", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String recoverPassword(@RequestBody String request) throws IOException {
		String data = "";
		ForgotPasswordRequest requestObj = JsonParserUtil.fromJson(request, ForgotPasswordRequest.class);

		ResponseData responseObj = new ResponseData();
		Body body = new Body();
		if (!StringUtils.isEmpty(requestObj.getEmail()) && !StringUtils.isEmpty(requestObj.getUsername())) {

			if (eservice.sendEmail("eindia111@gmail.com", "eindia111@gmail.com", "8087024498", requestObj)) {
				body.setStatus("success");
				responseObj.setBody(body);
			} else {
				body.setStatus("Password for User Not Found");
				responseObj.setBody(body);
			}

		}

		data = JsonParserUtil.toJson(responseObj);
		return data;
	}

	@RequestMapping(value = "/resetPassword", method = RequestMethod.POST, produces = "application/json")
	public @ResponseBody String resetPassword(@RequestBody String request) throws IOException {
		String data = "";
		ResetRequest requestObj = JsonParserUtil.fromJson(request, ResetRequest.class);
		ResponseData responseObj = new ResponseData();
		Body body = new Body();

		if (!StringUtils.isEmpty(requestObj.getUsername()) && !StringUtils.isEmpty(requestObj.getLoginType())
				&& !StringUtils.isEmpty(requestObj.getPassword())
				&& !StringUtils.isEmpty(requestObj.getNewPassword())) {
			Info info = irepo.getUserDetails(requestObj.getUsername(), requestObj.getPassword(),
					requestObj.getLoginType());
			if (info != null) {
				if (info.getPassword().equalsIgnoreCase(requestObj.getPassword())) {
					irepo.updatePassword(requestObj.getUsername(), requestObj.getPassword(), requestObj.getLoginType(),
							requestObj.getNewPassword());
					body.setStatus("success");
				} else {
					body.setStatus("Password do not match");
				}

			}

		} else {
			body.setStatus("Failed to Reset Password as username does not exist");
		}

		responseObj.setBody(body);

		data = JsonParserUtil.toJson(responseObj);
		return data;
	}

}
