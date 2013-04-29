package org.aurora.blog.dto;

public class User {
	private int id;
	private String username;
	private String name;
	private String password;
	private String birthdate;
	private String email;
	private String city;
	private String sex;
	private String qq;
	private String homepage;
	private String sign;
	private String intro;
	
	
	public User(int id, String username, String name, String password,
			String birthdate, String email) {
		this.id = id;
		this.username = username;
		this.name = name;
		this.password = password;
		this.birthdate = birthdate;
		this.email = email;
		this.city = city;
		this.sex = sex;
		this.qq = qq;
		this.homepage = homepage;
		this.sign = sign;
		this.intro = intro;
	}
	

	public User(String username, String name, String password,
			String birthdate, String email, String city, String sex, String qq,
			String homepage, String sign, String intro) {
		this.username = username;
		this.name = name;
		this.password = password;
		this.birthdate = birthdate;
		this.email = email;
		this.city = city;
		this.sex = sex;
		this.qq = qq;
		this.homepage = homepage;
		this.sign = sign;
		this.intro = intro;
	}

	
	public User() {
	}

	

	public User(String username, String name, String password,String birthdate, String email, String city) {
		this.username = username;
		this.name = name;
		this.password = password;
		this.birthdate = birthdate;
		this.email = email;
		this.city = city;
	}
	
	public User(int id,String username, String name, String password,String birthdate, String email, String city) {
		this.id = id;
		this.username = username;
		this.name = name;
		this.password = password;
		this.birthdate = birthdate;
		this.email = email;
		this.city = city;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBirthdate() {
		return birthdate;
	}


	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}

	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}

	public String getCity() {
		return city;
	}


	public void setCity(String city) {
		this.city = city;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}
}
