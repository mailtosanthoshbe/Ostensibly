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
			$('#myModal3').modal('show');
		} else {
			$('${modal}').modal('show');
		}
	});
</script>
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
					<div class="mbr-table-cell">
						<ul
							class="nav-dropdown collapse pull-xs-right nav navbar-nav navbar-toggleable-sm"
							id="exCollapsingNavbar">
							<li style="display: inline; padding: 0 10px; margin-left: 30px;"><a
								href="#" style="color: #fff;">HOME</a></li>
							<li style="display: inline; padding: 0 10px; color: #fff;"><a
								href="#" data-toggle="modal" data-target="#myModal3"
								style="color: #fff;">LOGIN</a></li>
							<li style="display: inline; padding: 0 10px; color: #fff;"><a
								href="#" data-toggle="modal" data-target="#myModal4"
								style="color: #fff;">STAFF REGISTER</a></li>
							<li style="display: inline; padding: 0 10px; color: #fff;"><a
								href="#" data-toggle="modal" data-target="#myModal5"
								style="color: #fff;">STUDENT REGISTER</a></li>
						</ul>
						<button hidden="" class="navbar-toggler navbar-close"
							type="button" data-toggle="collapse"
							data-target="#exCollapsingNavbar">
							<div class="close-icon"></div>
						</button>
					</div>

				</div>
		</nav>
		<div class="modal " id="myModal3" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<!-- Modal content-->
				<div class="modal-content news-w3l">
					<div class="modal-header">
						<button type="button" class="close w3l" data-dismiss="modal">&times;</button>
						<h4>Login Your Account</h4>
						<!--newsletter-->
						<div class="login-main wthree">
							<form action="/Ostensibly/login" method="post">
								<div style="color: #FF0000;">${errorMessage}</div>
								<div style="color: #008000;">${message}</div>
								<input type="hidden" name="modal" value="#myModal3" /> <input
									type="email" placeholder="Email" required="" name="email">
								<input type="password" placeholder="Password" name="password">
								<select name="Usertype"
									style="width: 450px; height: 50px; border-color: #fff; border-bottom-color: #000; border-bottom: 2px solid;">
									<option value="">Select Your User Type</option>
									<option value="admin">ADMIN</option>
									<option value="staff">STAFF</option>
									<option value="student">STUDENT</option>
								</select> <input type="submit" value="Login">
							</form>
						</div>
						<!--//newsletter-->
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<!-- //Modal3 -->
		<!-- Modal4 -->
		<div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<!-- Modal content-->
				<div class="modal-content news-w3l">
					<div class="modal-header">
						<button type="button" class="close w3l" data-dismiss="modal">&times;</button>
						<h4>Register Now</h4>
						<!--newsletter-->
						<div class="login-main wthree">
							<form action="/Ostensibly/signup" method="post">
								<div style="color: #FF0000;">${errorMessage}</div>
								<input type="hidden" name="modal" value="#myModal4" /> <input
									type="text" placeholder="Name" name="name"> <input
									type="email" placeholder="Email" required name="email">
								<input type="password" placeholder="Password" required
									name="password"> <input type="password"
									placeholder="Confirm Password" name="cpassword"> <input
									type="text" placeholder="Qualification" name="qualification">
								<input type="text" placeholder="Experience" name="experience">
								<input type="text" placeholder="Course" name="course"> <select
									name="gender"
									style="width: 450px; height: 50px; border-color: #fff; border-bottom-color: #000; border-bottom: 2px solid;">
									<option value="">Select Your Gender</option>
									<option value="male">MALE</option>
									<option value="female">FEMALE</option>
									<option value="others">OTHERS</option>
								</select> <input type="text" placeholder="Mobile Number" name="number">
								<input type="text" name="Usertype" value="STAFF"
									readonly="readonly"> <input type="submit"
									value="Register Now">
							</form>
						</div>
						<!--//newsletter-->
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		</div>
		<div class="modal fade" id="myModal5" tabindex="-1" role="dialog">
			<div class="modal-dialog" role="document">
				<!-- Modal content-->
				<div class="modal-content news-w3l">
					<div class="modal-header">
						<button type="button" class="close w3l" data-dismiss="modal">&times;</button>
						<h4>Register Now</h4>
						<!--newsletter-->
						<div class="login-main wthree">
							<form action="/Ostensibly/signup" method="post">
								<div style="color: #FF0000;">${errorMessage}</div>
								<input type="hidden" name="modal" value="#myModal5" /> <input
									type="text" placeholder="Name" name="name"> <input
									type="email" placeholder="Email" required name="email">
								<input type="password" placeholder="Password" required
									name="password"> <input type="password"
									placeholder="Confirm Password" name="cpassword"> <input
									type="text" placeholder="Qualification" name="qualification">
								<select name="gender"
									style="width: 450px; height: 50px; border-color: #fff; border-bottom-color: #000; border-bottom: 2px solid;">
									<option value="">Select Your Gender</option>
									<option value="male">MALE</option>
									<option value="female">FEMALE</option>
									<option value="others">OTHERS</option>
								</select> <input type="text" placeholder="Mobile Number" name="number">
								<input type="text" name="Usertype" value="STUDENT"
									readonly="readonly"> <input type="submit"
									value="Register Now">
							</form>
						</div>
						<!--//newsletter-->
					</div>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		</div>
	</section>
	<section
		class="mbr-slider mbr-section mbr-section__container carousel slide mbr-section-nopadding mbr-after-navbar"
		data-ride="carousel" data-keyboard="false" data-wrap="true"
		data-pause="false" data-interval="5000" id="slider-8">
		<div>
			<div>
				<div>
					<ol class="carousel-indicators">
						<li data-app-prevent-settings="" data-target="#slider-8"
							data-slide-to="0" class="active"></li>
						<li data-app-prevent-settings="" data-target="#slider-8" class=""
							data-slide-to="1"></li>
						<li data-app-prevent-settings="" data-target="#slider-8"
							data-slide-to="2"></li>
					</ol>
					<div class="carousel-inner" role="listbox">
						<div
							class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full active"
							data-bg-video-slide="false"
							style="background-image: url(assets/images/mbr-2000x1333.jpg);">
							<div class="mbr-table-cell">
								<div class="mbr-overlay"></div>
								<div class="container-slide container">

									<div class="row">
										<div class="col-md-8 col-md-offset-2 text-xs-center">
											<h2 class="mbr-section-title display-1">
												E-LEARNING PLATFORM
												<div>
													<br>
												</div>
												<div>
													<em>&nbsp;</em>
												</div>
												<div>
													<span style="line-height: 1.1; font-weight: normal;"><em>"Learning
															is not the product of teaching. Learning is the product
															of the activity of learners."</em></span>
												</div>
												<div>
													<span style="line-height: 1.1; font-weight: normal;"><em>—John
															Holt&nbsp;</em></span>
												</div>
												<div>
													<span style="line-height: 1.1; font-weight: normal;"><em><br></em></span><br>
												</div>
											</h2>
											<p class="mbr-section-lead lead"></p>

											<div class="mbr-section-btn">
												<a class="btn btn-lg btn-white-outline btn-white"
													href="https://mobirise.com">LEARN</a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full"
							data-bg-video-slide="false"
							style="background-image: url(assets/images/application-procedures-2000x945.jpg);">
							<div class="mbr-table-cell">
								<div class="mbr-overlay" style="opacity: 0.5;"></div>
								<div class="container-slide container">

									<div class="row">
										<div class="col-md-8 col-md-offset-2 text-xs-center">
											<h2 class="mbr-section-title display-1">E-LEARNING
												PLATFORM</h2>
											<p class="mbr-section-lead lead">
												<br>"Online learning is not the next big thing, it is
												the now big thing.”<br> - Donna J. Abernathy<br>
											</p>


										</div>
									</div>
								</div>
							</div>
						</div>
						<div
							class="mbr-section mbr-section-hero carousel-item dark center mbr-section-full"
							data-bg-video-slide="false"
							style="background-image: url(assets/images/desktop.jpg);">
							<div class="mbr-table-cell">
								<div class="mbr-overlay"
									style="opacity: 0.5; background-color: rgb(0, 0, 0);"></div>
								<div class="container-slide container">

									<div class="row">
										<div class="col-md-8 col-md-offset-2 text-xs-center">
											<h2 class="mbr-section-title display-1">E-LEARNING
												PLATFORM</h2>
											<p class="mbr-section-lead lead">
												<br>"Learning experiences are like journeys. The
												journey starts where the learning is now, and ends when the
												learner is successful. The end of the journey isn't knowing
												more, it's doing more." <br>—JULIE DIRKSEN
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<a data-app-prevent-settings="" class="left carousel-control"
						role="button" data-slide="prev" href="#slider-8"> <span
						class="icon-prev" aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a> <a data-app-prevent-settings="" class="right carousel-control"
						role="button" data-slide="next" href="#slider-8"> <span
						class="icon-next" aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>
	</section>

	<section class="mbr-cards mbr-section mbr-section-nopadding"
		id="features3-f" style="background-color: rgb(49, 47, 47);">
		<div class="container" style="margin-top: 0px; margin-bottom: -140px;">
			<div class="mbr-section row col-md-12">
				<h3 class="mbr-section-title display-2"
					style="text-align: left; color: #fff; text-indent: 120px; font-size: 50px;">COURSES
					OFFERED</h3>
			</div>
		</div>
	</section>
	<section class="mbr-cards mbr-section mbr-section-nopadding"
		id="features3-f" style="background-color: rgb(49, 47, 47);">
		<div class="mbr-cards-row row" style="margin-top: -50px;">
			<div class="mbr-cards-col col-xs-12 col-lg-3"
				style="padding-top: 20px; padding-bottom: 80px; line-height: 23px;">
				<div class="container">
					<div class="card cart-block">
						<div class="card-img">
							<img src="assets/images/table.jpg" class="card-img-top">
						</div>
						<div class="card-block">
							<h4 class="card-title">PHP</h4>
							<h5 class="card-subtitle">Core PHP</h5>
							<p class="card-text">IT has been noted as one of the most
								reliable and proven frameworks and Mobirise has been equipped to
								develop websites using this framework.</p>
							<div class="card-btn">
								<a href="#" class="btn btn-info">MORE</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mbr-cards-col col-xs-12 col-lg-3"
				style="padding-top: 20px; padding-bottom: 80px;">
				<div class="container">
					<div class="card cart-block">
						<div class="card-img">
							<img src="assets/images/desktop.jpg" class="card-img-top">
						</div>
						<div class="card-block">
							<h4 class="card-title">Responsive</h4>
							<h5 class="card-subtitle">One of Bootstrap 4's big points</h5>
							<p class="card-text">One of Bootstrap 4's big points is
								responsiveness and Mobirise makes effective use of this by
								generating highly responsive website for you.</p>
							<div class="card-btn">
								<a href="#" class="btn btn-info">MORE</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mbr-cards-col col-xs-12 col-lg-3"
				style="padding-top: 20px; padding-bottom: 80px;">
				<div class="container">
					<div class="card cart-block">
						<div class="card-img">
							<img src="assets/images/coworkers.jpg" class="card-img-top">
						</div>
						<div class="card-block">
							<h4 class="card-title">Web Fonts</h4>
							<h5 class="card-subtitle">Google has a highly exhaustive
								list of fonts</h5>
							<p class="card-text">Google has a highly exhaustive list of
								fonts compiled into its web font platform and Mobirise makes it
								easy for you to use them on your website easily and freely.</p>
							<div class="card-btn">
								<a href="#" class="btn btn-info">MORE</a>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="mbr-cards-col col-xs-12 col-lg-3"
				style="padding-top: 20px; padding-bottom: 80px;">
				<div class="container">
					<div class="card cart-block">
						<div class="card-img">
							<img src="assets/images/code-man.jpg" class="card-img-top">
						</div>
						<div class="card-block">
							<h4 class="card-title">Unlimited Sites</h4>
							<h5 class="card-subtitle">It gives you the freedom to
								develop</h5>
							<p class="card-text">It gives you the freedom to develop as
								many websites as you like given the fact that it is a desktop
								app.given the fact that it is a desktop app.</p>
							<div class="card-btn">
								<a href="#" class="btn btn-info">MORE</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section
		class="mbr-footer footer4 mbr-section mbr-section-md-padding mbr-background"
		id="contacts4-i"
		style="background-image: url(assets/images/book-2000x1334.jpg); padding-top: 90px; padding-bottom: 90px;">
		<div class="mbr-overlay"
			style="opacity: 0.4; background-color: rgb(0, 0, 0);"></div>
		<div class="container">
			<div class="mbr-contacts row">
				<div class="col-sm-8">
					<div class="row">
						<div class="col-sm-6">
							<p>
								<strong>Address</strong><br> 1234 Street Name<br>
								City, AA 99999<br> <br> <br> <strong>Contacts</strong><br>
								Email: support@xyz.com<br> Phone: +1 (0) 000 0000 001<br>
								Fax: +1 (0) 000 0000 002
							</p>
						</div>
						<div class="col-sm-6">
							<p class="mbr-contacts__text">
								<strong>Links</strong>
							</p>
							<ul class="mbr-contacts__list">
								<li><a class="text-white" href="https://mobirise.com/">Website
										builder</a></li>
								<li><a class="text-white"
									href="https://mobirise.com/mobirise-free-win.zip">Download
										for Windows</a></li>
								<li><a class="text-white"
									href="https://mobirise.com/mobirise-free-mac.zip">Download
										for Mac</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<form action="#" method="post">
						<div class="form-group">
							<label class="form-control-label" for="contacts4-i-email">Email<span
								class="form-asterisk">*</span></label> <input type="email"
								class="form-control input-sm input-inverse" name="email"
								required="" data-form-field="Email" id="contacts4-i-email">
						</div>
						<div class="form-group">
							<label class="form-control-label" for="contacts4-i-message">Message</label>
							<textarea class="form-control input-sm input-inverse"
								name="message" data-form-field="Message" rows="4"
								id="contacts4-i-message"></textarea>
						</div>
						<div class="mbr-buttons mbr-buttons--right btn-inverse">
							<button type="submit" class="btn btn-sm btn-info">Contact
								us</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</section>

	<section class="mbr-section" id="form2-l"
		style="background-color: rgb(49, 47, 47); padding-top: 120px; padding-bottom: 120px;">
		<div
			class="mbr-section mbr-section__container mbr-section__container--middle">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 text-xs-center">
						<h3 class="mbr-section-title display-2"
							style="font-size: 50px;!important">SUBSCRIBE FORM</h3>
						<small class="mbr-section-subtitle">Subscribe to our
							Newsletter</small>
					</div>
				</div>
			</div>
		</div>
		<div class="mbr-section mbr-section-nopadding">
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-lg-10 col-lg-offset-1"
						data-form-type="formoid">
						<div data-form-alert="true">
							<div hidden="" data-form-alert-success="true">Thanks for
								filling out form!</div>
						</div>
						<form class="mbr-form" action="#" method="post"
							data-form-title="SUBSCRIBE FORM">
							<input type="hidden"
								value="1rMaw0ZWJo4VrXFx8SRW3k1zSGXy5uxDlYMakhEaXPU8+ADwm0wauNcbDsVlBTP8W65tofPKU4wcI0K63ibsAgZkYiaN7v4wZCJJ/Xn3KPWSnHWvywy2M0OPAYAo1uRx"
								data-form-email="true">
							<div class="mbr-subscribe mbr-subscribe-dark input-group">
								<input type="email" class="form-control" name="email"
									required="" data-form-field="Email"
									placeholder="Enter Your Email Address..." id="form2-l-email">
								<span class="input-group-btn"><button type="submit"
										class="btn btn-info">SUBSCRIBE</button></span>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

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