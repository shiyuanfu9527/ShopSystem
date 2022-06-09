package com.shop.servlet.shopcart;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.dao.ProductDao;
import com.shop.dao.ShopCartDao;
import com.shop.domain.Product;
import com.shop.domain.ShopCart;
import com.shop.utils.DBUtil;

import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;

@WebServlet("/AddShopCart")
public class AddShopCart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddShopCart() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
                 request.setCharacterEncoding("UTF-8");
                 response.setContentType("text/html;charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			int id = 0;
			String cid = request.getParameter("cId");
			int pId = Integer.parseInt(request.getParameter("pId"));
			String pName = request.getParameter("pName");
			String pImage = request.getParameter("pImage");
			BigDecimal iPrice = new BigDecimal(Double.valueOf(request.getParameter("iPrice")));
			int count = Integer.parseInt(request.getParameter("count"));
			String isBuy = request.getParameter("isBuy");

			// 计算总价
			BigDecimal totolPrice;
			BigDecimal unitPrice;// 商品单价
			ProductDao pd = new ProductDao();
			Product p = new Product();
			p = pd.find(pId);
			unitPrice = p.getiPrice();
			totolPrice = unitPrice.multiply(new BigDecimal(Integer.valueOf(count)));
			request.getSession().setAttribute("product", p);
			int cId = 0;
            DBUtil db = new DBUtil();
            ShopCartDao scd = new ShopCartDao();
            ShopCart sc = new ShopCart();
			if (cid.length() != 0 && scd.find(pId)==null) {
				// 用户已登录
				cId = Integer.parseInt(cid);
				
				
				String sql = "insert into shopcart(cId,pId,pName,pImage,iPrice,count,isBuy,totalPrice) values(?,?,?,?,?,?,?,?)";
				Object[] params = { cId, pId, pName, pImage, iPrice,count, isBuy, totolPrice };
				int n = db.doUpdate(sql, params);
				if (n > 0) {
					// 添加购物车成功
					out.println("<script>alert('添加成功！')</script>");
					
					sc.setId(id);
					sc.setcId(cId);
					sc.setpId(pId);
					sc.setpName(pName);
					sc.setpImage(pImage);
					sc.setiPrice(iPrice);
					sc.setCount(count);
					sc.setIsBuy(isBuy);
					sc.setTotolPrice(totolPrice);
					request.getSession().setAttribute("shopcart", sc);
				} else {
					// 添加购物车失败
					out.println("<script>alert('添加失败！')</script>");

				}
			}else if (cid.length()!=0&&scd.find(pId) != null) {
				     sc  =	scd.find(pId);
				    int Count = 0;
					String sql = "update shopcart set count=?,totalPrice=?  where pId=?";
					Count = sc.getCount()+count;
					totolPrice = unitPrice.multiply(new BigDecimal(Integer.valueOf(Count)));
					Object[] params = {Count,totolPrice,pId};
					sc.setpId(pId);
				 db.doUpdate(sql,params);
				}
			else {
				out.println("<script>alert('请先登录')</script>");
			}

			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
