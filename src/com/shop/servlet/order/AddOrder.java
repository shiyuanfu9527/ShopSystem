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

@WebServlet("/AddOrder")
public class AddOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddOrder() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer customer = (Customer) request.getSession().getAttribute("customer");
		int cId = customer.getId();
		String address = request.getParameter("address");
		OrderDao od = new OrderDao();
		ArrayList<Orders> listSales = od.findAll(cId);	
		Date ordertime = new Date();
		
		for(Orders i:listSales) {
			Orders os = new Orders();
		    os.setcId(i.getcId());
		    os.setpId(i.getpId());
		    os.setpName(i.getpName());
		    os.setpImage(i.getpImage());
		    os.setCount(i.getCount());
		    os.setaddress(address);
		    os.setordertime(ordertime);
		   od.insert(os);
		}
		DBUtil db = new DBUtil();
		String sql="truncate table shopcart";		
		db.doUpdate(sql);
		
		request.getRequestDispatcher("order_list.jsp").forward(request, response);
	
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
