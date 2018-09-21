package com.eindia.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "test")

public class Test {
	@Id
	@Column(name = "username")
	String username;

	@Column(name = "PASSWORD")
	String password;

	@Lob
	@Column(name = "profile_pic")
	private byte[] pic;

	public Test() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Test(String username, String password, byte[] pic) {
		super();
		this.username = username;
		this.password = password;
		this.pic = pic;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public byte[] getPic() {
		return pic;
	}

	public void setPic(byte[] pic) {
		this.pic = pic;
	}

}
