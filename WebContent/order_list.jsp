<%@ page language="java" import="java.util.*,com.shop.dao.*,com.shop.domain.*,com.shop.utils.*,java.sql.*" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<title>订单表</title>
<!--根据设备的宽度调整缩放比例   -->
<meta name="viewport" content="width=device-width,initial-scale=1" />
<!--引入bootstrap的CSS文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css" />
<link rel="stylesheet" href="css/bootstrap-theme.min.css"
	type="text/css" />
<!--引入jquery的js文件-->
<script type="text/javascript" src="js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>

<body>
	<%!ArrayList<Orders> listOrders;%>
	<%
		int cId = 0;
	Customer customer = (Customer) session.getAttribute("customer");
	if (customer != null) {
		cId = customer.getId();
	}
	OrderDao od = new OrderDao();
	listOrders = od.findAlls(cId);
	session.setAttribute("listOrders", listOrders);
	%>
	<!--创建整体布局DIV-->
	<div class="container">
		<%@ include file="head.jsp"%>
		
		<div class="container">
			<div class="row">

				<div style="margin: 0 auto; margin-top: 10px; width: 950px;">
					<strong>我的订单</strong>
					<table class="table table-bordered">
						<tbody>
							
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>数量</th>
								<th>地址</th>
								<th>状态</th>
								<th>订单时间</th>
								<th>发货时间</th>
							</tr>
							<c:forEach var="Orders" items="${sessionScope.listOrders}">
								<c:set var="pid" value="${Orders.pId }"></c:set>
								<tr class="active">
									<td width="60" width="30%"><input type="hidden" name="id"
										value="22"> <a
										href="product_info.jsp?id=${Orders.pId} "> <img
											src="${Orders.pImage}"
											alt="${Orders.pImage}" width="auto"
											height="85px" style="display: inline-block;">
									</a></td>
									<td width="15%"><a target="_blank" href="product_info.jsp?id=${Orders.id}">${Orders.pName}</a>
									</td>
									<td width="5%">${Orders.count}</td>
									<td width="15%">${Orders.address}</td>
									<td width="15%">${Orders.status}</td>
									<td width="10%">${Orders.ordertime}</td>
									<td width="10%">${Orders.delivdate}</td>
								</tr>
							</c:forEach>
							
						</tbody>


					</table>
					 <input name="iPrice" type="hidden" value="${customer.id}">
				</div>
			</div>

			<div style="text-align: center;">
				<ul class="pagination">
					<li class="disabled"><a href="#" aria-label="Previous"><span
							aria-hidden="true">&laquo;</span></a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">6</a></li>
					<li><a href="#">7</a></li>
					<li><a href="#">8</a></li>
					<li><a href="#">9</a></li>
					<li><a href="#" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</ul>
			</div>
		</div>
		<%@ include file="foot.jsp"%>
	</div>
</body>

</html>