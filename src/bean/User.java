package bean;

public class User {
	String id;
	String name;
	String mail;
	String text;
	String postTime;
	String editTime;
	String fileName;

	public User(String id, String name, String mail, String text, String postTime, String editTime,String fileName) {
		super();
		this.id = id;
		this.name = name;
		this.mail = mail;
		this.text = text;
		this.postTime = postTime;
		this.editTime = editTime;
		this.fileName = fileName;
	}

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

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getPostTime() {
		return postTime;
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	public String getEditTime() {
		return editTime;
	}

	public void setEditTime(String editTime) {
		this.editTime = editTime;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}
