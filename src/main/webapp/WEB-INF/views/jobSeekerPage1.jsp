<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<title>Job Seeker Account</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link href="${pageContext.request.contextPath}/resources/css/tabs.css" type="text/css" rel="stylesheet">
<style>
</style>

<script type="text/javascript">
	Page.ClientScript.RegisterStartupScript(this.GetType(),"clearHistory","ClearHistory();",true);
	</script>

</head>
<body>
	<jsp:include page="jobseekerHeader.jsp"></jsp:include>


	<div class="container">
		<div class="row" style="min-height: 300px;">
			<div class="col-sm-10">
				<div>
					<p>
						<br />
					</p>
				</div>
				<div>
					<p>
						<br />
					</p>
				</div>
				<div>
					<p>
						<br />
					</p>
				</div>

				<h3>Welcome user: ${sessionScope.userObj.firstName}</h3>


				<div class="col-xs-2">
					<!-- required for floating -->
					<!-- Nav tabs -->
					<ul class="nav nav-tabs tabs-left">
						<li class="active"><a href="${pageContext.request.contextPath}/jshome.htm">View Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/updateProfile.htm">Edit Profile</a></li>
						<li><a href="${pageContext.request.contextPath}/resume.htm">Resume</a></li>
						<li><a href="${pageContext.request.contextPath}/getJobRecords.htm?pageNumber=0">View Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/appliedList.htm">Applied Jobs</a></li>
						<li><a href="${pageContext.request.contextPath}/searchJobInList.htm">Search Jobs</a></li>
					</ul>
				</div>

				<div class="col-xs-10">
				<div class="container">
				<div><p><br/></p></div>
				<div class="col-lg-6 ">
					<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
					  <ol class="carousel-indicators">
						<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
						<li data-target="#carousel-example-generic" data-slide-to="1"></li>
						<li data-target="#carousel-example-generic" data-slide-to="2"></li>
					  </ol>					
					  <!-- slides -->
					  <div class="carousel-inner">
						<div class="item active">
						  <img src="resources/images/carose3.jpg" alt="">
						</div>
						<div class="item">
						  <img src="resources/images/carose2.jpg" alt="">
						</div>
						<div class="item">
						  <img src="resources/images/carose4.jpg" alt="">
						</div>
					  </div>
					</div>		
				</div>
				
			</div>
			</div>
			</div>
			</div>
			</div>
			</body>
			</html>
		