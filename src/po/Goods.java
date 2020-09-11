package po;

import org.hibernate.validator.constraints.NotBlank;

import java.sql.Date;
import java.sql.Time;

public class Goods {
	private int gid;
	@NotBlank(message="商品名不能为空")
	private String gname;
	@NotBlank(message="价格不能为空")
	private String price;
	@NotBlank(message="简介不能为空")
	private String content;

	private int sellstaus;
	private String createtime;
	private int sellerid;

	public Goods(){
	}
	public Goods(int id){
		this.sellerid = id;
	}

	public int getGid() {
		return gid;
	}
	public void setGid(int gid) {
		this.gid = gid;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getSellstaus() {
		return sellstaus;
	}

	public void setSellstaus(int sellstaus) {
		this.sellstaus = sellstaus;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public int getSellerid() {
		return sellerid;
	}

	public void setSellerid(int sellerid) {
		this.sellerid = sellerid;
	}
}
