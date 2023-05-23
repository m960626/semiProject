package com.example.mini.model;

import lombok.Data;

@Data
public class Join {
	private String id;
	private String name;
	private String nick;
	private String birth;
	private String position1;
	private String position2;
	private String position3;
	private String gender;
	private String addr;
	private String phone;
	private String email;
	private String status;
	private String cNo;
	private int jNo;
	private String jDate;
	private String jStat;
	private String Delyn;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getNick() {
		return nick;
	}
	public String getBirth() {
		return birth;
	}
	public String getPosition1() {
		return position1;
	}
	public String getPosition2() {
		return position2;
	}
	public String getPosition3() {
		return position3;
	}
	public String getGender() {
		return gender;
	}
	public String getAddr() {
		return addr;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmail() {
		return email;
	}
	public String getcNo() {
		return cNo;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public void setPosition1(String position1) {
		this.position1 = position1;
	}
	public void setPosition2(String position2) {
		this.position2 = position2;
	}
	public void setPosition3(String position3) {
		this.position3 = position3;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public void setPhon(String phone) {
		this.phone = phone;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setcNo(String cNo) {
		this.cNo = cNo;
	}
	public int getjNo() {
		return jNo;
	}
	public void setjNo(int jNo) {
		this.jNo = jNo;
	}
	public String getjDate() {
		return jDate;
	}
	public void setjDate(String jDate) {
		this.jDate = jDate;
	}
	public String getjStat() {
		return jStat;
	}
	public void setjStat(String jStat) {
		this.jStat = jStat;
	}
	public String getDelyn() {
		return Delyn;
	}
	public void setDelyn(String delyn) {
		Delyn = delyn;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
}
