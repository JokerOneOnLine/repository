package org.lanqiao.entity;

public class User {
	public static final int FEMAIL=0;
	public static final int MAIL=1;
	private int id;
	private  String name;
	private  int gender=MAIL;//性别
	private  String profile="profiles/default.png" ;//头像
	private  String pwd;
	private  int age;
	private double balance;
	private String email;
	private Cart cart;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public double getBalance() {
		return balance;
	}
	public void setBalance(double balance) {
		this.balance = balance;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", gender=" + gender + ", profile=" + profile + ", pwd=" + pwd
				+ ", age=" + age + ", balance=" + balance + ", email=" + email + "]";
	}
	
	
	public User(String name, String pwd) {
		super();
		this.name = name;
		this.pwd = pwd;
		
	}
	public User() {
		super();
	}
	public User(String name, String pwd, String email) {
		super();
		this.name = name;
		this.pwd = pwd;
		this.email = email;
	}
	
}
