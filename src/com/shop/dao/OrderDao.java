package com.shop.dao;

import java.util.ArrayList;

import com.shop.domain.Orders;
import com.shop.domain.Product;
import com.shop.domain.ShopCart;
import com.shop.utils.DBUtil;

public class OrderDao extends DBUtil{
	public ArrayList<Orders> findAll(int Cid) {
		String sql = "select * from shopcart where cId = ? order by id";
		ArrayList<Orders> list = new ArrayList<Orders>();
		Object[] params = {Cid};
		try {
			this.rs = this.doQuery(sql, params);
			while (rs.next()) {
				Orders os = new Orders();
				
				os.setcId(rs.getInt(2));
				os.setpId(rs.getInt(3));
				os.setpName(rs.getString(4));
				os.setpImage(rs.getString(5));
				os.setCount(rs.getInt(6));
				
				list.add(os);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return null;
	}
	public boolean insert(Orders os) {
		String sql = "insert into Orders(cId,pId,pName,pImage,count,address,ordertime) values(?,?,?,?,?,?,?)";
		Object[] params = { os.getcId(),os.getpId(),os.getpName(),os.getpImage(),os.getCount(),os.getaddress(),os.getordertime()};
		try {
			int n = this.doUpdate(sql, params);
			if (n > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}

		return false;
	}
	public ArrayList<Orders> findAlls(int Cid) {
		String sql = "select * from orders where cId = ? order by id";
		ArrayList<Orders> list = new ArrayList<Orders>();
		Object[] params = {Cid};
		try {
			this.rs = this.doQuery(sql, params);
			while (rs.next()) {
				Orders os = new Orders();
				
				os.setpId(rs.getInt(3));
				os.setpName(rs.getString(4));
				os.setpImage(rs.getString(5));
				os.setCount(rs.getInt(6));
				os.setstatus(rs.getString(7));
				os.setaddress(rs.getString(8));
				os.setordertime(rs.getDate(9));
				os.setdelivdate(rs.getDate(10));
				list.add(os);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return null;
	}
	public ArrayList<Orders> findAll() {
		String sql = "select * from orders  order by id";
		ArrayList<Orders> list = new ArrayList<Orders>();
		Object[] params = null;
		try {
			this.rs = this.doQuery(sql, params);
			while (rs.next()) {
				Orders os = new Orders();
				os.setId(rs.getInt(1));
				os.setcId(rs.getInt(2));
				os.setpId(rs.getInt(3));
				os.setpName(rs.getString(4));
				os.setpImage(rs.getString(5));
				os.setCount(rs.getInt(6));
				os.setstatus(rs.getString(7));
				os.setaddress(rs.getString(8));
				os.setordertime(rs.getDate(9));
				os.setdelivdate(rs.getDate(10));
				list.add(os);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return null;
	}
	public boolean delete(int id) {
		String sql = "delete from orders where id="+id;
		try {
			int n = this.doUpdate(sql);
			if (n > 0) {
				return true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return false;
	}

}
