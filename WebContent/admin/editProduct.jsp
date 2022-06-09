<%@ page language="java" import="java.util.*,com.shop.dao.*,com.shop.domain.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    Product p = new Product();
    ArrayList<Kind> listKind;
    %>
    <%
    
//     	String id = request.getParameter("id");
    int id = Integer.parseInt(request.getParameter("id"));
    	ProductDao pd = new ProductDao();
    	p = pd.find(id);
    	session.setAttribute("p",p);
    	KindDao kd = new KindDao();
        listKind = kd.findAll();
        session.setAttribute("listKind", listKind);
    out.println(id);
    %>
	<h3>修改商品</h3>
	<form action="EditProduct" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>商品名称</td>
				
				<td><input name="pName" type="text" value="${sessionScope.p.pName}"/>
				<input name="id" type="hidden" value="${sessionScope.p.id}"></td>
			</tr>
			<tr>
				<td>商品描述</td>
				<td><textarea name="pDesc" id="" cols="30" rows="10" ></textarea></td>
			</tr>
			<tr>
				<td>商品库存</td>
				<td><input name="pNum" type="text" value="${sessionScope.p.pNum}"/></td>
			</tr>
			<tr>
				<td>商品生产日期</td>
				<td><input name="pubTime" type="date" value="${sessionScope.p.pubTime}" /></td>
			</tr>
			<tr>
				<td>商品保质期(天)</td>
				<td><input name="pKeepTime" type="text" value="${sessionScope.p.pKeepTime}"/></td>
			</tr>
			<tr>
				<td>商品图片</td>
				<td><input name="pImage" type="file" /></td>
			</tr>
			<tr>
				<td>商品类别</td>
				<td><select name="kId" id="kId">
				        <c:forEach var="kind" items="${sessionScope.listKind}">
				            <option selected value="${kind.id}">${kind.kName}</option>
				        </c:forEach>
				</select></td>
			</tr>
			<tr>
				<td>网站价格</td>
				<td><input name="iPrice" type="text" value="${sessionScope.p.iPrice }"/></td>
			</tr>
			<tr>
				<td>市场价格</td>
				<td><input name="mPrice" type="text" value="${sessionScope.p.mPrice }"/></td>
			</tr>
			<tr>
				<td>是否是热图</td>
				<td><input type="radio" name="isHot" value="是">是 <input
					type="radio" name="isHot" value="否">否</td>
			</tr>
			<tr>
				<td>是否在首页显示</td>
				<td><input type="radio" name="isShow" value="是">是 <input
					type="radio" name="isShow" value="否">否</td>
			</tr>
			<tr>
			    <td rowspan="2"><input type="submit" value="修改"/></td>
			</tr>
		</table>
	</form>
</body>
</html>