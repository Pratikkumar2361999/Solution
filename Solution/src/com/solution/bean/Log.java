package com.solution.bean;

import java.sql.Timestamp;

public class Log {
	private int lid;
	private String itemname;
	private int bquantity;
	private int rquantity;
	private int oneunitsize;
	private String susername;
	private String cusername;
	private int price;
	private Timestamp boughtat;
	private String dname;
	public int getLid() {
		return lid;
	}
	public void setLid(int lid) {
		this.lid = lid;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public int getBquantity() {
		return bquantity;
	}
	public void setBquantity(int bquantity) {
		this.bquantity = bquantity;
	}
	public int getRquantity() {
		return rquantity;
	}
	public void setRquantity(int rquantity) {
		this.rquantity = rquantity;
	}
	public int getOneunitsize() {
		return oneunitsize;
	}
	public void setOneunitsize(int oneunitsize) {
		this.oneunitsize = oneunitsize;
	}
	public String getSusername() {
		return susername;
	}
	public void setSusername(String susername) {
		this.susername = susername;
	}
	public String getCusername() {
		return cusername;
	}
	public void setCusername(String cusername) {
		this.cusername = cusername;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Timestamp getBoughtat() {
		return boughtat;
	}
	public void setBoughtat(Timestamp boughtat) {
		this.boughtat = boughtat;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	
	
	
}
