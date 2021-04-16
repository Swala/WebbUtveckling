package model;

public class PostContent { //should be a bean and have method to split string 
	
	private String content;
	private String tag;
	private String name;
	private String date;
	
	
	public PostContent(String content, String tag, String name, String date) {
		this.content= content;
		this.tag= tag;
		this.name = name;
		this.date = date;
	}

	public String getContent() {
		return content;
	}


	public String getTag() {
		return tag;
	}


	public void setTag(String tag) {
		this.tag = tag;
	}


	public String getName() {
		return name;
	}


	public String getDate() {
		return date;
	}
	

}
