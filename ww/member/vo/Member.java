package ww.member.vo;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity(name = "userdb")
public class Member {
	@Id
	private String id;
	private String pw;
	private String email;
	private String n_name;

	public String getId() {
		return id;
	}

	public String getPw() {
		return pw;
	}

	public String getEmail() {
		return email;
	}

	public String getN_name() {
		return n_name;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setN_name(String n_name) {
		this.n_name = n_name;
	}

}
