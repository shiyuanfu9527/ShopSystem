package com.shop.servlet.order;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.OrderDao;
import com.shop.dao.ProductDao;
import com.shop.dao.ShopCartDao;
import com.shop.domain.Customer;
import com.shop.domain.Orders;
import com.shop.domain.Product;
import com.shop.domain.Sales;
import com.shop.domain.ShopCart;
import com.shop.utils.DBUtil;


public class DelivOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DelivOrder() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			request.setCharacterEncoding("UTF-8");
			
			String parma = request.getParameter("id");
			int id = Integer.parseInt(parma);
			PrintWriter out = response.getWriter();
			String status = "已发货";
			Date delivdate = new Date();
			
			String sql = "update orders set status=?,delivdate=? where id=?";
			Object[] params = { status, delivdate,id};
			DBUtil db = new DBUtil();
			db.doUpdate(sql, params);
			out.println("deliv sucess!");
			String stayTime = "3000";
			String URL = "listOrder.jsp";
			String content=stayTime+";URL="+URL;
			response.setHeader("REFRESH",content); 
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
