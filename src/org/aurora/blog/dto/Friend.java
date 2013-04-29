package org.aurora.blog.dto;

public class Friend {
	private int id;
	private String name;
	private String sex;
	private String bir;
	private String city;
	private String addr;
	private String mail;
	private String tel;
	private String qq;
	private String username;
	public Friend() {
	}
	public Friend(String name, String sex, String bir, String city,
			String addr, String mail, String tel, String qq, String username) {
		this.name = name;
		this.sex = sex;
		this.bir = bir;
		this.city = city;
		this.addr = addr;
		this.mail = mail;
		this.tel = tel;
		this.qq = qq;
		this.username = username;
	}
	public Friend(int id, String name, String sex, String bir, String city,
			String addr, String mail, String tel, String qq, String username) {
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.bir = bir;
		this.city = city;
		this.addr = addr;
		this.mail = mail;
		this.tel = tel;
		this.qq = qq;
		this.username = username;
	}
	public Friend(int id, String name, String sex, String bir, String city,
			String addr, String mail, String tel, String qq) {
		this.id = id;
		this.name = name;
		this.sex = sex;
		this.bir = bir;
		this.city = city;
		this.addr = addr;
		this.mail = mail;
		this.tel = tel;
		this.qq = qq;
	}
	public Friend( String name, String sex, String bir, String city,
			String addr, String mail, String tel, String qq) {
		this.name = name;
		this.sex = sex;
		this.bir = bir;
		this.city = city;
		this.addr = addr;
		this.mail = mail;
		this.tel = tel;
		this.qq = qq;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBir() {
		return bir;
	}
	public void setBir(String bir) {
		this.bir = bir;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	

}
