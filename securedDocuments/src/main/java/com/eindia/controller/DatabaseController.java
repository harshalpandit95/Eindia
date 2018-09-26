package com.eindia.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.eindia.domain.Info;
import com.eindia.model.Body;
import com.eindia.model.LoginRequest;
import com.eindia.model.ResponseData;
import com.eindia.repo.InfoRepo;
import com.eindia.util.JsonParserUtil;

@RestController
@RequestMapping(value = "/dbService")
public class DatabaseController {

	@Autowired
	private InfoRepo irepo;

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
	
	

}
