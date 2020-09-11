package po;

import java.util.Date;
import javax.validation.constraints.Past;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

public class User {
	private int uid;
	@NotBlank(message="帐号不能为空")
	private String account;
	@NotBlank(message="密码不能为空")
	private String password;
	@NotBlank(message="昵称不能为空")
	private String nikename;
	@NotBlank(message="真名不能为空")
	private String realname;
	private String sex;
	@NotBlank(message="手机号不能为空")
	private String phone;
	@NotBlank(message="地址不能为空")
	private String address;
	@NotBlank(message="邮箱不能为空")
	private String email;

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
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
	public String getNikename() {
		return nikename;
	}
	public void setNikename(String nikename) {
		this.nikename = nikename;
	}
	public String getRealname() {
		return realname;
	}
	public void setRealname(String realname) {
		this.realname = realname;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String speak(){
		return this.getUid()+this.getAccount()+this.getPassword()+this.getNikename()+this.getRealname()+this.sex+this.phone+this.address+this.email;
	}
}
