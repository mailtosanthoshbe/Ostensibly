<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.ostensibly.data.User"%>
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
	<%
		User currentUser = (User) (session.getAttribute("currentSessionUser"));
	%>

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
							<li class="nav-item" style="padding-right: -15px;"><a
								class="nav-link link" href="staff_profile.jsp">DASHBOARD</a>
							<li class="nav-item" style="padding-right: -15px;"><a
								class="nav-link link" href="student_details1.html">STUDENT
									DETAILS</a>
							<li class="nav-item" style="padding-right: -15px;"><a
								class="nav-link link" href="assignment_assign.html">ASSIGNMENT
									ASSIGNING</a></li>
							<li class="nav-item" style="padding-right: -15px;"><a
								class="nav-link link" href="material_post.html">MATERIALS</a></li>
							<li class="nav-item dropdown open" style="padding-right: -15px;">
								<a class="nav-link link dropdown-toggle" href="#"
								data-toggle="dropdown-submenu" aria-expanded="false"
								style="padding-right: -15px;">NOTIFICATIONS</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="course_allotment.jsp"
										style="padding-right: -30px;">COURSE ALLOTMENT</a><a
										class="dropdown-item" href="assignment_submission.html"
										style="padding-right: -10px;">ASSIGNMENT SUBMISSION
										DETAILS</a><a class="dropdown-item" href="discussion.html"
										style="padding-right: -10px;">DISCUSSION</a>
								</div>
							</li>
							<li class="nav-item dropdown open" style="padding-right: -15px;">
								<a class="nav-link link dropdown-toggle" href="#"
								data-toggle="dropdown-submenu" aria-expanded="false"
								style="padding-right: -15px;">SETTINGS</a>
								<div class="dropdown-menu">
									<a class="dropdown-item" href="staff_profile.jsp"
										style="padding-right: -30px;">PROFILE INFO</a><a
										class="dropdown-item" href="changepwd.html"
										style="padding-right: -10px;">CHANGE PASSWORD</a><a
										class="nav-link link" href="logout.jsp">LOGOUT</a>
								</div>
							</li>
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

	<div class="container" id="p" style="margin-top: 150px;">
		<h2 style="text-align: center; color: #7e9b9f; font-weight: bold;">Profile
			Info</h2>
		<br> <br>
		<div class="row">


			<div class="col-md-5">
				<img src="assets/images/s1.jpg" width="50%" class="img-responsive" id="profile_img"><br>
				<br>
				<form action="${pageContext.request.contextPath}/UserDetails" method="post" enctype='multipart/form-data'>
					<input type="hidden" name="action" value="upload_profile_img" />
					<input style="display: none" type="file" id="my_file" name="uid" >
					<input type="submit" style="display: none" name="url" id="save_profile_img" />
					<div style="text-align: left; color: #FF0000; margin-top: 20px;" id="msg_upload"></div>
					<button type="button" class="btn btn-info" id="get_file" name="get_file"
							style="font-size: 16px; padding: 5px 10px;">Edit Your Profile</button>
					<script type="text/javascript">
						document.getElementById('get_file').onclick = function() {
						    //document.getElementById('my_file').click();
						    console.log("open file");
						    document.getElementById('my_file').click();
					    	$('input[type=file]').change(function (e) {
					    		var filepath = $(this).val();
					    		document.getElementById("msg_upload").innerHTML = $(this).val();
					    	    //$('#customfileupload').html($(this).val());
					    	    for (var i = 0; i < e.originalEvent.srcElement.files.length; i++) {
       
						        var file = e.originalEvent.srcElement.files[i];
						        console.log("file", file);
						        var reader = new FileReader();
						        reader.onloadend = function() {
							    	$('#profile_img').attr('src', reader.result);
						        }
						        reader.readAsDataURL(file);
						        
						        /* //send to servlet for savn
						        //send to servlet for saving filepath
						         document.getElementById("save_profile_img").click(function (e) {
						        	//$('#save_profile_img').innerHTML("hello");
						        	 console.log("open file proile");
								}); */
						    }
					    	});
						};
					</script>
				</form>
			</div>
			<div class="col-md-7" id="userprofile">
				<label id="text" style="font-weight: bold;">Name</label> <span
					id="ans1" style="margin-left: 100px;"><%=currentUser.getName()%></span><br>
				<br> <label id="text" style="font-weight: bold;">Email-id</label>
				<span id="ans2" style="margin-left: 80px;"><%=currentUser.getEmail()%></span><br>
				<br> <label id="text" style="font-weight: bold;">Qualification</label>
				<span id="ans3" style="margin-left: 50px;"><%=currentUser.getQualification()%></span><br>
				<br> <label id="text" style="font-weight: bold;">Experience</label>
				<span id="ans4" style="margin-left: 60px;"><%=currentUser.getExperience()%></span><br>
				<br> <label id="text" style="font-weight: bold;">Course</label>
				<span id="ans5" style="margin-left: 90px;"><%=currentUser.getCourse()%></span><br>
				<br> <label id="text" style="font-weight: bold;">Gender</label>
				<span id="ans5" style="margin-left: 90px;"><%=currentUser.getGender()%></span><br>
				<br> <label id="text" style="font-weight: bold;">Mobile
					No.</label> <span id="ans7" style="margin-left: 60px;"><%=currentUser.getMobile()%></span><br>
				<br>
			</div>
		</div>

		<br> <br> <br> <br>
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
</body>
</html>