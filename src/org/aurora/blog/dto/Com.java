package org.aurora.blog.dto;

public class Com {
	private int id;
	private String username;
	private String time;
	private String coms;
	private String title;
	public Com() {
	}
	public Com(String username, String time, String coms) {
		this.username = username;
		this.time = time;
		this.coms = coms;
	}
	public Com(int id, String username,String coms,String title) {
		this.id = id;
		this.username = username;
		this.coms = coms;
		this.title = title;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getComs() {
		return coms;
	}
	public void setComs(String coms) {
		this.coms = coms;
	}
	public String getTitle(){
		return title;
	}
	public void setTitle(){
		this.title = title;
	}
	
	
}
