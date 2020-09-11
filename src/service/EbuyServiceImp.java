package service;

import dao.EbuyDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import po.*;

import javax.jms.Message;
import java.util.List;

@Service("EbuyService")
@Transactional
public class EbuyServiceImp implements EbuyService {
	@Autowired
	private EbuyDAO ebuyDao;

	@Override
	public void addUser(User user) {
		ebuyDao.addUser(user);
	}
	@Override
	public void changeUser(User user) {
		ebuyDao.changeUser(user);
	}
	@Override
	public List<User> userLogin(Login login) {
		return ebuyDao.userLogin(login);
	}
	@Override
	public List<User> selectUserById(int uid) {
		return ebuyDao.selectUserById(uid);
	}
	@Override
	public List<User> selectUserByAccount(String account) {
		return ebuyDao.selectUserByAccount(account);
	}


	@Override
	public List<User> selectAllUser() {
		return ebuyDao.selectAllUser();
	}
	@Override
	public void addGoods(Goods goods) {
		ebuyDao.addGoods(goods);
	}
	@Override
	public void changeGoods(Goods goods) {
		ebuyDao.changeGoods(goods);
	}
	@Override
	public void delGoods(int gid) {
		ebuyDao.delGoods(gid);
	}
	@Override
	public List<Goods> selectGoodsByUId(int uid) {
		return ebuyDao.selectGoodsByUId(uid);
	}
	@Override
	public List<Goods> selectAllGoods() {
		return ebuyDao.selectAllGoods();
	}
	@Override
	public List<Goods> selectGoodsByGId(int gid){return ebuyDao.selectGoodsByGId(gid);}

	@Override
	public void addOrders(Orders orders){ ebuyDao.addOrders(orders);}
	@Override
	public List<Orders> selectOrdersBySellerId(int uid) {
		return ebuyDao.selectOrdersBySellerId(uid);
	}
	@Override
	public List<Orders> selectOrdersByBuyId(int uid) {
		return ebuyDao.selectOrdersByBuyId(uid);
	}
	@Override
	public List<Orders> selectOrdersByOId(int oid) {
		return ebuyDao.selectOrdersByOId(oid);
	}
	@Override
	public void changeOrders(Orders orders){ebuyDao.changeOrders(orders);}
	@Override
	public void delOrders(int oid){ebuyDao.delOrders(oid);}

	@Override
	public void addComments(Comments comments){ebuyDao.addComments(comments);}
	@Override
	public void changeComments(Comments comments){ebuyDao.changeComments(comments);}
	@Override
	public List<Comments> selectCommentsByGid(int gid){return ebuyDao.selectCommentsByGid(gid);}
	@Override
	public List<Comments> selectCommentsByCid(int cid){return ebuyDao.selectCommentsByCid(cid);}
	@Override
	public void delComments(int cid){ebuyDao.delComments(cid);}


	@Override
	public void addStart(Start start){ ebuyDao.addStart(start);}
	@Override
	public List<Start> selectStartBySellerId(int sid) {
		return ebuyDao.selectStartBySellerId(sid);
	}
	@Override
	public List<Start> selectStartByuid(int uid) {
		return ebuyDao.selectStartByuid(uid);
	}
	@Override
	public void delStart(int sid){ebuyDao.delStart(sid);}

	@Override
	public  void addMessages(Messages messages){ebuyDao.addMessages(messages);}
	@Override
	public List<Messages> selectMessagesBymid(int mid){return ebuyDao.selectMessagesBymid(mid);}
	@Override
	public List<Messages> selectMessagesBysendid(int sendid,int getid){return ebuyDao.selectMessagesBysendid(sendid,getid);}
	@Override
	public List<Messages> selectMessagesBygetid(int getid,int sendid){return ebuyDao.selectMessagesBygetid(getid,sendid);}
	@Override
	public  void delMessages(int mid){ebuyDao.delMessages(mid);}

	@Override
	public List<Goods> selectGoodsByGname(String gname){return ebuyDao.selectGoodsByGname(gname);}
	@Override
	public void changeGoodsSellstaus(int gid){ebuyDao.changeGoodsSellstaus(gid);}

}
