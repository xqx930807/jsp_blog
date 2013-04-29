package org.aurora.blog.dto;

public class Article {
	private int id;
	private String username;//用户名
	private String title;//标题
	private String cons;//内容
	private String time;
	
	public Article() {
	}
	public Article(String username, String title, String cons) {
		this.username = username;
		this.title = title;
		this.cons = cons;
	}
	public Article(int id, String username,String title,String cons) {
		this.id = id;
		this.username = username;
		this.title = title;
		this.cons = cons;
	}
	public Article(int id,String username, String title) {
		this.id = id;
		this.username = username;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCons() {
		return cons;
	}
	public void setCons(String cons) {
		this.cons = cons;
	}
	public String getTime(){
		return time;
	}
	public void setTime(){
		this.time = time;
	}
	
}
