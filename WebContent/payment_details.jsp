<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"
	import="com.ostensibly.data.User, com.ostensibly.db.Database"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title
	class="etl-icon icon-global mbr-iconfont mbr-iconfont-menu navbar-logo">ostensibly</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="assets/images/education-186x128.png"
	type="image/x-icon">
<meta name="description" content="">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic&amp;subset=latin">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i">
<link rel="stylesheet"
	href="assets/bootstrap-material-design-font/css/material.css">
<link rel="stylesheet" href="assets/et-line-font-plugin/style.css">
<link rel="stylesheet" href="assets/tether/tether.min.css">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/dropdown/css/style.css">
<link rel="stylesheet" href="assets/animate.css/animate.min.css">
<link rel="stylesheet" href="assets/theme/css/style.css">
<link rel="stylesheet" href="assets/bootstrap/css/mbr-additional.css"
	type="text/css">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all">
<link href="style.css" rel="stylesheet" type="text/css" media="all">
</head>
<body>
	<section id="ext_menu-6">

		<nav class="navbar navbar-dropdown navbar-fixed-top">
			<div class="container">

				<div class="mbr-table">
					<div class="mbr-table-cell">

						<div class="navbar-brand">
							<a href="index.jsp"
								class="etl-icon icon-global mbr-iconfont mbr-iconfont-menu navbar-logo"></a>
							<a class="navbar-caption text-white" href="index.jsp">OSTENSIBLY
								SCHOLASTIC</a>
						</div>

					</div>
					<div class="mbr-table-cell" style="margin-left: 50px;">
						<ul
							class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm"
							id="exCollapsingNavbar">
							<li class="nav-item dropdown open" style="padding-right: -15px;"><a
								class="nav-link link dropdown-toggle" href="#"
								data-toggle="dropdown-submenu" aria-expanded="true"
								style="padding-right: -15px;">USER DETAILS</a>
								<div class="dropdown-menu">
									<a class="dropdown-item"
										href="${pageContext.request.contextPath}/UserDetails?user_type=staff"
										style="padding-right: -30px;">STAFF DETAILS</a> <a
										class="dropdown-item"
										href="${pageContext.request.contextPath}/UserDetails?user_type=student"
										style="padding-right: -10px;">STUDENT DETAILS</a>
								</div></li>
							<li class="nav-item dropdown open" style="padding-right: -15px;">
								<a class="nav-link link dropdown-toggle" href="#"
								data-toggle="dropdown-submenu" aria-expanded="true"
								style="padding-right: -15px;">NOTIFICATIONS</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="course_request.jsp"
										style="padding-right: -30px;">COURSE REQUEST</a><a
										class="dropdown-item" href="payment_details.jsp"
										style="padding-right: -30px;">PAYMENT DETAILS</a><a
										class="dropdown-item" href="material_details.jsp"
										style="padding-right: -10px;">COURSE MATERIAL DETAILS</a><a
										class="dropdown-item" href="assignment_details.jsp"
										style="padding-right: -10px;">ASSIGNMENT DETAILS</a>
								</div>
							</li>
							<li class="nav-item" style="padding-right: 0px;"><a
								class="nav-link link" href="add_course.jsp">ADD COURSE
									DETAILS</a></li>
							<li class="nav-item" style="padding-right: -15px;"><a
								class="nav-link link" href="logout.jsp">LOGOUT</a></li>
						</ul>
						<button hidden="" class="navbar-toggler navbar-close"
							type="button" data-toggle="collapse"
							data-target="#exCollapsingNavbar">
							<div class="close-icon"></div>
						</button>
					</div>

				</div>
		</nav>
	</section>
	<div class="container" style="margin: 150px 0;">
		<h3 style="text-align: center; color: #7e9b9f; font-weight: bold;">Payment
			Details</h3>
		<div style="text-align: center; color: #FF0000; margin-top: 20px;">${errorMessage}</div>
		<div style="text-align: center; color: #008000; margin-top: 20px;">${message}</div>

		<table class="stud" width="90%"
			style="margin-left: 100px; border: 1px solid #000; margin-top: 50px;">
			<tr>
				<th>S.No</th>
				<th>Student Name</th>
				<th>Choose Course Name</th>
				<th>Amount</th>
				<th>Status</th>
			</tr>
			<%
				User currentUser = (User) (session.getAttribute("currentSessionUser"));
				Database db = (Database) getServletContext().getAttribute("db");

				String sql = "select w._id as allotId, p.id as course_id, p.course_name, p.amount, g.id as student_id, g.name as student_name, "
						+ "s.id as staff_id, s.name as staff_name, w.status as status from enrollments w "
						+ "left Join courses p on p.id = w.course_id " + "left join accounts g on g.id = w.student_id "
						+ "left join accounts s on s.course LIKE p.course_name";

				try {
					Statement pstmt = db.getConnection().createStatement();
					ResultSet rs = pstmt.executeQuery(sql);
					int i = 1;
					while (rs.next()) {
			%>
			<tr>
				<td><%=i++%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<%
					String status = "OK";
					if (rs.getInt(9) > 3) {
							status = "Paid";
					}else{
						status = "Not paid";
					}
				%>
				<td><a><%=status%></a></td>
			</tr>
			<%
				}
				} catch (Exception ex) {
					out.println(ex);
				}
			%>
			<!-- <tr>
				<td>1</td>
				<td>xyz</td>
				<td>PHP</td>
				<td>12000</td>
				<td><a>Paid</a></td>
			</tr>
			<tr>
				<td>2</td>
				<td>abc</td>
				<td>CADD</td>
				<td>18000</td>
				<td><a>Not paid</a></td>
			</tr> -->
		</table>
	</div>
	<footer class="mbr-small-footer mbr-section mbr-section-nopadding"
		id="footer1-j"
		style="background-color: #28324e; padding-top: 1.75rem; padding-bottom: 1.75rem;">

		<div class="container">
			<p class="text-xs-center">Copyright (c) 2017 Ostensibly.</p>
		</div>
	</footer>
	<script src="assets/web/assets/jquery/jquery.min.js"></script>
	<script src="assets/tether/tether.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/smooth-scroll/smooth-scroll.js"></script>
	<script src="assets/dropdown/js/script.min.js"></script>
	<script src="assets/touch-swipe/jquery.touch-swipe.min.js"></script>
	<script src="assets/viewport-checker/jquery.viewportchecker.js"></script>
	<script
		src="assets/bootstrap-carousel-swipe/bootstrap-carousel-swipe.js"></script>
	<script src="assets/jarallax/jarallax.js"></script>
	<script src="assets/theme/js/script.js"></script>
	<script src="assets/formoid/formoid.min.js"></script>
	<input name="animation" type="hidden">