package org.aurora.blog.dto;

public class Pub {
	private int id;
	private String title;
	private String cons;
	public Pub(int id, String title, String cons) {
		super();
		this.id = id;
		this.title = title;
		this.cons = cons;
	}
	public Pub(String title, String cons) {
		super();
		this.title = title;
		this.cons = cons;
	}
	public Pub() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	
}
