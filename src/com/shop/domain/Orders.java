package com.shop.domain;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Orders {
	private int id;
	private int cId;
	private int pId;
	private String pName;
	private String pImage;
	private int count;
	private String address;
	private List<Orders> items = new ArrayList<Orders>();
    private String status;
    private Date delivdate;
    private Date ordertime;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public String getpImage() {
		return pImage;
	}

	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public String getaddress() {
		return address;
	}

	public void setaddress(String address) {
		this.address = address;
	}

	public List<Orders> getItems() {
		return items;
	}

	public void setItems(List<Orders> items) {
		this.items = items;
	}
	public String getstatus() {
		return status;
	}

	public void setstatus(String status) {
		this.status = status;
	}
	public Date getdelivdate() {
		return delivdate;
	}
	public void setdelivdate(Date delivdate) {
		this.delivdate = delivdate;
	}
	public Date getordertime() {
		return ordertime;
	}
	public void setordertime(Date ordertime) {
		this.ordertime = ordertime;
	}
}
