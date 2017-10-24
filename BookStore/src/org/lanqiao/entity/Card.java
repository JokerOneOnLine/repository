package org.lanqiao.entity;

import java.util.Date;

public class Card {

	public static final int YES = 1;//已用
	public static final int NO = 0;
	private int id;
	private double amount;
	private int isUsed = NO;
	private int userId;
	private Date useDate;
	private String cardKey;

	public String getCardKey() {
		return cardKey;
	}

	public void setCardKey(String cardKey) {
		this.cardKey = cardKey;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public int getIsUsed() {
		return isUsed;
	}

	public void setIsUsed(int isUsed) {
		this.isUsed = isUsed;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public Card(double amount, int isUsed, int userId, Date useDate) {
		super();
		this.amount = amount;
		this.isUsed = isUsed;
		this.userId = userId;
		this.useDate = useDate;
	}

	public Card() {
		super();
	}

	@Override
	public String toString() {
		return "Card [id=" + id + ", amount=" + amount + ", isUsed=" + isUsed + ", userId=" + userId + ", useDate="
				+ useDate + ", cardKey=" + cardKey + "]";
	}

	public Card(double amount, String cardKey) {
		super();
		this.amount = amount;
		this.cardKey = cardKey;
	}
}
