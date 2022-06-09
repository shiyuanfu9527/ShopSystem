<%@ page language="java"
	import="java.util.*,com.shop.dao.*,com.shop.domain.*,com.shop.utils.*,java.sql.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>购物车</title>
<!--根据设备的宽度调整缩放比例   -->
<meta name="viewport" content="width=device-width,initial-scale=1" />
<!--引入bootstrap的CSS文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css"
	type="text/css" />
<!--引入jquery的js文件-->
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="../js/cart.js"></script>
</head>
<body>
	<%!ArrayList<ShopCart> listShopCart;
	%>
	<%
		int cId = 0;
	Customer customer = (Customer) session.getAttribute("customer");
	if (customer != null) {
		cId = customer.getId();
	}
	ShopCartDao scd = new ShopCartDao();
	listShopCart = scd.findAll(cId);

	session.setAttribute("listShopCart", listShopCart);
	
	
	%>
	<!-- 头部DIV -->
	<%@include file="head.jsp"%>
	<!-- 主体DIV  -->
	<div class="container">
		<div class="row">
			<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
				<strong style="font-size: 16px; margin: 5px 0;">购物车详情</strong>
				<table class="table table-bordered">
					<tbody>
						<tr class="warning">
							<th>图片</th>
							<th>商品</th>
							<th>价格</th>
							<th>数量</th>
							<th>小计</th>
							<th>操作</th>
						</tr>
						<c:set var="sum" value="0"></c:set>
						<c:forEach var="shopcart" items="${sessionScope.listShopCart}">
							<c:set var="pid" value="${shopcart.pId}" />
							<c:set var="pcount" value="${shopcart.count}" />
							<tr class="active">
								<td width="60" width="40%"><input type="hidden" name="id"
									value="22"> <a
									href="product_info.jsp?id=${shopcart.pId}"> <img
										src="${shopcart.pImage}"
										alt="${shopcart.pName}" width="auto" height="85px"
										style="display: inline-block;">
								</a>
								<td width="30%"><a target="_blank"
									href="product_info.jsp?id=${shopcart.pId}">${shopcart.pName}</a>
								</td>
								<td width="20%">${shopcart.iPrice}元</td>
								<td width="10%">${shopcart.count}</td>
								<td width="15%"><span class="subtotal">￥${shopcart.totolPrice}元</span></td>
								<td><a href="DelShopCart?id=${shopcart.id}" class="delete">删除</a></td>
							</tr>
							<c:set var="sum" value="${sum + shopcart.totolPrice}"></c:set>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div style="text-align: right; margin-right: 120px;">
				合计金额: <strong style="color: #ff6600;">￥${sum}</strong>
			</div>
		</div>
		<div>
			<hr />
			<form class="form-horizontal" action="AddOrder" method="post"
				id="form" style="margin-top: 5px; margin-left: 150px;">
				<input name="pId" type="hidden" value="${sessionScope.product.id }" >
				
				<div class="form-group">
					<label for="address" class="col-sm-1 control-label">地址</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="address"
						name="address"	placeholder="请输入收货地址">
					</div>
				</div>
				<div class="form-group">
					<label for="inputPassword3" class="col-sm-1 control-label">收货人</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="inputPassword3"
							placeholder="请输收货人" value="${sessionScope.customer.username}">
					</div>
				</div>
				<div class="form-group">
					<label for="confirmpwd" class="col-sm-1 control-label">电话</label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="confirmpwd"
							placeholder="请输入联系方式" value="${sessionScope.customer.tel}">
					</div>
				</div>


				<hr />
				<div style="margin: 20px 0 10px 0;; text-align: center;">
					<input
						style="background: url('./images/finalbutton.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 50px; width: 200px;"
						value="" type="submit">

				</div>

				<!-- 				<div style="margin-top:5px;margin-left:150px;"> -->
				<!-- 					<hr /> -->
				<!-- 					<p style="text-align:right;margin-right:100px;"> -->
				<!-- 						<a -->

				<!-- 							href="javascript:document.getElementById('form').submit();"> -->
				<!-- 							<img src="./images/finalbutton.gif" width="204" height="51" -->
				<!-- 							border="0" /> -->
				<!-- 						</a> -->
				<!-- 					</p> -->
				<!-- 					<hr /> -->
				<!-- 				</div></form> -->
			</form>
		</div>
	</div>
	<%@include file="foot.jsp"%>
</body>
</html>