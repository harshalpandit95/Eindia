package com.eindia.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "info")
public class Info {
	/*
	 * @OneToOne(mappedBy = "info") private User user;
	 */
	@Id
	@Column(name = "uname")
	String uname;
	@Column(name = "password")
	String password;
	@Column(name = "firstname")
	String firstName;
	@Column(name = "middlename")
	String middleName;
	@Column(name = "lastname")
	String lastName;
	@Column(name = "dob")
	String dob;
	@Column(name = "email")
	String email;
	@Column(name = "phone")
	String phone;
	@Column(name = "gender")
	String gender;
	@Column(name = "caste")
	String caste;
	@Column(name = "address")
	String address;
	@Column(name = "state")
	String state;
	@Column(name = "district")
	String district;
	@Column(name = "pin")
	String pin;
	@Column(name = "licence_no")
	String licenceNo;
	@Column(name = "adhar_no")
	String adharNo;
	@Column(name = "pan_no")
	String panNo;
	@Column(name = "l_type")
	String loginType;
	@Column(name = "voter_no")
	String voterNo;
	@Column(name = "created")
	String created;

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getCaste() {
		return caste;
	}

	public void setCaste(String caste) {
		this.caste = caste;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getLicenceNo() {
		return licenceNo;
	}

	public void setLicenceNo(String licenceNo) {
		this.licenceNo = licenceNo;
	}

	public String getAdharNo() {
		return adharNo;
	}

	public void setAdharNo(String adharNo) {
		this.adharNo = adharNo;
	}

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	public String getLoginType() {
		return loginType;
	}

	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}

	public String getVoterNo() {
		return voterNo;
	}

	public void setVoterNo(String voterNo) {
		this.voterNo = voterNo;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public Info(String uname, String password, String firstName, String middleName, String lastName, String dob,
			String email, String phone, String gender, String caste, String address, String state, String district,
			String pin, String licenceNo, String adharNo, String panNo, String loginType, String voterNo,
			String created) {
		super();
		this.uname = uname;
		this.password = password;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.dob = dob;
		this.email = email;
		this.phone = phone;
		this.gender = gender;
		this.caste = caste;
		this.address = address;
		this.state = state;
		this.district = district;
		this.pin = pin;
		this.licenceNo = licenceNo;
		this.adharNo = adharNo;
		this.panNo = panNo;
		this.loginType = loginType;
		this.voterNo = voterNo;
		this.created = created;
	}

	public Info() {
		super();
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "Info [uname=" + uname + ", password=" + password + ", firstName=" + firstName + ", middleName="
				+ middleName + ", lastName=" + lastName + ", dob=" + dob + ", email=" + email + ", phone=" + phone
				+ ", gender=" + gender + ", caste=" + caste + ", address=" + address + ", state=" + state
				+ ", district=" + district + ", pin=" + pin + ", licenceNo=" + licenceNo + ", adharNo=" + adharNo
				+ ", panNo=" + panNo + ", loginType=" + loginType + ", voterNo=" + voterNo + ", created=" + created
				+ "]";
	}

	/*
	 * CREATE TABLE `info` ( `uname` varchar(20) NOT NULL, `password` varchar(20)
	 * NOT NULL, `firstname` varchar(50) NOT NULL, `middlename` varchar(50) NOT
	 * NULL, `lastname` varchar(50) NOT NULL, `dob` varchar(40) NOT NULL, `email`
	 * varchar(35) DEFAULT NULL, `phone` varchar(10) DEFAULT NULL, `gender`
	 * varchar(8) NOT NULL, `caste` varchar(20) NOT NULL, `address` varchar(350) NOT
	 * NULL, `state` varchar(25) NOT NULL, `district` varchar(25) NOT NULL, `pin`
	 * int(7) NOT NULL, `licence_no` varchar(10) DEFAULT NULL, `adhar_no` int(12)
	 * DEFAULT NULL, `pan_no` varchar(10) DEFAULT NULL, `voter_no` varchar(10)
	 * DEFAULT NULL, `l_type` varchar(10) NOT NULL, `created` varchar(50) DEFAULT
	 * NULL, PRIMARY KEY (`uname`) ) ENGINE=InnoDB DEFAULT CHARSET=latin1
	 */

}
