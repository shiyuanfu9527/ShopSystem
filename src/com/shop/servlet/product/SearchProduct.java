package com.shop.servlet.product;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.ProductDao;
import com.shop.domain.Product;
@WebServlet("/SearchProduct")
public class SearchProduct extends HttpServlet{
	private static final long serialVersionUID = 1L;
	public SearchProduct() {
		super();
	
	}@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(request, response);
	}
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String pName = request.getParameter("pName");
		ProductDao pd = new ProductDao();
		 ArrayList<Product> list= pd.findLikeByName(pName);
		 request.setAttribute("list", list);
		 request.getRequestDispatcher("product_search.jsp").forward(request, response);
	}
	
	
}
