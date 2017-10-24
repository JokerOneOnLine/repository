package org.lanqiao.dao;

import java.util.List;

import org.lanqiao.entity.Card;
import org.lanqiao.utils.MyUtils;

public class CardDao extends BaseDao<Card> {

	public int insert(Card c) {
		int cardId = MyUtils.getId();
		String sql = "insert into cards values (?,?,?,null,null,?)";
		int update = update(sql, cardId, c.getAmount(), c.getIsUsed(), c.getCardKey());
		return update;
	}

	public Card get(String ckey) {
		String sql = "select * from cards where cardkey = ?";
		Card t = getT(sql, ckey);
		return t;
	}

	public int update(Card card) {
		String sql = "update cards set id=?,amount=?,isused=?,userid=?,usedate=?where cardkey=?";
		return update(sql, card.getId(), card.getAmount(), card.getIsUsed(), card.getUserId(),
				new java.sql.Date(card.getUseDate().getTime()), card.getCardKey());
	}

	public List<Card> getAll() {
		String sql = "select * from cards";
		List<Card> cards = getTs(sql);
		return cards;
	}
}
