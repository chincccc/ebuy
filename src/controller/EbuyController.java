package controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import po.*;
import service.EbuyService;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class EbuyController {
	private static final Log logger = LogFactory.getLog(EbuyController.class);
	@Autowired
	private EbuyService ebuyService;
	@RequestMapping("/input")
	public String input(@RequestParam("input_type") int input_type,@RequestParam("uid") int uid,Model model){
		if(input_type==1)
		{
			model.addAttribute("userList", ebuyService.selectUserById(uid));
			return "goods_up";
		}else if(input_type==0)
		{
			model.addAttribute("user", new User());
			return "sign_up";
		}
		else{
			return "";
		}
	}

	@RequestMapping(value="/back_home",method= RequestMethod.GET)
	public String back_home(@RequestParam("uid") int uid, Model model){
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		model.addAttribute("goodsList", ebuyService.selectAllGoods());
		return "ture_index";
	}


	@RequestMapping("/add")
	public String save(@Valid User user, BindingResult result, Model model){
		if(result.hasErrors()){
			return "sign_up";
		}else{

			if(ebuyService.selectUserByAccount(user.getAccount())== null || ebuyService.selectUserByAccount(user.getAccount()).size() == 0 )
			{
				ebuyService.addUser(user);
				model.addAttribute("userList", ebuyService.selectAllUser());
				model.addAttribute("conn", "注册成功请登录!!!");
				return "index";
			}else{
				model.addAttribute("conn", "输入的帐号已存在请更改!!!");
				return "tip";
			}
		}
	}
	@RequestMapping("/login")
	public String checkLogin(@Valid Login login,BindingResult result, Model model){
		if(result.hasErrors()){
			return "sign_in";
		}else
		if(ebuyService.userLogin(login)== null || ebuyService.userLogin(login).size() == 0 )
		{
			model.addAttribute("conn", "帐号或密码错误!!!");
			return "tip";
		}else {
			model.addAttribute("userList", ebuyService.userLogin(login));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}
	@RequestMapping(value="/xianqin",method= RequestMethod.GET)
	public String show(@RequestParam("uid") int uid,@RequestParam("uid2") int uid2, Model model){
		if(uid==uid2){
			model.addAttribute("userList", ebuyService.selectUserById(uid));
			return "my";
		}else{
			model.addAttribute("userList", ebuyService.selectUserById(uid));
			model.addAttribute("userList2", ebuyService.selectUserById(uid2));
			return "show_user";
		}
	}
	@RequestMapping(value="/myself",method= RequestMethod.GET)
	public String myself(@RequestParam("uid") int uid, Model model){
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		return "my";
	}
	@RequestMapping("/change_user")
	public String change_user(@Valid User user, BindingResult result, Model model){
		if(result.hasErrors()){
			return "my";
		}else{
			ebuyService.changeUser(user);
			model.addAttribute("userList", ebuyService.selectUserById(user.getUid()));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}
	@RequestMapping("/sign_out")
	public String sign_out(@Valid Login login,BindingResult result, Model model){
		return "index";
	}


	@RequestMapping(value="/linkto_add_goods",method= RequestMethod.GET)
	public String linkto_add_goods(@RequestParam("uid") int uid, Model model){
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		return "goods_up";
	}
	@RequestMapping(value="/linketo_seach",method= RequestMethod.GET)
	public String linketo_seach(@RequestParam("uid") int uid, Model model){
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		return "make_seach";
	}
	@RequestMapping("/add_goods")
	public String add_goods(Goods goods,BindingResult result, Model model){
		if(result.hasErrors()){
			return "add_goods";
		}else{
			Date d = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);
			goods.setCreatetime(now);
			goods.setSellstaus(1);
			ebuyService.addGoods(goods);
			model.addAttribute("userList", ebuyService.selectUserById(goods.getSellerid()));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}
	@RequestMapping(value="/linkto_my_goods",method= RequestMethod.GET)
	public String show_goods(@RequestParam("uid") int uid, Model model){
		model.addAttribute("goodsList", ebuyService.selectGoodsByUId(uid));
		return "my_goods";
	}
	@RequestMapping(value="/xianqin_goods",method= RequestMethod.GET)
	public String xianqin_goods(@RequestParam("uid") int uid,@RequestParam("gid") int gid, Model model){
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		model.addAttribute("commentsList", ebuyService.selectCommentsByGid(gid));
		model.addAttribute("goodsList", ebuyService.selectGoodsByGId(gid));
		return "show_goods";
	}
	@RequestMapping(value="/linkto_change_goods",method= RequestMethod.GET)
	public String linkto_change_goods(@RequestParam("gid") int gid, Model model){
		model.addAttribute("goodsList", ebuyService.selectGoodsByGId(gid));
		return "change_goods";
	}
	@RequestMapping("/change_goods_fun")
	public String change_goods_fun(Goods goods,BindingResult result, Model model){
		if(result.hasErrors()){
			return "change_goods";
		}else{
			ebuyService.changeGoods(goods);
			model.addAttribute("userList", ebuyService.selectUserById(goods.getSellerid()));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}
	@RequestMapping(value="/del_goods",method= RequestMethod.GET)
	public String del_goods(@RequestParam("uid") int uid,@RequestParam("gid") int gid, Model model){
		ebuyService.delGoods(gid);
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		model.addAttribute("goodsList", ebuyService.selectAllGoods());
		return "ture_index";
	}



	@RequestMapping(value="/my_orders",method= RequestMethod.GET)
	public String my_orders(@RequestParam("type") int type,@RequestParam("uid") int uid, Model model){
		if(type==1){
			model.addAttribute("ordersList", ebuyService.selectOrdersByBuyId(uid));
			model.addAttribute("userList", ebuyService.selectUserById(uid));
		}else{
			model.addAttribute("ordersList", ebuyService.selectOrdersBySellerId(uid));
			model.addAttribute("userList", ebuyService.selectUserById(uid));
		}
		return "show_orders";
	}
	@RequestMapping(value="/linkto_change_orders",method= RequestMethod.GET)
	public String linkto_change_orders(@RequestParam("oid") int oid, Model model){
		model.addAttribute("ordersList", ebuyService.selectOrdersByOId(oid));
		return "change_orders";
	}
	@RequestMapping("/change_orders_fun")
	public String change_orders_fun(Orders orders,BindingResult result, Model model){
		if(result.hasErrors()){
			return "change_orders";
		}else{
			ebuyService.changeOrders(orders);
			model.addAttribute("userList", ebuyService.selectUserById(orders.getBuyid()));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}
	@RequestMapping(value="/del_orders",method= RequestMethod.GET)
	public String del_orders(@RequestParam("uid") int uid,@RequestParam("oid") int oid, Model model){
		ebuyService.delOrders(oid);
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		model.addAttribute("goodsList", ebuyService.selectAllGoods());
		return "ture_index";
	}
	@RequestMapping(value="/goumai",method= RequestMethod.GET)
	public String goumai(@RequestParam("uid") int uid,@RequestParam("gid") int gid,@RequestParam("uid2") int uid2, Model model){
	    if(uid2==0)
        {
            model.addAttribute("userList", ebuyService.selectUserById(uid));
            model.addAttribute("goodsList", ebuyService.selectGoodsByGId(gid));
            return "start_up";
        }else
	    if(uid==uid2)
		{
			model.addAttribute("conn", "不能购买自己发布的商品!!!");
			return "tip";
		}
		else{
			model.addAttribute("userList", ebuyService.selectUserById(uid));
			model.addAttribute("goodsList", ebuyService.selectGoodsByGId(gid));
			return "order_up";
		}
	}
	@RequestMapping("/buy")
	public String buy(Orders orders, BindingResult result, Model model){
		if(result.hasErrors()){
			return "order_up";
		}else{
			Date d = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);
			orders.setSelltime(now);
			ebuyService.addOrders(orders);
			ebuyService.changeGoodsSellstaus(orders.getGid());
			model.addAttribute("userList", ebuyService.selectUserById(orders.getBuyid()));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}

	@RequestMapping("/comments_up")
	public String comments_up(Comments comments, Model model){
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
		comments.setSendtime(now);
		ebuyService.addComments(comments);
		model.addAttribute("userList", ebuyService.selectUserById(comments.getSendid()));
		model.addAttribute("goodsList", ebuyService.selectAllGoods());
		return "ture_index";
	}
	@RequestMapping(value="/linto_change_comment",method= RequestMethod.GET)
	public String linto_change_comment(@RequestParam("uid") int uid,@RequestParam("cid") int cid,@RequestParam("uid2") int uid2, Model model){
		if(uid!=uid2){
			model.addAttribute("conn", "只有留言发布者才能修改留言!!!");
			return "tip";
		}else{
			model.addAttribute("commentsList", ebuyService.selectCommentsByCid(cid));
			return "change_comment";
		}
	}

	@RequestMapping("/change_comments_fun")
	public String change_comments_fun(@Valid Comments comments, Model model){
		if(1!=1){
			model.addAttribute("conn", "只有留言发布者才能更改留言!!!");
			return "tip";
		}else{
			ebuyService.changeComments(comments);
			model.addAttribute("userList", ebuyService.selectUserById(comments.getSendid()));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}
	@RequestMapping(value="/del_comments",method= RequestMethod.GET)
	public String del_comments(@RequestParam("uid") int uid,@RequestParam("cid") int cid,@RequestParam("uid2") int uid2, Model model){
		if(uid!=uid2){
			model.addAttribute("conn", "只有留言发布者才能删除留言!!!");
			return "tip";
		}else{
			ebuyService.delComments(cid);
			model.addAttribute("userList", ebuyService.selectUserById(uid));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}

	@RequestMapping("/add_start")
	public String add_start(Start start, BindingResult result, Model model){
		if(result.hasErrors()){
			return "start_up";
		}else{

			Date d = new Date();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String now = df.format(d);
			start.setCreatetime(now);
			ebuyService.addStart(start);
			model.addAttribute("userList", ebuyService.selectUserById(start.getUid()));
			model.addAttribute("goodsList", ebuyService.selectAllGoods());
			return "ture_index";
		}
	}
	@RequestMapping(value="/linkto_my_start",method= RequestMethod.GET)
	public String linkto_my_start(@RequestParam("uid") int uid, Model model){
		model.addAttribute("startList", ebuyService.selectStartByuid(uid));
		return "my_start";
	}
	@RequestMapping(value="/del_start",method= RequestMethod.GET)
	public String del_start(@RequestParam("uid") int uid,@RequestParam("sid") int sid, Model model){
		ebuyService.delStart(sid);
		model.addAttribute("userList", ebuyService.selectUserById(uid));
		model.addAttribute("goodsList", ebuyService.selectAllGoods());
		return "ture_index";
	}


	@RequestMapping(value="/linkto_message",method= RequestMethod.GET)
	public String linkto_message(@RequestParam("uid") int uid,@RequestParam("uid2") int uid2, Model model){
		if(uid==uid2){
			model.addAttribute("conn", "不能和自己聊天!!!");
			return "tip";
		}else{
			model.addAttribute("userList1", ebuyService.selectUserById(uid));
			model.addAttribute("userList2", ebuyService.selectUserById(uid2));
			model.addAttribute("massagesList1", ebuyService.selectMessagesBysendid(uid,uid2));
			model.addAttribute("massagesList2", ebuyService.selectMessagesBygetid(uid2,uid));
			return "make_message";
		}
	}
	@RequestMapping("/add_messages")
	public String add_messages(Messages messages, BindingResult result, Model model){
		Date d = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String now = df.format(d);
		messages.setSendtime(now);

		ebuyService.addMessages(messages);
		model.addAttribute("userList1", ebuyService.selectUserById(messages.getSendid()));
		model.addAttribute("userList2", ebuyService.selectUserById(messages.getGetid()));
		model.addAttribute("massagesList1", ebuyService.selectMessagesBysendid(messages.getSendid(),messages.getGetid()));
		model.addAttribute("massagesList2", ebuyService.selectMessagesBysendid(messages.getGetid(),messages.getSendid()));
		return "make_message";
	}

	@RequestMapping("/seach")
	public String seach(Goods goods, Model model){
		model.addAttribute("userList", ebuyService.selectUserById(goods.getSellerid()));
		model.addAttribute("goodsList", ebuyService.selectGoodsByGname(goods.getGname()));
		return "make_seach";
	}
}
