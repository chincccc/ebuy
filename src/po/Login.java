package po;

import org.hibernate.validator.constraints.NotBlank;

public class Login {
	public int uid;
	@NotBlank(message="�ʺŲ���Ϊ��")
	private String account;
	@NotBlank(message="���벻��Ϊ��")
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
