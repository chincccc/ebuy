package service;

import po.*;

import javax.jms.Message;
import java.util.List;


public interface EbuyService {
	public void addUser(User user);
	public List<User> userLogin(Login login);
	public void changeUser(User user);
	public List<User> selectAllUser();
	public List<User> selectUserById(int uid);
	public List<User> selectUserByAccount(String account);

	public void addGoods(Goods goods);
	public void changeGoods(Goods goods);
	public void delGoods(int gid);
	public List<Goods> selectGoodsByUId(int uid);
	public List<Goods> selectGoodsByGId(int gid);
	public List<Goods> selectAllGoods();

	public void addOrders(Orders orders);
	public List<Orders> selectOrdersBySellerId(int uid);
	public List<Orders> selectOrdersByBuyId(int uid);
	public List<Orders> selectOrdersByOId(int oid);
	public void changeOrders(Orders orders);
	public void delOrders(int oid);

	public void addComments(Comments comments);
	public void changeComments(Comments comments);
	public void delComments(int cid);
	public List<Comments> selectCommentsByGid(int gid);
	public List<Comments> selectCommentsByCid(int cid);

	public void addStart(Start start);
	public List<Start> selectStartBySellerId(int sid);
	public List<Start> selectStartByuid(int uid);
	public void delStart(int sid);


	public  void addMessages(Messages messages);
	public List<Messages> selectMessagesBymid(int mid);
	public List<Messages> selectMessagesBysendid(int sendid,int getid);
	public List<Messages> selectMessagesBygetid(int getid,int sendid);
	public  void delMessages(int mid);

	public List<Goods> selectGoodsByGname(String gname);
	public void changeGoodsSellstaus(int gid);
}
