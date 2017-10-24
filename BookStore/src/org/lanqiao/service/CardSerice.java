package org.lanqiao.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.lanqiao.dao.CardDao;
import org.lanqiao.entity.Card;
import org.lanqiao.entity.User;
import org.lanqiao.utils.MyUtils;

public class CardSerice {

	public List<Card> creatCards(int amount, int count) {
		List<Card> cards = new ArrayList<Card>();
		for (int i = 0; i < count; i++) {
			String key = MyUtils.getRandomMD5();
			Card c = new Card(amount,key);
			CardDao cDao = new CardDao();
			int j = cDao.insert(c);
			if (j!=0) {
				cards.add(c);
			}
		}
		return cards;
	}

	public String recharge(User user, String key) {
		String msg="";
		//获取充值卡对象
		CardDao cDao = new CardDao();
		Card card =cDao.get(key);
		if (card==null) {
			msg="该充值卡不存在....";
		}else if (card.getIsUsed()==Card.YES) {
			msg="该充值卡已失效....";
		}else {
			//更新用户 充值卡
			user.setBalance(user.getBalance()+card.getAmount());
			new UserService().update(user);
			//card.setAmount(0);
			card.setUserId(user.getId());
			card.setUseDate(new Date());
			card.setIsUsed(Card.YES);
			int i = new CardDao().update(card);
			if (i==0) {
				msg="充值失败";
			}else {
				msg="充值成功";
			}
		}
		return msg;
	}

	public List<Card> getAll() {
		return new CardDao().getAll();
	}

}
