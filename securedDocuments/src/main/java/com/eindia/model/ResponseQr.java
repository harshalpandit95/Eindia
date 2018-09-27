package com.eindia.model;

public class ResponseQr {

	String userId = "";

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	ResponseQrBody body = new ResponseQrBody();

	public ResponseQrBody getBody() {
		return body;
	}

	public void setBody(ResponseQrBody body) {
		this.body = body;
	}

}
