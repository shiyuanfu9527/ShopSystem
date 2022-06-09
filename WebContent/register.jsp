<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>在线注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<script src="js/jquery-1.12.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/my.js"></script>
<!-- 引入自定义css文件 style.css -->
<link rel="stylesheet" href="css/style.css" type="text/css" />

<style>
body {
	margin-top: 20px;
	margin: 0 auto;
}

.carousel-inner .item img {
	width: 100%;
	height: 300px;
}

.container .row div {
	/* position:relative;
	 float:left; */
	
}

font {
	color: #3164af;
	font-size: 18px;
	font-weight: normal;
	padding: 0 10px;
}
</style>
</head>

<body>
	<div class="container">
		<%@ include file="head.jsp"%>

		<div class="container"
			style="width: 100%; background: url('image/regist_bg.jpg');">
			<div class="row">

				<div class="col-md-2"></div>

				<div class="col-md-8"
					style="background: #fff; padding: 40px 80px; margin: 30px; border: 7px solid #ccc;">
					<font>会员注册</font>USER REGISTER
					<form name="registerform" id="registerform" action="Register"
						method="post" class="form-horizontal" style="margin-top: 5px;">

						<div class="form-group">
							<label for="username" class="col-sm-2 control-label">用户名</label>
							<div class="col-sm-6">
								<input name="username" type="text" class="form-control" id="username"
									 placeholder="请输入用户名"
									>
							</div>
						</div>

						<div class="form-group">
							<label for="inputPassword" class="col-sm-2 control-label">密码</label>
							<div class="col-sm-6">
								<input name="password"  type="password" class="form-control" id="password"
									placeholder="请输入密码">
							</div>
						</div>

						<div class="form-group">
							<label for="confirmpwd" class="col-sm-2 control-label">确认密码</label>
							<div class="col-sm-6">
								<input type="password" class="form-control" id="confirmpwd"
									name="rapwd" placeholder="请输入确认密码">
							</div>
						</div>

						<div class="form-group">
							<label for="inputTel" class="col-sm-2 control-label">手机</label>
							<div class="col-sm-6">
								<input name="tel" id="tel" type="tel" class="form-control" id="inputTel"
									 placeholder="手机">
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" width="100" value="注册" name="submit"
									style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
							<div class="col-sm-offset-2 col-sm-10">
								<input type="reset" width="100" value="重置" name="submit"
									style="background: url('./images/register.gif') no-repeat scroll 0 0 rgba(0, 0, 0, 0); height: 35px; width: 100px; color: white;">
							</div>
						</div>
					</form>
				</div>

				<div class="col-md-2"></div>

			</div>
		</div>
		<%@ include file="foot.jsp"%>
	</div>
</body>

</html>