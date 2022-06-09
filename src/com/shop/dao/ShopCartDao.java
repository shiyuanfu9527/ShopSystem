package com.shop.dao;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.shop.domain.ShopCart;
import com.shop.utils.DBUtil;
public class ShopCartDao extends DBUtil{

	/**
	 * 插入一个product对象
	 * 
	 * @param cust
	 * @return
	 */
	public boolean insert(ShopCart sc) {
		String sql = "insert into shopcart(cId,pId,pName,pImage,iPrice,count,isBuy,totalPrice) values(?,?,?,?,?,?,?,?)";
		Object[] params = { sc.getcId(),sc.getpId(),sc.getpName(),sc.getpImage(),sc.getiPrice(),sc.getCount(),sc.getIsBuy(),sc.getTotolPrice()};
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

	/**
	 * 按照ID删除购物车商品
	 * 
	 * @param id 购物车商品ID
	 * @return
	 */
	public boolean delete(int id) {
		String sql = "delete from shopcart where id="+id;
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

	/**
	 * 修改购物车商品
	 * 
	 * @param p
	 * @return
	 */
	public boolean update(ShopCart sc) {
		String sql = "update  set cId=?,pId=?,count=?,isBuy=?,totalPrice=? where id=?";
		Object[] params = { 
		    sc.getcId(),
		    sc.getpId(),
		    sc.getpName(),
		    sc.getpImage(),
		    sc.getiPrice(),
		    sc.getCount(),
		    sc.getIsBuy(),
		    sc.getTotolPrice(),
		    sc.getId()
		};
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

	/**
	 * 按照Name查找购物车商品
	 * 
	 * @param id 购物车商品ID 
	 * @return
	 */
	public ShopCart find(int pId) {
		String sql = "select * from shopcart where pId = "+pId;
		try {
			this.rs = this.doQuery(sql);
			if (rs.next()) {
				ShopCart sc = new ShopCart();
				sc.setId(rs.getInt(1));
				sc.setcId(rs.getInt(2));
				sc.setpId(rs.getInt(3));
				sc.setpName(rs.getString(4));
				sc.setpImage(rs.getString(5));
				sc.setiPrice(rs.getBigDecimal(6));
				sc.setCount(rs.getInt(7));
				sc.setIsBuy(rs.getString(8));
				sc.setTotolPrice(rs.getBigDecimal(9));
				return sc;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return null;
	}
	/**
	 * 查找某用户id的所有购物车
	 * 
	 * @return
	 */
	public ArrayList<ShopCart> findAll(int Cid) {
		String sql = "select * from shopcart where cId = ? order by id";
		ArrayList<ShopCart> list = new ArrayList<ShopCart>();
		Object[] params = {Cid};
		try {
			this.rs = this.doQuery(sql, params);
			while (rs.next()) {
				ShopCart sc = new ShopCart();
				sc.setId(rs.getInt(1));
				sc.setcId(rs.getInt(2));
				sc.setpId(rs.getInt(3));
				sc.setpName(rs.getString(4));
				sc.setpImage(rs.getString(5));
				sc.setiPrice(rs.getBigDecimal(6));
				sc.setCount(rs.getInt(7));
				sc.setIsBuy(rs.getString(8));
				sc.setTotolPrice(rs.getBigDecimal(9));
				list.add(sc);
			}
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			this.close();
		}
		return null;
	}
	public ShopCart getShopCart(ResultSet rs) {
		try{
			if(rs != null) {
				ShopCart sc = new ShopCart();
				sc.setId(rs.getInt(1));
				sc.setcId(rs.getInt(2));
				sc.setpId(rs.getInt(3));
				sc.setpName(rs.getString(4));
				sc.setpImage(rs.getString(5));
				sc.setiPrice(rs.getBigDecimal(6));
				sc.setCount(rs.getInt(7));
				sc.setIsBuy(rs.getString(8));
				sc.setTotolPrice(rs.getBigDecimal(9));
				return sc;
			}else{
				return null;
			}
		}catch(Exception e ) {
			e.printStackTrace();
		}
		return null;
	}
	public ArrayList<ShopCart> findAlls(int Cid) {
		String sql = "select * from shopcart where cId = ? order by id";
		ArrayList<ShopCart> list = new ArrayList<ShopCart>();
		Object[] params = {Cid};
		try {
			this.rs = this.doQuery(sql, params);
			while (rs.next()) {
				ShopCart sc = new ShopCart();			
				sc.setcId(rs.getInt(2));
				sc.setpId(rs.getInt(3));
				sc.setpName(rs.getString(4));
				sc.setpImage(rs.getString(5));
				sc.setCount(rs.getInt(7));
				list.add(sc);
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
