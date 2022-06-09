package com.shop.dao;

import java.util.ArrayList;

import com.shop.domain.Product;
import com.shop.domain.Sales;
import com.shop.domain.ShopCart;
import com.shop.utils.DBUtil;
public class SalesDao extends DBUtil{
	public ArrayList<Sales> findAll() {
		String sql = "select * from sales order by id";
		ArrayList<Sales> list = new ArrayList<Sales>();
		String[] params = null;
		try {
			this.rs = this.doQuery(sql, params);
			while (rs.next()) {
				Sales s = new Sales();
				s.setId(rs.getInt(1));
				s.setcId(rs.getInt(2));
				s.setpId(rs.getInt(3));
				s.setCount(rs.getInt(4));
				s.setTotalPrice(rs.getBigDecimal(5));
				s.setOrderDate(rs.getDate(6));
				s.setInvoiceNo(rs.getString(7));
				s.setOrderStatus(rs.getString(8));
				s.setDelivDate(rs.getDate(9));
				s.setAddress(rs.getString(10));
				list.add(s);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return null;
}
	}
