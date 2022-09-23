package spring.web.entity;

import javax.persistence.Table;

@Table(name="librarian")
public class Librarian {
	
	private String email;
	private String password;

	public Librarian() {
		super();
	}

	public Librarian(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getpassword() {
		return password;
	}

	public void setpassword(String password) {
		this.password = password;
	}
}
