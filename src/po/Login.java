package po;

import org.hibernate.validator.constraints.NotBlank;

public class Login {
	public int uid;
	@NotBlank(message="帐号不能为空")
	private String account;
	@NotBlank(message="密码不能为空")
	private String password;
	public int getUid() {
		return uid;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
