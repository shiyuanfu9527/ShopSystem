<%@ page language="java"
	import="java.util.*,com.shop.dao.*,com.shop.domain.*"
	contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="cmn-Hans-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/admin.css" />
<script src="../js/admin.js"></script>
</head>
<body>
	<%!
	ArrayList<Orders> listOrders;
%>
	<% 
 
  OrderDao od = new OrderDao();
	listOrders = od.findAll();
	session.setAttribute("listOrders", listOrders);
%>
	<div class="details">
	
		<!--表格-->
		<table class="table">
			<thead>
				<tr>
					<th width="5%">顾客ID</th>
					<th width="10%">商品ID</th>
					<th width="5%">商品名字</th>
					<th width="10%">商品图片</th>
					<th width="5%">商品数量</th>				
					<th width="10%">下单日期</th>
					<th width="5%">订单状态</th>
					<th width="15%">地址</th>
					<th width="10%">发货日期</th>				
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="order" items="${sessionScope.listOrders}">
					<tr>
					  <td width="5%">${order.cId}</td>
					  <td width="10%">${order.pId}</td>
					  <td width="5%">${order.pName}</td>
					  <td width="10%"><img width="100%" height="auto" src="${pageContext.servletContext.contextPath}/${order.pImage}" alt="商品图片" /></td>
					  <td width="5%">${order.count}</td>
					  <td width="10%">${order.ordertime}</td>
					  <td width="5%">${order.status}</td>
					  <td width="15%">${order.address}</td>	
					  <td width="10%">${order.delivdate}</td>
					<td align="center"><input id="deliv" type="button" value="发货"
							class="btn" onclick="delivOrder('${order.id}')"> <input
							id="del" type="button" value="删除" class="btn"
							onclick="delOrder('${order.id}')">
					</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>