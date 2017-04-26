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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var status = '${status_code}';
		console.log('status: ', status);
		if (status == 200) {
			$('#myModal4').modal('show');
		}
	});
</script>

<!-- <script type="text/javascript">
	$(document).on("click", ".myModalClass", function (e) {
	
	    e.preventDefault();
	
	    var _self = $(this);
	
	    var myBookId = _self.data('id');
	    console.log("ID: ");
	    console.log(myBookId);
	    
	});
</script> -->
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
		<h3 style="text-align: center; color: #7e9b9f; font-weight: bold;">Staff
			Details</h3>
		<table class="stud" width="90%"
			style="margin-left: 100px; border: 1px solid #000; margin-top: 50px;">
			<tr>
				<th>S.No</th>
				<th>Staff Name</th>
				<th>Email Id</th>
				<th>Qualification</th>
				<th>Mobile Number</th>
				<th>full info</th>
			</tr>
			<%
				// retrieve your list from the request, with casting 
				ArrayList<User> list = (ArrayList<User>) request.getAttribute("list");

				// print the information about every category of the list
				int i = 1;
				for (User user : list) {
			%>
			<tr>
				<td><%=i++%></td>
				<td><%=user.getName()%></td>
				<td><%=user.getEmail()%></td>
				<td><%=user.getQualification()%></td>
				<td><%=user.getMobile()%></td>
				<%-- <td><a
					href="${pageContext.request.contextPath}/UserDetails?user_type=common&redirect=staff_details.jsp&uid=<%=user.getId()%>">view full info</a></td> --%>
				<td><a href="${pageContext.request.contextPath}/UserDetails?user_type=student" data-toggle="modal" data-target="#myModal4"
					class="myModalClass" data-id=<%=user.getId()%>>view full info</a></td>
			</tr>
			<%
				}
			%>
		</table>
	</div>
	<!-- Modal4 -->
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<!-- Modal content-->

			<script type="text/javascript">
				$(function() {
					$(".myModalClass").click(function() {
										var my_id_value = $(this).data('id');
										console.log("Inside script modal");
										console.log(my_id_value);
										
										<sql:setDataSource var="snapshot" driver="org.sqlite.JDBC"
										     url="jdbc:sqlite:ostensibly.db"/>
										 
										<sql:query dataSource="${snapshot}" var="result">
										SELECT * from courses where id = my_id_value;
										</sql:query>
										 
										
										<c:forEach var="row" items="${result.rows}">
										$(".col-md-7 #ans1").text("${row.id}" );
										$(".col-md-7 #ans2").text( my_id_value );
										$(".col-md-7 #ans3").text( my_id_value );
										$(".col-md-7 #ans4").text( my_id_value );
										$(".col-md-7 #ans5").text( my_id_value );
										$(".col-md-7 #ans6").text( my_id_value );
										$(".col-md-7 #ans7").text( my_id_value );
										</c:forEach>

							        
										/* $(".col-md-7 #ans1").text( my_id_value );
										$(".col-md-7 #ans2").text( my_id_value );
										$(".col-md-7 #ans3").text( my_id_value );
										$(".col-md-7 #ans4").text( my_id_value );
										$(".col-md-7 #ans5").text( my_id_value );
										$(".col-md-7 #ans6").text( my_id_value );
										$(".col-md-7 #ans7").text( my_id_value ); */
										
									})
				});
				/* $('document').ready(function() {
					var status = '${status_code}';
					console.log('status: ', status);
					if (status == 200) {
						$('#myModal3').modal('show');
					} else {
						$('${modal}').modal('show');
					}
				}); */
			</script>
			<%-- <%
				String id = (String)my_id_value;
				Database db = (Database) getServletContext().getAttribute("db");

				String sql = "select * from accounts where id = " + id;
				User user = new User();
				try {
					Statement pstmt = db.getConnection().createStatement();
					ResultSet rs = pstmt.executeQuery(sql);
					while (rs.next()) {
						user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
								rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10));
					}
				} catch (Exception ex) {
					out.println(ex);
				}
			%>
			<div class="modal-content news-w3l">
				<div class="modal-header">
					<button type="button" class="close w3l" data-dismiss="modal">&times;</button>
					<h4>Profile Info</h4>
					<span id="hidden" style="margin-top: 20px;"></span><br> <img
						src="assets/images/s1.jpg" width="50%" class="img-responsive">

					<!--newsletter-->
					<div class="col-md-7" id="userprofile">
						<label id="text" style="font-weight: bold;">Name</label> <span
							id="ans1" style="margin-left: 100px;"><%=id%></span><br> <br>
						<label id="text" style="font-weight: bold;">Email-id</label> <span
							id="ans2" style="margin-left: 80px;"><%=user.getEmail()%></span><br>
						<br> <label id="text" style="font-weight: bold;">Qualification</label>
						<span id="ans3" style="margin-left: 50px;"><%=user.getQualification()%></span><br>
						<br> <label id="text" style="font-weight: bold;">Experience</label>
						<span id="ans4" style="margin-left: 60px;"><%=user.getExperience()%></span><br>
						<br> <label id="text" style="font-weight: bold;">Course</label>
						<span id="ans5" style="margin-left: 90px;"><%=user.getCourse()%></span><br>
						<br> <label id="text" style="font-weight: bold;">Gender</label>
						<span id="ans5" style="margin-left: 90px;"><%=user.getGender()%></span><br>
						<br> <label id="text" style="font-weight: bold;">Mobile
							No.</label> <span id="ans7" style="margin-left: 60px;"><%=user.getMobile()%></span><br>
						<br>
					</div>
					<!--//newsletter-->
				</div>
			</div> --%>
			<div class="modal-content news-w3l">
				<div class="modal-header">
					<button type="button" class="close w3l" data-dismiss="modal">&times;</button>
					<h4>Profile Info</h4>
					<span id="hidden" style="margin-top: 20px;"></span><br> <img
						src="assets/images/s1.jpg" width="50%" class="img-responsive">

					<!--newsletter-->
					<div class="col-md-7" id="userprofile">
						<label id="text" style="font-weight: bold;">Name</label> <span
							id="ans1" style="margin-left: 100px;"></span><br> <br>
						<label id="text" style="font-weight: bold;">Email-id</label> <span
							id="ans2" style="margin-left: 80px;"></span><br>
						<br> <label id="text" style="font-weight: bold;">Qualification</label>
						<span id="ans3" style="margin-left: 50px;"></span><br>
						<br> <label id="text" style="font-weight: bold;">Experience</label>
						<span id="ans4" style="margin-left: 60px;"></span><br>
						<br> <label id="text" style="font-weight: bold;">Course</label>
						<span id="ans5" style="margin-left: 90px;"></span><br>
						<br> <label id="text" style="font-weight: bold;">Gender</label>
						<span id="ans6" style="margin-left: 90px;"></span><br>
						<br> <label id="text" style="font-weight: bold;">Mobile
							No.</label> <span id="ans7" style="margin-left: 60px;"></span><br>
						<br>
					</div>
					<!--//newsletter-->
				</div>
			</div>
		</div>
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